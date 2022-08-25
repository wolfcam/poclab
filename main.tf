resource "google_compute_instance" "novavm" {
  name         = "${var.nomemaquina}"
  machine_type = "${var.flavormaquina}"
  zone         = "${var.maquinazona}"
  boot_disk {
    initialize_params {
      image = "${var.sodisco}"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

output "Name" {
  value = google_compute_instance.novavm.name
}

output "External_IP" {
  value = google_compute_instance.novavm.network_interface[0].access_config[0].nat_ip
}

output "Internal_IP" {
  value = google_compute_instance.novavm.network_interface[0].network_ip
}

output "Platform" {
    value = google_compute_instance.novavm.cpu_plaform
}

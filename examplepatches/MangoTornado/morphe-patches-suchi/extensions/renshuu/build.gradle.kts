extension {
    name = "extensions/renshuu.mpe"
}

android {
    namespace = "suchi.morphe.extension.renshuu"
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

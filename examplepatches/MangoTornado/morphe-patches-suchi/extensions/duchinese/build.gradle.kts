extension {
    name = "extensions/duchinese.mpe"
}

android {
    namespace = "suchi.morphe.extension.duchinese"
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

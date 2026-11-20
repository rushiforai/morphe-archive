extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "de.deconta.extension"
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

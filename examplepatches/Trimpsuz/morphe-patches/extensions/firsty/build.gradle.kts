extension {
    name = "extensions/firsty/autoreward.mpe"
}

android {
    namespace = "app.morphe.extension"
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

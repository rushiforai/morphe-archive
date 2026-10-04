extension {
    name = "extensions/tiktok.mpe"
}

android {
    namespace = "app.onlynazril.extension.tiktok"
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
}

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.immersivekeyboard.extension"

    defaultConfig {
        // Shizuku's minimum. Gboard itself needs a much newer Android than this.
        minSdk = 24
    }
}

dependencies {
    implementation("dev.rikka.shizuku:api:13.1.5")
    implementation("dev.rikka.shizuku:provider:13.1.5")
}

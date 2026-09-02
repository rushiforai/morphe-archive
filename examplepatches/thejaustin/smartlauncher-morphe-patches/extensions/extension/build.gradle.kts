extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "com.autocat.morphe.smartlauncher.extension"
    defaultConfig {
        minSdk = 24
    }
}

configurations.all {
    exclude(group = "org.jetbrains.kotlin")
    exclude(group = "org.jetbrains")
}

dependencies {
    // Shizuku API must be bundled into the extension DEX so that
    // ShizukuArchiveHelper's Class.forName("rikka.shizuku.Shizuku") resolves
    // at runtime inside the patched Smart Launcher process.
    implementation(libs.rikka.shizuku.api)
}

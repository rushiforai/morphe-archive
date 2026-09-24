extension {
    name = "extensions/maloja.mpe"
}

android {
    namespace = "app.enigma.extension"

    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    // Provided at runtime by the official Morphe shared extension. Never bundled here.
    compileOnly(libs.morphe.extensions.library)
}

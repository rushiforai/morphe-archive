extension {
    name = "extensions/twitch.mpe"
}

android {
    namespace = "io.github.bakwudo.uyu.extension"
    // Morphe's default is 36. 37 is the platform installed in the dev environment; the extension
    // only uses old APIs, so the value does not matter otherwise.
    compileSdk = 37

    defaultConfig {
        // Twitch 31.3.1 requires Android 8.0. Morphe's default is 23.
        minSdk = 26
    }
}

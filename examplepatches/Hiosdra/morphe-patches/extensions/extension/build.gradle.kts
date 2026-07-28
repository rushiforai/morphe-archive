extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "io.github.hiosdra.patches.extension.backgroundplayback"
    compileSdk = 35

    defaultConfig {
        minSdk = 29
        targetSdk = 35
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

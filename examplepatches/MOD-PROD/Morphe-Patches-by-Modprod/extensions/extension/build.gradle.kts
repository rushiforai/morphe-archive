extension {
    // Path of the compiled extension inside the .mpp. Patches load it with extendWith(...).
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.gonzo.extension"
    compileSdk = 36

    defaultConfig {
        // Must be at or below the minSdk of TizenTube Cobalt; lower is always safe.
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly(libs.annotation)
}

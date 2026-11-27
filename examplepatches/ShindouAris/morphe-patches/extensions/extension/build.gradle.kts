extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "org.ungoogled.extension"

    defaultConfig {
        // The Maps build we patch runs on Android 10 (minSdk 29), so lint holds us to API 29.
        minSdk = 29
    }

    // The Waze Mod Data API (src/main/aidl/com/wazemod/api), read on Android Auto.
    buildFeatures {
        aidl = true
    }
}

// The extension is plain Java. Without this the Kotlin Gradle plugin's default
// stdlib dependency gets dexed into the extension -- ~1,100 kotlin.* classes
// merged into Maps for nothing.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

dependencies {
    // Cronet's proxy API, which Maps bundles; see stub/.
    compileOnly(project(":extensions:extension:stub"))
}

dependencies {
    // Experimental: Android Auto through the Car App Library. Maps carries only a gutted, renamed
    // copy of it, so the real one is bundled (with what it needs: lifecycle, core, annotations).
    implementation("androidx.car.app:app:1.9.0-alpha01")
}

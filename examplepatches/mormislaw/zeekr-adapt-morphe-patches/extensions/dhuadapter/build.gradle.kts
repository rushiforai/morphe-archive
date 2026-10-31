extension {
    name = "extensions/dhuadapter.mpe"
}

android {
    namespace = "com.dhuadapter"

    defaultConfig {
        // AppComponentFactory, the entry point of the adapter, exists since API 28.
        minSdk = 28
    }
}

// Pure Java extension. AGP adds kotlin-stdlib by itself, which would be merged into
// the target app and collide with the app's own kotlin.* classes.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
    exclude(group = "org.jetbrains", module = "annotations")
}

dependencies {
    // Pine hooking engine (classes are merged into the extension DEX).
    // Its native libpine.so is bundled by the patches project, see patches/build.gradle.kts.
    implementation(libs.pine)
}

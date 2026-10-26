// AGP 9 provides Kotlin support itself, so no Kotlin Android plugin is applied here.

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.kyurem39.extension"

    // The Morphe sheet shows the patch version, so it is baked in from the release version.
    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        buildConfigField("String", "PATCH_VERSION", "\"${rootProject.version}\"")
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

// The extension is injected into an app whose Kotlin runtime was shrunk by R8. Nothing here needs
// Kotlin, and shipping the stdlib would merge (and collide with) the app's own shrunk copy, so it
// is kept out of the extension entirely.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

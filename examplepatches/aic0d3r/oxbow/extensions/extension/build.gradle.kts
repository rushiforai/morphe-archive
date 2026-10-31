extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "com.feurstagram.extension"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        // Stamped in so the updater can tell two patch bundles for the same Instagram
        // version apart: versionName stays Instagram's, so nothing else changes per bundle.
        buildConfigField("String", "BUNDLE_VERSION", "\"${project.version}\"")
    }
}

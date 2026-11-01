dependencies {
    implementation(project(":extensions:shared:library"))
}

extension {
    name = "extensions/shared.mpe"
}

android {
    // Unique per extension to avoid install-time package collisions.
    namespace = "app.hushpinterest.extension.shared"

    defaultConfig {
        // The library it carries runs only inside Pinterest 14.42.0, which declares this same API 29.
        minSdk = 29
    }
}

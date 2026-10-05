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
        // The library it carries runs only inside Pinterest 449, which declares API 28.
        minSdk = 28
    }
}

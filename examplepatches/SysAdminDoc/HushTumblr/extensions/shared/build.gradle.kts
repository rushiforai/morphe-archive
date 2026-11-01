dependencies {
    implementation(project(":extensions:shared:library"))
}

extension {
    name = "extensions/shared.mpe"
}

android {
    // Unique per extension to avoid install-time package collisions.
    namespace = "app.hushtumblr.extension.shared"

    defaultConfig {
        // The library it carries runs only inside Tumblr 46.9.1.100, which declares API 26.
        minSdk = 26
    }
}

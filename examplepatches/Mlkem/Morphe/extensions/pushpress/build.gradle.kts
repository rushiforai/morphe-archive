extension {
    name = "extensions/pushpress-crossfit-only.mpe"
}

android {
    namespace = "ca.mikem.pushpress.extension"
}

// Pure Java extension: the target app owns its runtime libraries.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
}

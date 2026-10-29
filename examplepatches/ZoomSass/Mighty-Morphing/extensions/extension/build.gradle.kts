extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

// The extension is plain Java. Joey already ships its own Kotlin runtime.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
}

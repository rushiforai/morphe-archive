extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.fakhradio.extension"
}

// The extension is plain Java. Without this the plugin bundles the whole Kotlin
// stdlib into the .mpe, and its classes would be merged over the app's own,
// R8-renamed copies of the same kotlin.* classes.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
}

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

// The extension is plain Java. Keep the Kotlin stdlib the plugin adds out of the dex: it would
// be merged into the target app, whose own (R8-renamed) copy of the same classes it collides with.
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

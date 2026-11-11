extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.polishapps.extension"
}

// The extension is plain Java. Keep the Kotlin stdlib out of extension.mpe, otherwise Morphe merges
// those classes into the (Kotlin, R8 obfuscated) app that is being patched.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

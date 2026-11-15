extension {
    name = "extensions/kakao.mpe"
}

android {
    namespace = "app.kmaps.extension.kakao"
}

// The extension is plain Java. Keep the Kotlin stdlib (added by the extension plugin) out of the .mpe: the patcher
// merges extension classes into same-named app classes, which would modify the app's own Kotlin runtime.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
    exclude(group = "org.jetbrains", module = "annotations")
}

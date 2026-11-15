extension {
    name = "extensions/naver.mpe"
}

android {
    namespace = "app.kmaps.extension.naver"
}

dependencies {
    compileOnly(project(":extensions:naver:stub"))
}

// The extension is plain Java. Keep the Kotlin stdlib (added by the extension plugin) out of the .mpe: the patcher
// merges extension classes into same-named app classes, which would modify the app's own Kotlin runtime.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
    exclude(group = "org.jetbrains", module = "annotations")
}

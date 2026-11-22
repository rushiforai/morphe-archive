extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

// The stub module mirrors the app's own passport SDK types. `compileOnly` keeps those mirrors out of
// the shipped dex, so the login classes we compile against them link to the real ones in the APK.
dependencies {
    compileOnly(project(":extensions:extension:stub"))
}

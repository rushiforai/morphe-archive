extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // Present in the Letterboxd APK at runtime; not bundled.
    compileOnly("androidx.fragment:fragment:1.8.5")
    compileOnly("androidx.annotation:annotation:1.9.1")
    // For MaterialButton, to match trailer_button's own style (StreamingButton).
    compileOnly("com.google.android.material:material:1.12.0")
}

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.pyflat.extension"
}

dependencies {
    // Provided by the patched apps at runtime.
    compileOnly("androidx.media3:media3-common:1.10.1")
    compileOnly("androidx.media3:media3-ui:1.10.1")
}

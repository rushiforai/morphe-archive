extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.stremiobridge.extension"
}

dependencies {
    // These classes already exist in the patched app at runtime, so they
    // are compileOnly here to avoid duplicating them into our extension DEX.
    compileOnly("androidx.fragment:fragment:1.6.2")
    compileOnly("com.google.android.material:material:1.11.0")
}

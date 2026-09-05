extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.supreme.extension"
}

dependencies {
    // Provided by the patched app at runtime; needed only to compile the interceptor.
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
}

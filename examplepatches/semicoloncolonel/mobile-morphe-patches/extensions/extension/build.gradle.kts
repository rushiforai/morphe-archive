extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "semicoloncolonel.mobilestream.extension"
}

dependencies {
    // OkHttp is bundled in the target apps at runtime. It is only needed here
    // to compile TrackerBlocker's interceptor.
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
}

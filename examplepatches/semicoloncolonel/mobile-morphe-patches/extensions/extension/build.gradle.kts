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
    // Google Play's Task API is bundled in every app that asks for a Play
    // review. It is only needed here to compile RatingPromptBlocker.
    compileOnly("com.google.android.gms:play-services-tasks:18.2.0")
}

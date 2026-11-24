extension {
    name = "extensions/sing-runtime.mpe"
}

android {
    namespace = "app.voidhack.extension.applemusic.sing"
    defaultConfig {
        minSdk = 24
    }
}

dependencies {
    implementation(libs.onnxruntime.android)
}

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "dev.sfehhrths.ekispert.extension"

    defaultConfig {
        // Target app (jp.co.val.expert.android.aio 3.53.0) declares minSdkVersion 32.
        minSdk = 32
    }
}

dependencies {
    // The target app bundles OkHttp 5.3.2 (okhttp3.OkHttp.VERSION). compileOnly: the app's
    // own copy is used at runtime, nothing from here is merged into the extension DEX.
    compileOnly(libs.okhttp)
}

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
    // Every supported Curve 5.63.0 APK requires Android 9 or newer.
    defaultConfig { minSdk = 28 }
}

dependencies {
    // Curve 5.63.0 already ships this version; never bundle a second AndroidX copy.
    compileOnly("androidx.appcompat:appcompat:1.8.0")
    compileOnly("androidx.recyclerview:recyclerview:1.4.0")
}

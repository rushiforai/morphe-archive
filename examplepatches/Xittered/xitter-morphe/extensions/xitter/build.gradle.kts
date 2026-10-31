extension {
    name = "extensions/xitter.mpe"
}

android {
    namespace = "app.xitter.extension"
    defaultConfig {
        minSdk = 28
    }
}

dependencies {
    // provided by the app at run time (X 12.19 ships OkHttp 4.12.0)
    compileOnly(libs.okhttp)
}

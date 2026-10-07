plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.mix.extension.reddit"
    compileSdk = 36
    defaultConfig {
        minSdk = 23
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.volley)
}

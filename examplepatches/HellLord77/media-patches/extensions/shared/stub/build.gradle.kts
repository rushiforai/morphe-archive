dependencies {
    api(libs.gson)
    api(libs.okhttp)
    api(libs.retrofit)
}

plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.morphe.extension.shared"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
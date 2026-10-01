dependencies {
    api(libs.gson)
    api(libs.okhttp)
    api(libs.retrofit)
}

plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 21
    }
}

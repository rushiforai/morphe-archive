plugins {
    alias(libs.plugins.android.library) 
}

android {
    namespace = "app.morphe.extension.syncup"
    compileSdk = 36
    defaultConfig {
        minSdk = 23
    }
}

dependencies {
    implementation(libs.morphe.extensions.library)
    compileOnly(libs.annotation)
    compileOnly(libs.okhttp)
}

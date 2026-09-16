plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.morphe.extension.shared"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // Bundled into extensions/shared.mpe, so the classes reach the patched app.
    implementation(libs.morphe.extensions.library)
    implementation(libs.instagram.morphe.extensions.library)

    compileOnly(libs.annotation)
    compileOnly(libs.appcompat)
}

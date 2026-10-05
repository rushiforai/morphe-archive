plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.morphe.extension.shared"
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // Shared in-app code: logging, plus the widgets (the bottom sheet and its theme contract). `api`
    // puts the classes on the dex of the module that is bundled into the app, and app extension
    // modules compile against them through this module's
    // `compileOnly(project(":extensions:shared:library"))`.
    api(libs.piko.extension.library)

    implementation(libs.morphe.extensions.library)
    compileOnly(libs.annotation)
    compileOnly(libs.appcompat)
}

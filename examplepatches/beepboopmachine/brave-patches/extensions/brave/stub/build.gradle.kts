plugins {
    id(libs.plugins.android.library.get().pluginId)
}

android {
    namespace = "dev.brave.extension.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

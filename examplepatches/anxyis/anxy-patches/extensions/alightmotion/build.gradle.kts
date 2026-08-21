plugins {
    id("com.android.library")
}

android {
    namespace = "anxyis.morphe.extension.alightmotion"
    compileSdk = 34

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

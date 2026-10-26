plugins {
    id("com.android.application")
}

android {
    namespace = "app.neteaseja.xposed"
    compileSdk = 34

    defaultConfig {
        applicationId = "app.neteaseja.xposed"
        minSdk = 23
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
}

dependencies {
    // Classic Xposed API is not on Maven Central, so a minimal
    // compile-only stub jar is vendored (runtime classes always come
    // from the Xposed framework on device and are never bundled).
    compileOnly(files("../stub-api.jar"))
}

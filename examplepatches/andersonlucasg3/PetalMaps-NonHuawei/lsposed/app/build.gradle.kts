plugins {
    id("com.android.application")
}

android {
    namespace = "com.petalmaps.hiddenapi"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.petalmaps.hiddenapi"
        minSdk = 27
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            // Personal module installed locally via the LSPosed manager: sign
            // the release build with the local debug keystore (auto-generated).
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // Compile-time stubs of the legacy Xposed API (de.robv.android.xposed).
    // Must stay compileOnly: LSPosed rejects modules that bundle the API classes.
    compileOnly(project(":xposed-api"))

    // Hidden API exemption bootstrap (Unsafe variant + LSPass fallback).
    // Bundled into the module APK.
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:6.1")

    // The library references androidx.annotation classes; bundle them so the
    // module is self-contained in the hooked process.
    implementation("androidx.annotation:annotation:1.10.0")
}

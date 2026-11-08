import org.jetbrains.kotlin.gradle.dsl.JvmTarget

// Spike module (single-apk): a deliberately resource-free Compose screen. It is built into an
// APK only to obtain its classes*.dex, which are then placed *before* the engine dexes in
// single-apk/build-single-apk-compose.ps1. No app resources may be referenced: the dex is
// dropped into the Apple Music engine APK, whose resource table is the only one that exists.
plugins {
    id("com.android.application") version "9.4.1"
    id("org.jetbrains.kotlin.plugin.compose") version "2.4.21"
}

android {
    namespace = "com.anderson.applemusic.probe.compose"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.anderson.applemusic.probe.compose"
        minSdk = 29
        targetSdk = 34
        versionCode = 1
        versionName = "0.1"
    }

    buildFeatures {
        compose = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    buildTypes {
        // Signed afterwards with the Morphe certificate; same versions as tv-app/car-app.
        debug {
            signingConfig = null
        }
        release {
            isMinifyEnabled = false
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

dependencies {
    val composeBom = platform("androidx.compose:compose-bom:2026.06.01")
    implementation(composeBom)
    implementation("androidx.compose.foundation:foundation")
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.activity:activity-compose:1.13.0")
}

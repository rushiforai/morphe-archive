import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    // AGP 9 (already on the build classpath through the Morphe settings plugin)
    // has built-in Kotlin support: applying org.jetbrains.kotlin.android would fail.
    id("com.android.application")
    id("org.jetbrains.kotlin.plugin.compose") version "2.4.21"
}

android {
    namespace = "com.anderson.applemusic.tv"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.anderson.applemusic.tv"
        minSdk = 29
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildFeatures {
        compose = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    buildTypes {
        // The debug APK is signed afterwards with the Morphe certificate (the app
        // shares android:sharedUserId with Apple Music), so the default
        // ~/.android/debug.keystore is deliberately not used.
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
    implementation("androidx.tv:tv-material:1.1.0")
    implementation("androidx.activity:activity-compose:1.13.0")
    implementation("androidx.lifecycle:lifecycle-runtime-compose:2.10.0")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.10.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.10.2")
    implementation("io.coil-kt.coil3:coil-compose:3.5.0")
    implementation("io.coil-kt.coil3:coil-network-okhttp:3.5.0")
}

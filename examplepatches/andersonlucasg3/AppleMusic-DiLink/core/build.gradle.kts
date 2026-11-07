import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    // Same setup as :tv-app — AGP 9 brings its own Kotlin support, so applying
    // org.jetbrains.kotlin.android would fail.
    id("com.android.library")
}

android {
    namespace = "com.anderson.applemusic.core"
    compileSdk = 36

    defaultConfig {
        minSdk = 29
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

dependencies {
    // @Immutable only: the models are consumed by Compose UIs (:tv-app, future
    // :car-app), so the annotation is part of this module's public ABI. No Compose
    // UI dependency here.
    api("androidx.compose.runtime:runtime:1.11.4")
}

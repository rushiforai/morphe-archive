/*
 * Backdrop by Kyant: https://github.com/Kyant0/AndroidLiquidGlass (module "backdrop").
 * The sources in src/ are copied unchanged; see libs/README.md. Only this build file is ours:
 * it keeps the Android target of the original Kotlin Multiplatform module.
 */
plugins {
    id("org.jetbrains.kotlin.multiplatform")
    id("com.android.kotlin.multiplatform.library")
    alias(libs.plugins.kotlin.compose)
}

kotlin {
    android {
        namespace = "com.kyant.backdrop"
        compileSdk = 37
        minSdk = 23
    }

    sourceSets {
        commonMain.dependencies {
            implementation(libs.compose.foundation)
            implementation(libs.compose.ui)
            implementation(libs.compose.ui.graphics)
            implementation(libs.kyant.shapes)
            implementation(libs.jetbrains.annotations)
        }
    }
}

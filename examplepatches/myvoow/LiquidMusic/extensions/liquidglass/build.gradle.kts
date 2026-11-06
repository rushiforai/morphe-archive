plugins {
    alias(libs.plugins.kotlin.compose)
}

extension {
    name = "extensions/liquidglass.mpe"
}

android {
    namespace = "app.liquidmusic.extension"
    // Compose 1.12, which Backdrop is built on, needs compileSdk 37.
    compileSdk = 37

    defaultConfig {
        // The glass needs Android 12 (the extension returns early below it). With this minSdk,
        // R8 adds no stubs of newer framework classes, which Apple Music has too.
        minSdk = 31
    }

    androidResources {
        // An extension ships code only, so its resources (a few strings and ids of Compose)
        // never reach Apple Music. A package id of their own keeps their ids apart from the
        // app's: see ComposeHost.
        additionalParameters += listOf("--package-id", "0x7e", "--allow-reserved-package-id")
    }

    buildTypes {
        release {
            optimization {
                // The keep rules of the libraries would keep some classes under their own names,
                // the names Apple Music's copy of Compose uses too. extensions/proguard-rules.pro
                // has the few rules the bundled libraries need instead.
                keepRules {
                    ignoreFromAllExternalDependencies(true)
                }
            }
        }
    }
}

dependencies {
    implementation(project(":libs:backdrop-catalog"))
    implementation(libs.kyant.shapes)
    implementation(libs.androidx.compose.foundation)
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.lifecycle.runtime)
    implementation(libs.androidx.savedstate)
}

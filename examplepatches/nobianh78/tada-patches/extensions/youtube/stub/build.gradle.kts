import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

configure<LibraryExtension> {
    lint { abortOnError = false }
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }
}

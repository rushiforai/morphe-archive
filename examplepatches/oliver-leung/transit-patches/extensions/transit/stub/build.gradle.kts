import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

configure<LibraryExtension> {
    namespace = "app.transitpatches.extension.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }
}

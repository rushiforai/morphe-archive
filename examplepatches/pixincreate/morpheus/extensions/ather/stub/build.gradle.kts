import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

configure<LibraryExtension> {
    namespace = "app.morphe.extension.ather.stub"
    compileSdk = 37

    defaultConfig {
        minSdk = 26
    }
}

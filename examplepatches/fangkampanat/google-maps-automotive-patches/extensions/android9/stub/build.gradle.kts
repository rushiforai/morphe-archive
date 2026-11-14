import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

// Compile-time stubs of Android 9's hidden classes that the Android 9 extension uses. Never packaged.
configure<LibraryExtension> {
    namespace = "app.morphe.extension.android9.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

configure<LibraryExtension> {
    lint { abortOnError = false }
    namespace = "app.morphe.extension.shared"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    implementation(libs.tada.extensions.library)
    compileOnly(libs.annotation)
}

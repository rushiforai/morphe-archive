import com.android.build.api.dsl.LibraryExtension
import org.gradle.api.JavaVersion

plugins {
    id("com.android.library")
}

configure<LibraryExtension> {
    namespace = "app.tiktoktv.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

description = "Stubs for classes that already exist inside the JPTT APK."

configure<LibraryExtension> {
    namespace = "app.lchanc3.stub.jptt"
    compileSdk = 36

    defaultConfig {
        minSdk = 21
    }
}

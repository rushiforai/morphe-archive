import com.android.build.api.dsl.LibraryExtension

plugins {
    id("com.android.library")
}

configure<LibraryExtension> {
    namespace = "app.wazeytm.extension.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }
}

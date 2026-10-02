// Compile-only stubs of the Facebook Lite classes the feed font extension uses. Never bundled.
plugins {
    id("com.android.library")
}

android {
    namespace = "app.fblite.extension.feedfont.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

// Compile-only stubs of the Volley classes the extension uses. Sync ships Volley unobfuscated,
// so the extension links against the app's own classes at runtime.
plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.syncfixes.extension.syncforreddit.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

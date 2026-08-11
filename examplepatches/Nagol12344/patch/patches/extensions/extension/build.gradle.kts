plugins {
    id("com.android.library")
}

android {
    namespace = "app.template.patches.webviewhook"
    compileSdk = 34

    defaultConfig {
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // Nothing beyond the Android SDK is needed for ScriptHook as written —
    // it only uses android.webkit, java.net, java.security (all in the platform).
    compileOnly("androidx.annotation:annotation:1.7.1") // optional, if you add @NonNull etc.
}
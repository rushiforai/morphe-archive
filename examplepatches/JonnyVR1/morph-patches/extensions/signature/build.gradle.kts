plugins {
    id("com.android.application")
}

android {
    namespace = "com.p1.mobile.putong.data.extension.signature"
    compileSdk = 34

    defaultConfig {
        minSdk = 24
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly("com.google.android:android:4.1.1.4")
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
}

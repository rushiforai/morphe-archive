plugins {
    id("com.android.application")
}

android {
    namespace = "com.feixiangdao.doubanplayerbridge"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.feixiangdao.doubanplayerbridge"
        minSdk = 26
        targetSdk = 35
        versionCode = 8
        versionName = "0.2.3"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

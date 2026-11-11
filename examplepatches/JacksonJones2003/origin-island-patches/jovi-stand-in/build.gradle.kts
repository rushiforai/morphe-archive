plugins { id("com.android.application") version "9.1.1" }

android {
    namespace = "app.originisland.jovi"
    compileSdk = 36

    defaultConfig {
        // Jovi only sends songs asked for by voice to a few music apps it knows by their package.
        applicationId = "com.tencent.qqmusic"
        minSdk = 34
        targetSdk = 36
        // Above the versions of QQ Music, in case Jovi asks for a recent one.
        versionCode = 20_000_000
        versionName = "20.0.0"
    }

    buildTypes {
        release {
            // Signed with the debug key of whoever builds it, as it is installed by hand.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

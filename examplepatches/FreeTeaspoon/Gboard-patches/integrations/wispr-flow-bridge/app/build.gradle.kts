plugins { id("com.android.application") version "9.1.0" }

android {
    namespace = "dev.freeteaspoon.wisprflowbridge"
    compileSdk = 36
    defaultConfig {
        applicationId = "dev.freeteaspoon.wisprflowbridge"
        minSdk = 34
        targetSdk = 36
        versionCode = 1
        versionName = "0.1.0"
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly("de.robv.android.xposed:api:82")
    testImplementation("junit:junit:4.13.2")
}

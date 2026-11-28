plugins {
    id("com.android.library") version "9.1.0"
    id("app.cash.paparazzi") version "2.0.0-alpha05.1"
}

android {
    namespace = "app.morphe.extension.sabp"
    compileSdk = 36

    defaultConfig {
        minSdk = 30
    }

    sourceSets {
        getByName("main") {
            java.srcDir("../extensions/sabp/src/main/java")
            assets.srcDir("../patches/src/main/resources/sabp")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    lint {
        abortOnError = false
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

plugins {
    id("com.android.library")
    kotlin("android")
    id("maven-publish")
}

group = "app.template.patches"
version = "1.0.0"

android {
    namespace = "app.template.patches"
    compileSdk = 34

    defaultConfig {
        minSdk = 21
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"))
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildFeatures {
        buildConfig = false
    }
}

dependencies {
    compileOnly("app.morphe:patcher:2.0.1")
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.0")
}

afterEvaluate {
    publishing {
        publications {
            create<MavenPublication>("release") {
                from(components["release"])
                groupId = "app.template.patches"
                artifactId = "wallverse-patches"
                version = "1.0.0"
            }
        }
    }
}
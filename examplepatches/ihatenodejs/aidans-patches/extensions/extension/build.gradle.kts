extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.aidan.extension"
    testBuildType = "release"
    buildTypes {
        release {
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
    buildFeatures {
        aidl = true
    }
    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    implementation(libs.pdfbox.android)
    testImplementation(libs.junit)
}

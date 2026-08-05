extension {
    name = "extensions/nuviotv.mpe"
}

android {
    namespace = "io.github.liongalahad.nuviotv.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }

    testOptions {
        unitTests.isIncludeAndroidResources = true
    }
}

dependencies {
    compileOnly("androidx.media3:media3-common:1.8.0")
    testImplementation("androidx.media3:media3-common:1.8.0")
    testImplementation("androidx.test:core:1.6.1")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

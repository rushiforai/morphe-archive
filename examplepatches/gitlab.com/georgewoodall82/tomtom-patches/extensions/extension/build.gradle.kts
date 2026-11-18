extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.mypois.extension"

    testOptions {
        unitTests.isIncludeAndroidResources = true
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

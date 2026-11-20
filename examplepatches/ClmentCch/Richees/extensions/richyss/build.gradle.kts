extension {
    name = "extensions/richyss.mpe"
}

android {
    namespace = "app.richyss.extension"

    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    testImplementation(libs.junit)
    testImplementation(libs.json)
}

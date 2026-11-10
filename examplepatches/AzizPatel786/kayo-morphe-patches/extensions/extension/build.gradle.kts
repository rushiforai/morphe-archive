extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

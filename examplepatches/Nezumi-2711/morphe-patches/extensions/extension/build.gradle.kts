extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"

    // Plain JVM tests for the Android-free bug-log logic (line format, ring buffer, export summary,
    // crash attribution). Android framework calls return defaults instead of throwing.
    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

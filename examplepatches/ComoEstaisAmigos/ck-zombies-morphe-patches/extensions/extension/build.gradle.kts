extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.ckzombies.extension"

    // The unit tests drive MediaPlayer subclasses; the android.jar stubs would throw on every call.
    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

extension {
    name = "extensions/twitch.mpe"
}

android {
    namespace = "app.morphed.extension"

    defaultConfig {
        // Twitch itself requires Android 8.0, which also makes java.time available.
        minSdk = 26
    }

    // Lets unit tests load the Android-facing classes (Log, Handler, ... do nothing instead of throwing).
    testOptions.unitTests.isReturnDefaultValues = true
}

dependencies {
    compileOnly(project(":extensions:twitch:stub"))
    testImplementation("junit:junit:4.13.2")
}

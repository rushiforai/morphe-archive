extension {
    name = "extensions/elevenlabs.mpe"
}

android {
    namespace = "app.waze.elevenlabs.extension"
}

// The extension is plain Java; keep the Kotlin stdlib out of the dex injected into Waze.
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }

extension {
    name = "extensions/spotify.mpe"
}

android {
    namespace = "app.noam.extension.spotify"
}

dependencies {
    // Provided by the target app at runtime, never bundled into the patched APK.
    compileOnly(libs.kotlin.stdlib)
    compileOnly(libs.annotation)
}

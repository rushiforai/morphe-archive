extension {
    name = "extensions/chesscom.mpe"
}

android {
    namespace = "app.noam.extension.chesscom"
}

dependencies {
    // Provided by the target app at runtime, never bundled into the patched APK.
    compileOnly(libs.kotlin.stdlib)
    compileOnly(libs.annotation)
}

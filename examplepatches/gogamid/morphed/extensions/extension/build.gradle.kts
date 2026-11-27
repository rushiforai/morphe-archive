extension {
    name = "extensions/extension.mpe"
}

dependencies {
    // Rossmann 5.11.1 app classes, compile-only. The sources live in stubs/
    // and are compiled into this jar; see stubs/README.md. The extension dex
    // never contains them, the calls bind against the app's real classes.
    compileOnly(files("libs/rossmann-stub-5.11.1.jar"))

    // The extension subclasses ContinuationImpl to drive the app's own suspend
    // activate use case. The app bundles the Kotlin runtime already, so this
    // is compile-only and never ships in the extension dex.
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.3.0")
}

android {
    namespace = "app.gogamid.morphed.extension"
}

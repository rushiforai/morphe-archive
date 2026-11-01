extension { name = "extensions/medium-privacy.mpe" }
android {
    namespace = "nl.johninnl.medium.privacy"
    defaultConfig { minSdk = 32 }
    testOptions { unitTests.isReturnDefaultValues = true }
}
dependencies { testImplementation("junit:junit:4.13.2") }
configurations.create("privacyApi") {
    isCanBeConsumed = true; isCanBeResolved = false
    outgoing.artifact(layout.buildDirectory.file("intermediates/compile_app_classes_jar/release/bundleReleaseClassesToCompileJar/classes.jar")) {
        builtBy("bundleReleaseClassesToCompileJar")
    }
}

// Keep the app's Kotlin runtime out of these Java-only extension DEXes.
// Exclude only production runtime classpaths; JVM tests retain their own stdlib.
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }

extension {
    name = "extensions/medium-reader.mpe"
}

android {
    namespace = "nl.johninnl.medium.reader"
    defaultConfig { minSdk = 32 }
    testOptions { unitTests.isReturnDefaultValues = true }
}

dependencies {
    implementation(project(mapOf("path" to ":medium-vendor", "configuration" to "isolated")))
    compileOnly(project(":medium-stubs"))
    compileOnly(project(mapOf("path" to ":extensions:medium-privacy", "configuration" to "privacyApi")))
    testImplementation(project(mapOf("path" to ":extensions:medium-privacy", "configuration" to "privacyApi")))
    testImplementation(project(":medium-stubs"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.jsoup:jsoup:1.23.2")
    testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0")
    testImplementation("com.squareup.okhttp3:okhttp-tls:4.12.0")
}

configurations.create("readerApi") {
    isCanBeConsumed = true
    isCanBeResolved = false
    outgoing.artifact(layout.buildDirectory.file("intermediates/compile_app_classes_jar/release/bundleReleaseClassesToCompileJar/classes.jar")) {
        builtBy("bundleReleaseClassesToCompileJar")
    }
}

// Keep the app's Kotlin runtime out of these Java-only extension DEXes.
// Exclude only production runtime classpaths; JVM tests retain their own stdlib.
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }

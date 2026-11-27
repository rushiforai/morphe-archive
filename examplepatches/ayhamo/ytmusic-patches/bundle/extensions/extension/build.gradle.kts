extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.ayham.extension"
    defaultConfig {
        // Same as Morphe's music extension; ONNX Runtime needs 24+.
        minSdk = 26
    }
    // JVM unit tests (src/test) for the pure logic; android.util.Log and the like return defaults there.
    testOptions {
        unitTests.isReturnDefaultValues = true
        // the Spotify bench analyses several songs at once (scripts/spotify-bench.ps1 -Threads)
        unitTests.all { it.maxHeapSize = System.getenv("TEST_HEAP") ?: "2g" }
    }
}

// The extension is plain Java; the Kotlin stdlib the build adds would only duplicate the app's own copy.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib-jdk7")
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib-jdk8")
}

dependencies {
    // ONNX Runtime's Java API goes into the extension dex; its native libraries are
    // added to the APK by the "Automix libraries" patch.
    implementation("com.microsoft.onnxruntime:onnxruntime-android:1.28.0")
    testImplementation("junit:junit:4.13.2")
}

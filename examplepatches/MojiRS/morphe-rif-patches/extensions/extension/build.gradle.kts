extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.revanced.extension"

    // Match rif's minSdk so platform APIs (LruCache, Bitmap.getByteCount, ...)
    // aren't flagged; these helpers are injected into rif, which is minSdk 21.
    defaultConfig {
        minSdk = 21
    }

    // Fail the build on platform APIs newer than minSdk without a version guard: the
    // extension runs inside rif on Android 5+, but testing happens on new devices only.
    lint {
        checkOnly += setOf("NewApi", "InlinedApi")
        abortOnError = true
    }

    // JVM unit tests for the pure helpers: Android stubs return defaults instead of throwing.
    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    // Compile-only stub of rif's RifBaseSettingsFragment (source: stubs/); provided by
    // rif at runtime, so it must never be bundled.
    compileOnly(files("libs/rif-stubs.jar"))

    // The stubs (androidx Pair `c`) again for the unit tests, which call fixParams. Test-only.
    testImplementation(files("libs/rif-stubs.jar"))
    testImplementation("junit:junit:4.13.2")
    // A real org.json for GalleryRepairTest: the Android stub jar on the unit-test classpath
    // returns defaults. Test-only, so never bundled. It wins over the stub on the test
    // classpath: GalleryRepairTest runs all 9 tests and none are skipped.
    testImplementation("org.json:json:20240303")
}

// The extension plugin applies Kotlin, which implicitly puts kotlin-stdlib on the runtime
// classpath. This extension is pure Java and uses none of it, yet it was ~96% of
// extension.rve (~2 MB, 1000+ kotlin.* classes merged into rif, which ships its own copy).
// Keep it out of the bundle.
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

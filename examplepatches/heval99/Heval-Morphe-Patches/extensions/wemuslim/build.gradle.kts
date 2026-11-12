extension {
    name = "extensions/wemuslim.mpe"
}

android {
    namespace = "app.template.extension"

    testOptions {
        // ShortcutFilter's Log calls answer defaults in plain JVM unit tests.
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    // Unit tests of the pure link matcher: .\gradlew :extensions:wemuslim:testReleaseUnitTest
    testImplementation(libs.junit)
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

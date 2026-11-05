// FotMob helpers: "Use system font", the animation speed and activity hooks, and the "Patch
// settings" row on FotMob's Settings screen. Builds extensions/fotmob.mpe; the Heval Controls core
// is not bundled here (the host patch merges extensions/hevalcontrols.mpe), so it is a compileOnly
// dependency. See docs/heval-controls.md.
extension {
    name = "extensions/fotmob.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // HevalSettings. compileOnly: one copy of the core, from hevalcontrols.mpe.
    compileOnly(project(":extensions:hevalcontrols:core"))

    // JVM unit tests of the pure-Java picker helpers (CountryIconsTest, CompetitionFilterTest): .\gradlew :extensions:fotmob:testDebugUnitTest
    testImplementation(project(":extensions:hevalcontrols:core"))
    testImplementation(libs.junit)
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

// Sofascore helpers for Patch settings: the "Patch settings" row on the Settings screen and the
// runtime hooks of the Sofascore features (modal queue, match tabs, sports list, hidden countries and competitions, animation speed,
// widget refresh). Builds
// extensions/sofascore.mpe; the Heval Controls core is compileOnly (the host patch merges
// extensions/hevalcontrols.mpe), so this .mpe never carries a second copy of it.
// See docs/heval-controls.md.
extension {
    name = "extensions/sofascore.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    compileOnly(project(":extensions:hevalcontrols:core"))

    // JVM unit tests of the pure-Java picker helpers (CountryIconsTest, CompetitionFilterTest): .\gradlew :extensions:sofascore:testDebugUnitTest
    testImplementation(project(":extensions:hevalcontrols:core"))
    testImplementation(libs.junit)
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

// Flashscore helpers for the Patch settings host: the "Patch settings" row on Flashscore's
// Settings screen (and, later, the list filters). Builds extensions/flashscore.mpe; the Heval
// Controls core is not bundled here (the host patch merges extensions/hevalcontrols.mpe), so it is
// a compileOnly dependency. See docs/heval-controls.md.
extension {
    name = "extensions/flashscore.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // HevalSettings. compileOnly: one copy of the core, from hevalcontrols.mpe.
    compileOnly(project(":extensions:hevalcontrols:core"))

    testImplementation(project(":extensions:hevalcontrols:core"))
    testImplementation(libs.junit)
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

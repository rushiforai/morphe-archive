// Truecaller helpers for Patch settings: the "Patch settings" row on the main Settings screen and
// the swapped incoming call notification layouts. Builds extensions/truecaller.mpe; the Heval
// Controls core is not bundled here (the host patch merges extensions/hevalcontrols.mpe), so it is a
// compileOnly dependency. See docs/heval-controls.md.
extension {
    name = "extensions/truecaller.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // HevalSettings and AppContext. compileOnly: one copy of the core, from hevalcontrols.mpe.
    compileOnly(project(":extensions:hevalcontrols:core"))
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

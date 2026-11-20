extension {
    name = "extensions/firefoxfocus.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // GeckoView and Kotlin runtime stubs. compileOnly: the real classes come from Firefox Focus,
    // so the .mpe ships only the extension classes.
    compileOnly(project(":extensions:firefoxfocus:stub"))
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

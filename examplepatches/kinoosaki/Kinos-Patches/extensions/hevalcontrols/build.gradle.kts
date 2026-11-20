// Heval Controls: the in-app runtime settings framework (engine, settings screen, init provider,
// crash guard). One shared .mpe; per-app extensions compile against :extensions:hevalcontrols:core
// with compileOnly, so only this .mpe ever carries the core classes (see docs/heval-controls.md).
extension {
    name = "extensions/hevalcontrols.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // Engine, registry codec and crash-guard logic. Nested under this extension project, so the
    // settings plugin includes it as a plain project (no .mpe of its own).
    implementation(project(":extensions:hevalcontrols:core"))
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

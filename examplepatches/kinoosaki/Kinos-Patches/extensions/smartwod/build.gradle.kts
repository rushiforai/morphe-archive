extension {
    name = "extensions/smartwod.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // React Native bridge API stubs. compileOnly: the real classes come from the target app,
    // so the .mpe ships only the extension class.
    compileOnly(project(":extensions:smartwod:stub"))
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

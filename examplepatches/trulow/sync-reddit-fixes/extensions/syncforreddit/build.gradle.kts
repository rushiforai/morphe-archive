extension {
    name = "extensions/syncforreddit.mpe"
}

android {
    namespace = "app.syncfixes.extension.syncforreddit"
}

dependencies {
    compileOnly(project(":extensions:syncforreddit:stub"))
    compileOnly(libs.okhttp)
}

// The extension is plain Java. Keep the Kotlin standard library, which the Android plugin adds to every
// module, out of the code merged into Sync.
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin")
}

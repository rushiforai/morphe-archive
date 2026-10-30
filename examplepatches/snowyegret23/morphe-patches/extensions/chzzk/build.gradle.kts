extension { name = "extensions/chzzk.mpe" }
android { namespace = "app.s.chzzk.extension" }

// The Java extension uses the app's Kotlin runtime through patched bridges.
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

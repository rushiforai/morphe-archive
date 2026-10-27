extension { name = "extensions/monet-catalog-channels.mpe" }
android {
    namespace = "software.santodan.extension.monetchannels"
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}
// This Java-only adapter must not merge a second Kotlin runtime into Monet.
configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }

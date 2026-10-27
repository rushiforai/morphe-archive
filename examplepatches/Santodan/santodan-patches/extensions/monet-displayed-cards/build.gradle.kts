extension { name = "extensions/monet-displayed-cards.mpe" }
android {
    namespace = "software.santodan.extension.monetcards"
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}
configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }

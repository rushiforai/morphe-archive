extension { name = "extensions/monet-displayed-cards.mpe" }
android {
    namespace = "nl.johninnl.monetcards"
    defaultConfig { minSdk = 26 }
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}
configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }

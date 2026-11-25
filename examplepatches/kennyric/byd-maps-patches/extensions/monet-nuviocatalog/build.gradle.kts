extension { name = "extensions/monet-nuviocatalog.mpe" }
android {
    namespace = "nl.johninnl.monetnuvio"
    defaultConfig { minSdk = 26 }
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}
configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }

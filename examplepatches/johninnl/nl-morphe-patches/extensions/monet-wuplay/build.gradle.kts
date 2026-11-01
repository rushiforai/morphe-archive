extension { name = "extensions/monet-wuplay.mpe" }
android {
    namespace = "nl.johninnl.monetwuplay"
    defaultConfig { minSdk = 26 }
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}
configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }

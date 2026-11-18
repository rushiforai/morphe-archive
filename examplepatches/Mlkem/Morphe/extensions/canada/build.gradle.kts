extension { name = "extensions/canada.mpe" }
android { namespace = "app.canada.walmart" }

// Pure Java extension: do not merge AGP's default Kotlin runtime into the app.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin")
}

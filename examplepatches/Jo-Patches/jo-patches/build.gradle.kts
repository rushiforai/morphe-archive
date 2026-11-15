// Root build configuration for memorize-pi-patches.
//
// The version comes from gradle.properties, so semantic-release can bump it.
val patchBundleVersion = providers.gradleProperty("version").getOrElse("0.0.0")

allprojects {
    version = patchBundleVersion
}

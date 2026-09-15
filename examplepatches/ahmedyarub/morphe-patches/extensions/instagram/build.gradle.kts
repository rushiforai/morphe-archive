// Produces extensions/instagram.mpe, which the Instagram patch library merges into the app
// alongside extensions/shared.mpe. The runtime classes the migrated patches call live in the
// shared extension, so this module carries no sources of its own.
dependencies {
    compileOnly(libs.morphe.extensions.library)
    compileOnly(libs.instagram.morphe.extensions.library)
}

android {
    defaultConfig {
        minSdk = 26
    }
}

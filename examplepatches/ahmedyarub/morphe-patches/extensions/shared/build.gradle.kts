// Packages the shared Morphe and Instagram extension libraries into extensions/shared.mpe,
// which the Instagram patches merge into the app. It has no sources of its own.
dependencies {
    implementation(project(":extensions:shared:library"))
}

android {
    defaultConfig {
        minSdk = 26
    }
}

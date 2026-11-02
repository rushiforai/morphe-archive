// Modeled on extensions/all/change-version-code/build.gradle.kts from morphe-patches.
// Published name matches extendWith("extensions/facebook.mpe") in MarketplaceOnlyPatch.kt.
extension {
    name = "extensions/facebook.mpe"
}

android {
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

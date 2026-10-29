extension {
    name = "extensions/smartlife.mpe"
}

android {
    namespace = "app.smartlife.extension"

    compileSdk = 36

    defaultConfig {
        minSdk = 24
    }
}

dependencies {
    // Used by SignatureSpoof to allow reflection on hidden framework fields.
    implementation(libs.hiddenapi)
}

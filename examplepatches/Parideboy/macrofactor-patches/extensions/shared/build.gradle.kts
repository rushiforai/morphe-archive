extension {
    name = "extensions/shared.mpe"
}

android {
    namespace = "arpit.morphe.extension.shared"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // Bundles the shared extension library classes (app.morphe.extension.shared.*) into shared.mpe.
    implementation(libs.morphe.extensions.library)
}

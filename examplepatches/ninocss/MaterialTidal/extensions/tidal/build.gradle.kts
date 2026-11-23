extension {
    name = "extensions/tidal.mpe"
}

android {
    namespace = "dev.materialtidal.extension.tidal"

    defaultConfig {
        minSdk = 32
    }
}

dependencies {
    compileOnly(libs.androidx.recyclerview)
    compileOnly(libs.androidx.core)
}

android {
    buildFeatures {
        aidl = true
    }

    defaultConfig {
        // dev.rikka.shizuku:api requires minSdk 24; overrides ExtensionPlugin's default of 23.
        minSdk = 24
    }
}

dependencies {
    compileOnly(project(":stub"))

    implementation("dev.rikka.shizuku:api:13.1.5")
    implementation("dev.rikka.shizuku:provider:13.1.5")
}

extension { name = "extensions/aliexpress.mpe" }

android {
    namespace = "nl.johninnl.aliexpress"
    // AliExpress 8.180 supports Android 5.0 and newer.
    defaultConfig { minSdk = 21 }
    buildFeatures { buildConfig = true }
    defaultConfig {
        buildConfigField("String", "BUNDLE_VERSION", "\"${project.version}\"")
    }
}

dependencies { testImplementation("junit:junit:4.13.2") }

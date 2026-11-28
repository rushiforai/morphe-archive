extension {
    name = "extensions/waze.mpe"
}

android {
    namespace = "com.waze.gw.extension"

    defaultConfig {
        // Waze 5.27.90.900 declares minSdk 29.
        minSdk = 29
    }

    // The xADAS Link AIDL (src/main/aidl/com/kaibatech/drivedeck/xadas/link), bound by XadasLink.
    buildFeatures {
        aidl = true
    }
}

// Plain Java, like the Maps extension: keep the Kotlin stdlib out of the merged dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}
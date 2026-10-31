extension {
    name = "extensions/gboard-clipboard-extension.rve"
}

android {
    namespace = "com.sj010.gboardclipboard.extension"

    defaultConfig {
        // Must match the d8 --min-api that scripts/build-mpp.sh uses for the .rve dex.
        minSdk = 29
        targetSdk = 35
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

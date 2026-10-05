extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.riky.extension"
    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    implementation(libs.wireguard)
}

// Morphe renames DEX to one .mpe; fail instead of silently overwriting multidex.
tasks.named("syncExtension") {
    doFirst {
        val dexFiles = tasks.getByName("minifyReleaseWithR8").outputs.files.asFileTree
            .matching { include("**/*.dex") }.files
        check(dexFiles.size == 1) {
            "CapCut extension must contain exactly one DEX; found ${dexFiles.size}"
        }
    }
}

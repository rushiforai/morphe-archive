extension {
    name = "extensions/stremio.mpe"
}

android {
    namespace = "com.stremio.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 24
    }

    sourceSets.named("main") {
        java.setSrcDirs(
            listOf(
                "../../patches/multi-account/src",
                "../../patches/addon-reordering/src"
            )
        )
    }
}

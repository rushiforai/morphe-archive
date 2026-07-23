extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "io.github.ilikeadofai.vocacolle.extension"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        buildConfigField(
            "String",
            "MORPHE_PATCH_VERSION",
            "\"${project.version}\""
        )
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

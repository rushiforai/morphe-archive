extension {
    name = "extensions/gboard-patches.rve"
}

android {
    namespace = "dev.jason.gboardpatches.extension"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        buildConfigField("String", "PATCH_AUTHOR", "\"jasonwu1994\"")
        buildConfigField("String", "PATCH_AUTHOR_URL", "\"https://github.com/jasonwu1994\"")
        buildConfigField(
            "String",
            "PATCH_REPOSITORY_URL",
            "\"https://github.com/jasonwu1994/Gboard-patches\""
        )
        buildConfigField("String", "PATCH_VERSION", "\"${project.version}\"")
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

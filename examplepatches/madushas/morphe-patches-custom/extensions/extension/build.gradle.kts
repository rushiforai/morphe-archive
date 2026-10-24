extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
    buildFeatures {
        buildConfig = true
    }
    defaultConfig {
        // Single source of truth: the bundle version in gradle.properties.
        buildConfigField("String", "EXTRAS_VERSION", "\"${project.version}\"")
    }
    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
    testImplementation("junit:junit:4.13.2")
}

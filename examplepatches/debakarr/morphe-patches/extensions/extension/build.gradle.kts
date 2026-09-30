extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
    buildFeatures {
        buildConfig = true
    }
    defaultConfig {
        fun envBuildConfigField(name: String) {
            val value = providers.environmentVariable(name).orNull.orEmpty()
            buildConfigField("String", name, "\"${value.replace("\\", "\\\\").replace("\"", "\\\"")}\""  )
        }

        envBuildConfigField("FLIGHTRADAR_MAPS_API_KEY")
        envBuildConfigField("SHARED_MAPS_API_KEY")
    }
    testOptions {
        // android.util.Log etc. are stubs in local unit tests.
        unitTests.isReturnDefaultValues = true
    }
    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
    testImplementation("junit:junit:4.13.2")
    // Real org.json for local unit tests (android.jar only ships stubs).
    testImplementation("org.json:json:20240303")
}

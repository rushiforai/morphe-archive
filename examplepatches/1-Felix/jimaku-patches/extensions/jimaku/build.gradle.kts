extension {
    name = "extensions/jimaku.mpe"
}

android {
    namespace = "app.jimaku.extension"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        // The bundle's version, for the User-Agent of gateway reads. Releases set it in gradle.properties.
        buildConfigField("String", "BUNDLE_VERSION", "\"${project.version}\"")

        // A build that throws in the playback time listener, to check fault containment:
        // ./gradlew buildAndroid -Pjimaku.faultTest=true
        buildConfigField("boolean", "FAULT_TEST", (findProperty("jimaku.faultTest") == "true").toString())

        // A build whose message and button show a state set from the shell, for screenshots of their look:
        // ./gradlew buildAndroid -Pjimaku.preview=true, then adb shell settings put global jimaku_preview progress
        buildConfigField("boolean", "PREVIEW", (findProperty("jimaku.preview") == "true").toString())
    }

    testOptions {
        // android.util.Log and friends answer defaults in JVM tests instead of throwing.
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    // Signatures of the Morphe Patches classes Jimaku calls; the app has the real ones.
    compileOnly(project(":stub"))

    testImplementation(libs.junit)
    testImplementation(libs.org.json)
}

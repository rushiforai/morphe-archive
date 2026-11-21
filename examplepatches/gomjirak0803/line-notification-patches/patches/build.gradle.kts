group = "app.linenotifications"

patches {
    about {
        name = "LINE notification patches"
        description = "Local notification controls for LINE"
        source = "https://github.com/gomjirak0803/line-notification-patches"
        author = "gomjirak0803 and contributors"
        contact = "https://github.com/gomjirak0803/line-notification-patches/issues"
        website = "https://github.com/gomjirak0803/line-notification-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

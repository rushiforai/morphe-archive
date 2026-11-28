group = "app.ayham"

patches {
    about {
        name = "Ayham Patches"
        description = "Personal YouTube Music patches, used next to the Morphe bundle"
        source = "https://github.com/ayhamo/ytmusic-patches"
        author = "ayhamo"
        contact = "https://github.com/ayhamo/ytmusic-patches/issues"
        website = "https://github.com/ayhamo/ytmusic-patches"
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

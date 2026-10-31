group = "app.blackmagic"

patches {
    about {
        name = "Blackmagic Camera Patches"
        description = "Patches for Blackmagic Camera: smoother gallery, usable bitrate tiers, developer options."
        source = "git@github.com:azain47/blackmagic-camera-patches.git"
        author = "azain47"
        contact = "na"
        website = "https://github.com/azain47/blackmagic-camera-patches"
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

group = "app.fluffydiscord"

patches {
    about {
        name = "FluffyDiscord Screen Recorder patches"
        description = "High frame rate recording for the MIUI / HyperOS screen recorder"
        source = "git@github.com:FluffyDiscord/miui-screen-recorder-fps-unlock.git"
        author = "FluffyDiscord"
        contact = "https://github.com/FluffyDiscord/miui-screen-recorder-fps-unlock/issues"
        website = "https://github.com/FluffyDiscord/miui-screen-recorder-fps-unlock"
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

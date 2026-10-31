group = "app.morphed"

patches {
    about {
        name = "Overhypedcat Twitch Patches"
        description = "Blocks Twitch stream ads by swapping to ad-free playlists, the way vaft does on desktop"
        source = "git@github.com:Overhypedcat/overhypedcat-twitch-patches.git"
        author = "Overhypedcat"
        contact = "na"
        website = "https://github.com/Overhypedcat/overhypedcat-twitch-patches"
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

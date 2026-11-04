group = "app.wordfeudwordfinder"

patches {
    about {
        name = "Wordfeud Word Finder"
        description = "Patches for Wordfeud, compatible with Morphe"
        source = "git@github.com:jeroenimo02/wordfeud-word-finder.git"
        author = "jeroenimo02"
        contact = "na"
        website = "https://github.com/jeroenimo02/wordfeud-word-finder"
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

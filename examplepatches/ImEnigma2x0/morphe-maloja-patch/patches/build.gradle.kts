group = "app.enigma"

patches {
    about {
        name = "Enigma Maloja Patch"
        description = "Adds Maloja as a scrobbling provider for YouTube Music. Use together with the official Morphe patches."
        source = "git@github.com:ImEnigma2x0/morphe-maloja-patch.git"
        author = "ImEnigma2x0"
        contact = "na"
        website = "https://github.com/ImEnigma2x0/morphe-maloja-patch"
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

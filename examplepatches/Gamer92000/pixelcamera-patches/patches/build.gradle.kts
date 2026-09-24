group = "io.github.gamer92000"

patches {
    about {
        name = "Pixel Camera patches"
        description = "Patches for the official Pixel Camera: open captured media in any " +
            "installed gallery instead of requiring Google Photos, and keep Add Me working " +
            "in a re-signed build."
        source = "git@github.com:Gamer92000/pixelcamera-patches.git"
        author = "Gamer92000"
        contact = "na"
        website = "https://github.com/Gamer92000/pixelcamera-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        // Required: large parts of the patcher API are declared with
        // `context(BytecodePatchContext)` context parameters.
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    testImplementation(kotlin("test"))
}

tasks {
    test {
        useJUnitPlatform()
        testLogging { events("passed", "skipped", "failed") }
    }

    // Regenerates ../patches-list.json, which Morphe Manager reads from the
    // source repository to list a bundle's patches without downloading it.
    // The generator runs with this project as its working directory.
    register<JavaExec>("generatePatchesList") {
        description = "Build the patch bundle and regenerate patches-list.json"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}

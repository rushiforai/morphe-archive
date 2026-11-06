group = "app.morphe.patches.applemusic"

patches {
    about {
        name = "Apple Music Patches"
        description = "Morphe patches to run Apple Music 7.0.0 on the BYD DiLink 3.0 head unit"
        source = "https://github.com/andersonlucasg3/apple-music-morphe-patches"
        author = "andersonlucasg3"
        contact = "na"
        website = "https://github.com/andersonlucasg3/apple-music-morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

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
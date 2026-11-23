group = "app.jofslash"

patches {
    about {
        name = "JoFSlash Patches"
        description = "Patches for Quora, Booking.com and Google Health (Fitbit)"
        source = "git@github.com:JoFSlash/morphe-patches.git"
        author = "JoFSlash"
        contact = "https://github.com/JoFSlash/morphe-patches/issues"
        website = "https://github.com/JoFSlash/morphe-patches"
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

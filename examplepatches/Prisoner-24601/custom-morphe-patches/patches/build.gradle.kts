group = "app.keyboardspeed"

patches {
    about {
        name = "Prisoner-24601 Custom Morphe Patches"
        description = "Add-on YouTube patches for the Morphe YouTube patches"
        source = "git@github.com:Prisoner-24601/custom-morphe-patches.git"
        author = "Prisoner-24601"
        contact = "https://github.com/Prisoner-24601/custom-morphe-patches/issues"
        website = "https://github.com/Prisoner-24601/custom-morphe-patches"
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

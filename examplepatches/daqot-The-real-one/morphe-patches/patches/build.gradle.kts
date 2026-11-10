group = "app.daqot"

patches {
    about {
        name = "daqot-The-real-one Patches"
        description = "Patches for the Dutch Pepper app"
        source = "git@github.com:Karamelsabbelaar/morphe-patches.git"
        author = "daqot-The-real-one"
        contact = "https://github.com/Karamelsabbelaar/morphe-patches/issues"
        website = "https://github.com/Karamelsabbelaar/morphe-patches"
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

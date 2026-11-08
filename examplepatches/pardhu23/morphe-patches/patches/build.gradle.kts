group = "app.pardhu23"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Way2News Patches"
        description = "Patches for Way2News: ad blocking and analytics removal"
        source = "https://github.com/pardhu23/morphe-patches"
        author = "pardhu23"
        contact = "na"
        website = "https://github.com/pardhu23/morphe-patches"
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

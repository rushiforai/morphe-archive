group = "app.aryplus"

patches {
    about {
        name = "ARY+ Patches"
        description = "Ad removal for ARY+"
        source = "https://gitlab.com/kamander700/aryplus-morphe-patches"
        author = "kamander"
        contact = "https://gitlab.com/kamander700"
        website = "https://gitlab.com/kamander700/aryplus-morphe-patches"
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

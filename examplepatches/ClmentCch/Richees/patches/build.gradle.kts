group = "app.richyss"

patches {
    about {
        name = "Richyss Patches"
        description = "Discord Android patches that expose the Richyss presence bridge."
        source = "git@github.com:ClmentCch/Richees.git"
        author = "Richyss"
        contact = "https://github.com/ClmentCch/Richees/issues"
        website = "https://github.com/ClmentCch/Richees"
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

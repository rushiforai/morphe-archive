group = "app.rosaldivo"

patches {
    about {
        name = "Rosaldivo Patches"
        description = "Rosaldivo's patches for use with Morphe"
        source = "git@github.com:Rosaldivo/rosaldivo-morphe-patches.git"
        author = "Rosaldivo"
        contact = "https://github.com/Rosaldivo/rosaldivo-morphe-patches/issues"
        website = "https://github.com/Rosaldivo/rosaldivo-morphe-patches"
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

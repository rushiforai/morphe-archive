group = "io.github.sazap10"

patches {
    about {
        name = "Sync target SDK patches"
        description = "Raises Sync for Reddit's target SDK to 36 and fixes what breaks at that target"
        source = "git@github.com:sazap10/sync-patches.git"
        author = "sazap10"
        contact = "https://github.com/sazap10/sync-patches/issues"
        website = "https://github.com/sazap10/sync-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the patches file.
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

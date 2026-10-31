group = "app.syncpatches"

patches {
    about {
        name = "SyncPatch"
        description = "Patches for Sync for Reddit"
        source = "https://github.com/burakdede0/SyncPatch"
        author = "burakdede0"
        contact = "https://github.com/burakdede0"
        website = "https://github.com/burakdede0/SyncPatch"
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

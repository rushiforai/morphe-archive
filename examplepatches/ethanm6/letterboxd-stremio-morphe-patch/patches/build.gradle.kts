group = "app.stremiobridge"

patches {
    about {
        name = "Letterboxd Stremio Bridge"
        description = "Patches for the Letterboxd app: Stremio button on film pages, " +
            "hide video store, and hide where-to-watch row."
        source = "https://github.com/ethanm6/letterboxd-stremio-morphe-patch"
        author = "ethanm6"
        contact = "na"
        website = "na"
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

        // The generator picks up the first .mpp it finds in build/libs, so a
        // bundle left over from a previous version makes it silently emit a
        // patches-list.json for the wrong release. Delete stale bundles first.
        doFirst {
            layout.buildDirectory.dir("libs").get().asFile
                .listFiles { f ->
                    f.extension == "mpp" && !f.name.startsWith("patches-${project.version}")
                }
                ?.forEach { it.delete() }
        }

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

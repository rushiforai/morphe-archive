group = "pl.dudek.andropods.patches"

patches {
    about {
        name = "Dudek's Morphe Patches"
        description = "App patches by Dudek, for use with Morphe."
        source = "https://github.com/dawidd612/dudeks-morphe-patches"
        author = "dawidd612"
        contact = "https://github.com/dawidd612"
        website = "https://morphe.software/add-source?github=dawidd612/dudeks-morphe-patches"
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
        description = "Generate patch metadata from the compiled bundle"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
        args(layout.buildDirectory.file("libs/${project.name}-${project.version}.mpp").get().asFile.absolutePath)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

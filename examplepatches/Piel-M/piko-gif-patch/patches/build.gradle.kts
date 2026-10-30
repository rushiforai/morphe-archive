group = "app.pielm"

patches {
    about {
        name = "Piko GIF Patch"
        description = "Native animated GIF (.gif) download and conversion support for X/Twitter (companion patch for Piko)"
        source = "git@github.com:Piel-M/piko-gif-patch.git"
        author = "Piel-M"
        contact = "https://github.com/Piel-M/piko-gif-patch/issues"
        website = "https://github.com/Piel-M/piko-gif-patch"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

val generateVersionProperties = tasks.register("generateVersionProperties") {
    val outputDir = layout.buildDirectory.dir("generated/resources")
    outputs.dir(outputDir)
    inputs.property("version", project.version.toString())
    doLast {
        val file = outputDir.get().file("patch-version.properties").asFile
        file.parentFile.mkdirs()
        file.writeText("version=${project.version}\n")
    }
}

sourceSets {
    main {
        resources.srcDir(generateVersionProperties)
    }
}

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

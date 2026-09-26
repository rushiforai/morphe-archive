group = "app.morphe"

patches {
    about {
        name = "Morpheus Patches"
        description = "Patch sets that make vendor apps usable on de-Googled Android."
        source = "https://github.com/pixincreate/morpheus"
        author = "PiX"
        contact = "na"
        website = "https://github.com/pixincreate/morpheus"
        license = "CC0 1.0 Universal"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        workingDir = projectDir
        args(project.version.toString())
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

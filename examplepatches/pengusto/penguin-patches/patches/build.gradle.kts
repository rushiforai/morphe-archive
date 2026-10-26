group = "io.github.pengusto.patches"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Penguin Patches"
        description = "Personal Android app fixes compatible with Morphe"
        source = "https://github.com/pengusto/penguin-patches"
        author = "Pengusto"
        contact = "na"
        website = "https://github.com/pengusto/penguin-patches"
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

        dependsOn(build, "buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        val bundle = project.tasks.named<Jar>("jar").flatMap { it.archiveFile }
        doFirst {
            setArgs(listOf(bundle.get().asFile.absolutePath,
                rootProject.file(providers.gradleProperty("patchListOutput")
                    .getOrElse("patches-list.json")).absolutePath))
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

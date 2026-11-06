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
    // The compact entry point is compiled alongside the shared implementation,
    // but must not appear in the existing full/individual sources. The split
    // bundle task includes these compiled classes only in its compact output.
    named<Jar>("jar") {
        exclude("io/github/pengusto/patches/finamp/FinampCompactPatchKt*")
    }

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

    // Render release metadata from the actual published combined MPP after the
    // individual-selection build has been reduced and verified.
    register<JavaExec>("generatePatchesListFromBundle") {
        dependsOn("classes")
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        doFirst {
            val bundle = providers.gradleProperty("patchListBundle").orNull
                ?: error("Provide -PpatchListBundle for the published MPP")
            setArgs(listOf(rootProject.file(bundle).absolutePath,
                rootProject.file(providers.gradleProperty("patchListOutput")
                    .getOrElse("patches-list.json")).absolutePath))
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

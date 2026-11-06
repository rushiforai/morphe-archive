group = "app.mrcool"

patches {
    about {
        name = "MrCool Patches"
        description = "OpenBubbles Wear integration, Smart Launcher, and Icon Pack Studio patches"
        source = "https://github.com/MrCool-888/mrcool-patches"
        author = "MrCool-888"
        contact = "na"
        website = "na"
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

val verifyOpenBubblesExtension by tasks.registering(Exec::class) {
    workingDir(rootProject.projectDir)
    commandLine("python", "integrations/openbubbles/verify-extension.py")
}
tasks.processResources { dependsOn(verifyOpenBubblesExtension) }
dependencies { testImplementation(kotlin("test-junit")) }

group = "app.xhehab"

patches {
    about {
        name = "Xhehab Patches"
        description = "Custom Morphe patches for STNDRD, FST-7, TrainWise, and more by Xhehab"
        source = "git@github.com:Xhehab/Xhehab-Patches.git"
        author = "Xhehab"
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

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(project.version.toString())
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

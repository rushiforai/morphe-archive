group = "app.template"

patches {
    about {
        name = "Tim_Buckrue Patches"
        description = "Morphe patches for the NYT Games Android app. Unlocks high / variable refresh rate."
        source = "git@github.com:TimBuckrue/nyt-games-vrr-patch.git"
        author = "Tim_Buckrue"
        contact = "na"
        website = "https://github.com/TimBuckrue/nyt-games-vrr-patch"
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

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
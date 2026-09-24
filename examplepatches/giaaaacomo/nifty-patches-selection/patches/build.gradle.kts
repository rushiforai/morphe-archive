group = "io.github.giaaaacomo.nifty"

patches {
    about {
        name = "giaaaacomo's Nifty Patches Selection"
        description = "A focused collection of custom patches for use with Morphe"
        source = "https://github.com/giaaaacomo/nifty-patches-selection"
        author = "giaaaacomo"
        contact = "na"
        website = "https://github.com/giaaaacomo/nifty-patches-selection"
        license = "GPLv3 with additional GPLv3 Section 7 terms"
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
    implementation(libs.morphe.patches.library) {
        exclude(group = "com.google.code.gson", module = "gson")
    }
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

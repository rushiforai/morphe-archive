group = "app.ahmedyarub"

patches {
    about {
        name = "Ahmed Yarub's Patches"
        description = "Personal patches for use with Morphe"
        source = "git@github.com:ahmedyarub/morphe-patches.git"
        author = "ahmedyarub"
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

    // Shared helpers (returnEarly, findFreeRegister, ...).
    implementation(libs.morphe.patches.library)
    // Instagram specific patches and fingerprints shared with brosssh's bundle.
    implementation(libs.instagram.morphe.patches.library)
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

kotlin {
    compilerOptions {
        // The Instagram patch library exposes helpers as context parameters.
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

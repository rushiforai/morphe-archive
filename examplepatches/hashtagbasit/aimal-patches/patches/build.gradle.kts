group = "app.aimal"

patches {
    about {
        name = "Aimal Patches"
        description = "Playback and ad-removal patches for Crunchyroll, HBO Max, Disney+ and Viki"
        source = "https://github.com/hashtagbasit/aimal-patches"
        author = "hashtagbasit"
        contact = "https://github.com/hashtagbasit/aimal-patches/issues"
        website = "https://github.com/hashtagbasit/aimal-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the patched app.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    // Called by .releaserc during a release to regenerate patches-list.json.
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

group = "app.GinArena.onedm"

patches {
    about {
        name = "GinArena Patch"
        description = "Privacy, ad-removal, and quality-of-life patches for free 1DM 20.0 (30257), CRICFy TV 7.3 (53), and CricZ TV 7.3 (10)."
        source = "https://github.com/ginDoki19/GinArena-patch"
        author = "ginDoki19"
        contact = "https://github.com/ginDoki19/GinArena-patch/issues"
        website = "https://github.com/ginDoki19/GinArena-patch"
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
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

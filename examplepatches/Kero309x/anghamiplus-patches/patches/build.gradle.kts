group = "app.anghami"

patches {
    // Anghami 8.0.28 local-Plus research patches (local gates only;
    // server premium checks remain). See README.md.
    about {
        name = "Anghami Plus Patches"
        description = "Advanced feature unlock, ad-free playback, and UI enhancements for Anghami. " +
            "Based on the Anghami patch set by Mohamed Amr Nady " +
            "(mohamedamrnady/anghami-patches, GPLv3) - see ATTRIBUTION.md."
        source = "https://github.com/Kero309x/anghamiplus-patches"
        author = "Kero309x, based on work by Mohamed Amr Nady (@mohamedamrnady)"
        contact = "https://github.com/Kero309x/anghamiplus-patches/issues"
        website = "https://github.com/Kero309x/anghamiplus-patches"
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

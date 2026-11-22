group = "app.tiktoktv"

patches {
    about {
        name = "TikTok TV Patches"
        description = "Patches for TikTok TV."
        source = "https://github.com/dzungtvd/morphe-androidtv-patches"
        author = "TikTok TV Patches contributors"
        contact = "https://github.com/dzungtvd/morphe-androidtv-patches/issues"
        website = "https://github.com/dzungtvd/morphe-androidtv-patches"
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

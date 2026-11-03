group = "dev.nial"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "KYT Patches"
        description = "Morphe patches focused on TIDAL"
        source = "git@github.com:finzoyfunzo/kyt-patches.git"
        author = "FinzoYFunzo"
        contact = "https://github.com/finzoyfunzo/kyt-patches/issues"
        website = "https://github.com/finzoyfunzo/kyt-patches"
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

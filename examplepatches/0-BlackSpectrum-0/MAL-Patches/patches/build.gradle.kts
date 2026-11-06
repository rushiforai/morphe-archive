group = "app.spectre.patches"

patches {
    about {
        name = "Spectre patches"
        description = "Patches for MyAnimeList"
        source = "git@github.com:0-BlackSpectrum-0/MAL-Patches.git"
        author = "0-BlackSpectrum-0"
        contact = "na"
        website = "https://github.com/0-BlackSpectrum-0/MAL-Patches"
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

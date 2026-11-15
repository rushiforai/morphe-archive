group = "app.mika2"

patches {
    about {
        name = "Mika 2 Patches"
        description = "A single no-op patch so Morphe Manager can install Mika 2. It changes nothing in the app."
        source = "git@github.com:Razor573/mika2-morphe-patches.git"
        author = "Razor573"
        contact = "https://github.com/Razor573/mika2-morphe-patches"
        website = "https://github.com/Razor573/mika2-morphe-patches"
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

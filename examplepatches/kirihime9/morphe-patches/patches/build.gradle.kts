group = "app.kirihime"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "kirihime's patches"
        description = "Patches for apps I like"
        source = "https://github.com/kirihime9/morphe-patches"
        author = "KiriHime9"
        contact = "https://github.com/kirihime9/morphe-patches/issues"
        website = "https://github.com/kirihime9/morphe-patches"
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

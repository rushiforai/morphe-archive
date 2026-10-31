group = "app.tikkamasalla.stremio"

patches {
    about {
        name = "Stremio Morphe Patches"
        description = "Patches for Stremio and Vimu, for use with Morphe."
        source = "https://github.com/tikkamasalla/stremio-morphe-patches"
        author = "tikkamasalla"
        contact = "https://github.com/tikkamasalla/stremio-morphe-patches/issues"
        website = "https://github.com/tikkamasalla/stremio-morphe-patches"
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

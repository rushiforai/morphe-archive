group = "app.mightymorphing"

patches {
    about {
        name = "Mighty Morphing Patches"
        description = "Patches for Joey for Reddit 2.1.6.5"
        source = "https://github.com/ZoomSass/Mighty-Morphing"
        author = "ZoomSass"
        contact = "https://github.com/ZoomSass/Mighty-Morphing"
        website = "https://github.com/ZoomSass/Mighty-Morphing"
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

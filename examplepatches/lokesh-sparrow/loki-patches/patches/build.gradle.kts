group = "app.linkedin"

patches {
    about {
        name = "Loki Patches"
        description = "LinkedIn patches for use with Morphe"
        source = "https://github.com/lokesh-sparrow/loki-patches"
        author = "Lokesh Sparrow"
        contact = "na"
        website = "https://github.com/lokesh-sparrow/loki-patches"
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

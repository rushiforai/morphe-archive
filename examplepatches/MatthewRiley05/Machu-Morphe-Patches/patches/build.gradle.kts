group = "io.github.matthewriley05"

patches {
    about {
        name = "Machu Patches"
        description = "Unofficial patches for apps I use."
        source = "https://github.com/MatthewRiley05/Machu-Morphe-Patches"
        author = "MatthewRiley05"
        contact = "https://github.com/MatthewRiley05/Machu-Morphe-Patches/issues"
        website = "https://raymundo.dev"
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

group = "gtade"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "GTA SA DE Mods (RAZORRZR0)"
        description = "AML mod loader and PC mod ports for GTA: San Andreas - Definitive Edition"
        source = "git@github.com:RAZORRZR0/gtasa-de-morphe-patches.git"
        author = "RAZORRZR0"
        contact = "na"
        website = "https://github.com/RAZORRZR0/GTASA-DE-Android-ModLoader"
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

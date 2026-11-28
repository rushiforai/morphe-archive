group = "app.template"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Cinema HQ Patched"
        description = "CinemaHQ background service neutralization patches"
        source = "git@github.com:AbShaheen184/CinemaHQ-Morphe_Patches.git"
        author = "AbShaheen184"
        contact = "na"
        website = "https://github.com/AbShaheen184/CinemaHQ-Morphe_Patches"
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

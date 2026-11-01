group = "app.sarvo"

patches {
    about {
        name = "SARVO Patches"
        description = "A multi-app collection of Android patches for Morphe Manager, currently including Panasonic MirAIe."
        source = "https://github.com/sarvottam99/SARVO-Patches"
        author = "Sarvottam"
        contact = "https://github.com/sarvottam99"
        website = "https://github.com/sarvottam99/SARVO-Patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patches.library)
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

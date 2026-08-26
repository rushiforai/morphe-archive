group = "app.v4n1x"

patches {
    about {
        name = "V4n1X Patches"
        description = "Patches for SoundCloud"
        source = "https://github.com/V4n1X/morphe-patches.git"
        author = "V4n1X"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patches.library)

    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

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

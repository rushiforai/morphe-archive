group = "app.ayufa"

patches {
    about {
        name = "Ayufa YouTube Patches"
        description = "Custom YouTube patches: live stream latency keeper (Android 8.0 target) and live chat clutter hider (current Android target)"
        source = "git@github.com:Ayufa/youtube-custom-patches.git"
        author = "Ayufa"
        contact = "https://github.com/Ayufa/youtube-custom-patches/issues"
        website = "https://github.com/Ayufa/youtube-custom-patches"
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

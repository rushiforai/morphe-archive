group = "app.threadripper"

patches {
    about {
        name = "Thread Ripper patches"
        description = "Multi-connection download and larger buffer preload for YouTube with spoofed (non-SABR) video streams. Use alongside Morphe Patches."
        source = "https://github.com/bennytsai1234/youtube-thread-ripper"
        author = "bennytsai1234"
        contact = "na"
        website = "https://github.com/bennytsai1234/youtube-thread-ripper"
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

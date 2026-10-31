group = "app.spotify.capture"

patches {
    about {
        name = "Spotify capture patches (RootlessJamesDSP)"
        description = "Minimal Morphe patches for com.spotify.music internal audio capture"
        source = "https://github.com/aioue/morphe-spotify-capture-patches"
        author = "aioue"
        contact = "https://github.com/aioue/morphe-spotify-capture-patches/issues"
        website = "https://github.com/timschneeb/RootlessJamesDSP#spotify-support-patch"
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

    named("buildAndroid") {
        finalizedBy("generatePatchesList")
    }
}

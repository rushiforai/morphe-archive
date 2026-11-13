group = "app.extendedplaylists"

patches {
    about {
        name = "Extended YouTube Playlists"
        description = "Shows the playlists YouTube builds for every channel but never lists"
        source = "https://github.com/chocolavv/extended-youtube-playlists"
        author = "chocolavv"
        contact = "https://github.com/chocolavv/extended-youtube-playlists/issues"
        website = "https://github.com/chocolavv/extended-youtube-playlists"
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

group = "app.pixivpatched"

patches {
    about {
        name = "PixivPatched"
        description = "Morphe patches for Pixiv Android (AI artwork flagger, adblocking, artwork downloader, premium features, OLED theme, enhanced viewer)"
        source = "https://github.com/Piracola/Pixiv-Patched"
        author = "Piracola"
        contact = "na"
        website = "https://github.com/Piracola/Pixiv-Patched"
        license = "GNU General Public License v3.0"
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

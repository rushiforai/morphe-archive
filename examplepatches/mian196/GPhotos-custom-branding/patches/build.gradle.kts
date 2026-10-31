group = "app.template"

patches {
    about {
        name = "Google Photos Custom Branding"
        description = "Custom launcher icon and app name patches for Google Photos"
        source = "https://github.com/mian196/GPhotos-custom-branding"
        author = "mian196"
        contact = "na"
        website = "https://github.com/mian196/GPhotos-custom-branding"
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

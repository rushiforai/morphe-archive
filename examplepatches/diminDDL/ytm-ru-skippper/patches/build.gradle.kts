group = "dev.ytmruskippper"

patches {
    about {
        name = "YTM ru Skippper"
        description = "Skips russian tracks in YouTube Music and shows artist country flags"
        source = "git@github.com:diminDDL/ytm-ru-skippper.git"
        author = "diminDDL"
        contact = "https://github.com/diminDDL/ytm-ru-skippper/issues"
        website = "https://github.com/diminDDL/ytm-ru-skippper"
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

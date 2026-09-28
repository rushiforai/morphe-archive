group = "io.github.trivisa_itihasa.uyu"

patches {
    about {
        name = "uyu"
        description = "Patches for Twitch: channel points auto claim, Niconico-style scrolling comments and ad blocking."
        source = "git@github.com:trivisa-itihasa/uyu.git"
        author = "trivisa-itihasa"
        contact = "https://github.com/trivisa-itihasa/uyu/issues"
        website = "https://github.com/trivisa-itihasa/uyu"
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

group = "app.markpaul099"

patches {
    about {
        name = "Gboard GIFs Extended"
        description = "Google Images GIF search with SafeSearch settings, custom app name and package name for Gboard"
        source = "git@github.com:markpaul099/gboard-gifs-extended.git"
        author = "markpaul099"
        contact = "https://github.com/markpaul099/gboard-gifs-extended/issues"
        website = "https://github.com/markpaul099/gboard-gifs-extended"
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

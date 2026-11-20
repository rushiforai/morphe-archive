group = "app.windowshopper"

patches {
    about {
        name = "Window Shopper"
        description = "Morphe patches that declutter shopping apps"
        source = "git@github.com:semi-column/window-shopper.git"
        author = "semi-column"
        contact = "https://github.com/semi-column/window-shopper/issues"
        website = "https://github.com/semi-column/window-shopper"
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

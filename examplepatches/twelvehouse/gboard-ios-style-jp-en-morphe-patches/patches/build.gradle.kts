group = "app.gboardios"

patches {
    about {
        name = "Gboard iOS-style JP/EN Patches"
        description = "iOS-style layouts for Gboard: the Japanese flick-only 12-key keyboard and the English QWERTY and symbol keyboards"
        source = "git@github.com:twelvehouse/gboard-ios-style-jp-en-morphe-patches.git"
        author = "twelvehouse"
        contact = "https://github.com/twelvehouse/gboard-ios-style-jp-en-morphe-patches/issues"
        website = "https://github.com/twelvehouse/gboard-ios-style-jp-en-morphe-patches"
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

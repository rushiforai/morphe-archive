group = "app.songsterr"

patches {
    about {
        name = "Songsterr Patches"
        description = "Community patches for Songsterr (com.songsterr): unlock Plus/Premium"
        source = "git@gitlab.com:georgewoodall82/songsterr-patches.git"
        author = "georgewoodall82"
        contact = "na"
        website = "https://gitlab.com/georgewoodall82/songsterr-patches"
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

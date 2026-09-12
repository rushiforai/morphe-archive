group = "app.lockhart"

patches {
    about {
        name = "LOCKhart07 Patches"
        description = "Personal Morphe patches. Currently: unlock every deck in Heads Up!"
        source = "git@github.com:LOCKhart07/morphe-patches.git"
        author = "LOCKhart07"
        contact = "https://github.com/LOCKhart07/morphe-patches/issues"
        website = "https://github.com/LOCKhart07/morphe-patches"
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

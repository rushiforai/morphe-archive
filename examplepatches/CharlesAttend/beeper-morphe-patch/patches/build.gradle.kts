group = "app.charlesattend"

patches {
    about {
        name = "CharlesAttend Beeper Patches"
        description = "Patches for the Beeper Android app"
        source = "git@github.com:CharlesAttend/beeper-morphe-patch.git"
        author = "CharlesAttend"
        contact = "https://github.com/CharlesAttend/beeper-morphe-patch/issues"
        website = "https://github.com/CharlesAttend/beeper-morphe-patch"
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

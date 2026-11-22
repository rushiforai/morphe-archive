group = "app.akkay"

patches {
    about {
        name = "Akkay Patches"
        description = "Custom patches compatible with Morphe."
        source = "git@github.com:akkay-dev/morphe-patches.git"
        author = "akkay-dev"
        contact = "https://github.com/akkay-dev/morphe-patches/issues"
        website = "https://github.com/akkay-dev/morphe-patches"
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

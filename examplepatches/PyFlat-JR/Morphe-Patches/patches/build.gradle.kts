group = "app.pyflat"

patches {
    about {
        name = "PyFlat Patches"
        description = "Custom patches for Android apps, maintained by PyFlat."
        source = "git@github.com:PyFlat-JR/morphe-patches.git"
        author = "PyFlat-JR"
        contact = "info@pyflat.de"
        website = "https://pyflat.de"
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

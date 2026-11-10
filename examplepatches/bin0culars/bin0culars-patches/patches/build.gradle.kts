group = "app.bin0culars"

patches {
    about {
        name = "bin0culars-patches"
        description = "Patches for my favourite apps to improve the quality of life; especially on a tablet."
        source = "git@github.com:bin0culars/bin0culars-patches.git"
        author = "bin0culars"
        contact = "https://github.com/bin0culars/bin0culars-patches/issues"
        website = "https://github.com/bin0culars/bin0culars-patches"
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

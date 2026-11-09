group = "app.mitrosoft"

patches {
    about {
        name = "mitrosoft"
        description = "Patches for use with Morphe (TradingView and more)"
        source = "git@github.com:mirbyte/morphe-patches.git"
        author = "mirbyte"
        contact = "https://github.com/mirbyte/morphe-patches/issues"
        website = "https://github.com/mirbyte/morphe-patches"
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

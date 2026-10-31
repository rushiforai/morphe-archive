group = "app.local.patches"

patches {
    about {
        name = "Local Android Patches"
        description = "Custom Curve Pay patches: Flex visibility, privacy, Launchpad controls and plain feature names"
        source = "https://github.com/lorizisback/morphe-patches"
        author = "lorizisback"
        contact = "https://github.com/lorizisback/morphe-patches/issues"
        website = "https://github.com/lorizisback/morphe-patches"
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

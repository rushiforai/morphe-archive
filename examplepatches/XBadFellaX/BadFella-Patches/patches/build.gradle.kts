group = "app.badfella.patches"

patches {
    about {
        name = "BadFella Patches"
        description = "Community app patches by BadFella."
        author = "XBadFellaX; original TickTick patches by Paresh"
        source = "https://github.com/XBadFellaX/BadFella-Patches"
        contact = "https://github.com/XBadFellaX/BadFella-Patches/issues"
        website = "https://github.com/XBadFellaX/BadFella-Patches"
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

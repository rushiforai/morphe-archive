group = "app.anghami"

patches {
    // Anghami 8.0.28 local-Plus research patches (local gates only;
    // server premium checks remain). See README.md.
    about {
        name = "Kero309x Morphe Patches"
        description = "Modular Morphe patch bundle for Android bytecode transformation."
        source = "https://github.com/Kero309x/Kero309x-patches"
        author = "Kero309x"
        contact = "https://github.com/Kero309x/Kero309x-patches/issues"
        website = "https://github.com/Kero309x/Kero309x-patches"
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

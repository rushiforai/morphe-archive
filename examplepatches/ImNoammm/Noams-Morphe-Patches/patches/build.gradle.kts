group = "app.noam"

patches {
    about {
        name = "Noam's Morphe Patches"
        description = "My Morphe patches for the apps I use."
        source = "git@github.com:ImNoammm/Noams-Morphe-Patches.git"
        author = "ImNoammm"
        contact = "na"
        website = "https://github.com/ImNoammm/Noams-Morphe-Patches"
        license = "GNU General Public License v3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
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

    publish {
        dependsOn("generatePatchesList")
    }
}

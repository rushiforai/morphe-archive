group = "app.morphe"

patches {
    about {
        name = "Morphe Portal Patches"
        description = "Custom Morphe patches for Meta Portal apps"
        source = "git@github.com:BlazeFTL/Morphe-Portal-Patches-New.git"
        author = "BlazeFTL"
        contact = "na"
        website = "https://github.com/BlazeFTL/Morphe-Portal-Patches-New"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
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

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

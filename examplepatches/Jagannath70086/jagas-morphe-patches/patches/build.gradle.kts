group = "io.github.jagannath70086"

patches {
    about {
        name = "Jaga's Morphe Patches"
        description = "Personal Morphe patches for paid Android apps."
        source = "git@github.com:jagannath70086/jagas-morphe-patches.git"
        author = "jagannath70086"
        contact = "na"
        website = "https://github.com/jagannath70086/jagas-morphe-patches.git"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

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
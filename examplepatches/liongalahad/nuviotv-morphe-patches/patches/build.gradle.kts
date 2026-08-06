group = "io.github.liongalahad.nuviotv"

patches {
    about {
        name = "NuvioTV Morphe Patches"
        description = "Morphe patches for the official NuvioTV Android application"
        source = "https://github.com/liongalahad/nuviotv-morphe-patches"
        author = "liongalahad"
        contact = "https://github.com/liongalahad/nuviotv-morphe-patches/issues"
        website = "https://github.com/liongalahad/nuviotv-morphe-patches"
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

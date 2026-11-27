group = "app.morphe.patches.pixelcamera"

patches {
    about {
        name = "Pixel 10 Pro Camera patches"
        description = "Pixel 11 camera features and fixes for Pixel Camera 11.1.040 on the " +
            "Pixel 10 Pro (Tensor G5), plus Morphe Google Photos integration."
        source = "https://github.com/matteomorganti/pixel10pro-camera-patches"
        author = "pixel10pro-camera-patches contributors"
        contact = "na"
        website = "https://github.com/matteomorganti/pixel10pro-camera-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        // Required: large parts of the patcher API are declared with
        // `context(BytecodePatchContext)` context parameters.
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    testImplementation(kotlin("test"))
}

tasks {
    test {
        useJUnitPlatform()
        testLogging { events("passed", "skipped", "failed") }
    }

    // Regenerates ../patches-list.json, which Morphe Manager reads from the
    // source repository to list a bundle's patches without downloading it.
    register<JavaExec>("generatePatchesList") {
        description = "Build the patch bundle and regenerate patches-list.json"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}

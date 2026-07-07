group = "app.utsavrajput"

patches {
    about {
        name = "MODX Patches"
        description = "A modern collection of Android patches built for the Morphe ecosystem."
        source = "https://github.com/utsavrajputt/Modx-patches"
        author = "Utsav Rajput"
        contact = "https://github.com/utsavrajputt"
        website = "https://github.com/utsavrajputt/Modx-patches"
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
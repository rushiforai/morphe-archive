group = "app.patchlab"

patches {
    about {
        name = "ggyasin-morphe-patches"
        description = "Morphe patches maintained by ggYasin"
        source = "https://github.com/ggYasin/ggyasin-morphe-patches"
        author = "ggYasin"
        contact = "https://github.com/ggYasin"
        website = "https://github.com/ggYasin/ggyasin-morphe-patches"
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

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

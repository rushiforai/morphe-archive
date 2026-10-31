group = "io.github.epabafree"

patches {
    about {
        name = "SABP Eppy Patches"
        description = "Morphe patches that give Smart AudioBook Player a modern Material You look and new features."
        source = "git@github.com:epabafree/sabp-eppy-patches.git"
        author = "epabafree"
        contact = "na"
        website = "https://github.com/epabafree/sabp-eppy-patches"
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
}

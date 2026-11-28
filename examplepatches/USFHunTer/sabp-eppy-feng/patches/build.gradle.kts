group = "io.github.usfhunter"

patches {
    about {
        name = "SABP Eppy Feng"
        description = "Morphe patches that give Smart AudioBook Player a modern Material You look and new features. Fork of epabafree's SABP Eppy Patches with skipped-passage marking and whole-book transcription."
        source = "git@github.com:USFHunTer/sabp-eppy-feng.git"
        author = "USFHunTer (fork of epabafree)"
        contact = "na"
        website = "https://github.com/USFHunTer/sabp-eppy-feng"
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

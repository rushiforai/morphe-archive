group = "dev.freeman022026.rustore"

patches {
    about {
        name = "RuStore Privacy Patches"
        description = "Privacy hardening for the official RuStore Android app"
        source = "https://github.com/Freeman022026/rustore-privacy-patches"
        author = "Freeman022026"
        contact = "https://github.com/Freeman022026/rustore-privacy-patches/issues"
        website = "https://github.com/Freeman022026/rustore-privacy-patches"
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

group = "app.ipusnas"

patches {
    about {
        name = "iPusnas Patches"
        description = "Patches for the iPusnas digital library app."
        source = "git@github.com:kuchingneko28/ipusnas-patches.git"
        author = "kuchingneko"
        contact = "na"
        website = "na"
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
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    patchListGeneratorClasspath(libs.gson)
    patchListGeneratorClasspath("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("verifyPatches") {
        description = "Apply all patches to an APK and report fingerprint matches"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.VerifyPatchesKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

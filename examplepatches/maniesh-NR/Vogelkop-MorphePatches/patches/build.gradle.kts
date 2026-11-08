group = "app.morphe.patches.opera"

patches {
    about {
        name = "Vogelkop patches"
        description = "De-ads Opera Browser, Opera Beta and Opera GX: removes " +
            "sponsored Speed Dial tiles, disables the hidden Acceptable-Ads " +
            "partner whitelists and stops third-party ad modules from loading."
        source = "https://github.com/maniesh-NR/Vogelkop-MorphePatches"
        author = "maniesh-NR"
        contact = "https://github.com/maniesh-NR/Vogelkop-MorphePatches"
        website = "https://morphe.software/add-source?github=maniesh-NR/Vogelkop-MorphePatches"
        license = "AGPL-3.0"
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
    // Runtime dep of morhe-patcher; needed at compile time only by the local
    // PatchTestDriver (util/PatchTestDriver.kt), never by the patches themselves.
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generates patches-list.json from the compiled patches bundle"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("patchTestApk") {
        description = "Applies the built bundle to a local APK for verification (dev only)"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchTestDriverKt")
        if (project.hasProperty("testApk")) {
            systemProperty("testApk", project.property("testApk") as String)
        }
        if (project.hasProperty("testBundle")) {
            systemProperty("testBundle", project.property("testBundle") as String)
        }
        if (project.hasProperty("testOut")) {
            systemProperty("testOut", project.property("testOut") as String)
        }
        if (project.hasProperty("testPackage")) {
            systemProperty("testPackage", project.property("testPackage") as String)
        }
        jvmArgs("-Xmx2g")
    }
}

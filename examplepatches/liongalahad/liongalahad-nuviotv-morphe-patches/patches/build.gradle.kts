import java.util.zip.ZipFile

group = "io.github.liongalahad.nuviotv"

patches {
    about {
        name = "NuvioTV Morphe Patches"
        description = "Morphe patches for the official NuvioTV Android application"
        source = "https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches"
        author = "liongalahad"
        contact = "https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches/issues"
        website = "https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches"
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
    testImplementation(kotlin("test"))
}

tasks {
    val verifyAndroidBundle = register("verifyAndroidBundle") {
        description = "Verify the release patch bundle contains Android DEX bytecode"

        dependsOn("buildAndroid")

        doLast {
            val patchFile = layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile
            require(patchFile.isFile) { "Android patch bundle does not exist: $patchFile" }

            ZipFile(patchFile).use { archive ->
                val dexEntries = archive.entries().asSequence()
                    .filter { !it.isDirectory && it.name.substringAfterLast('/').matches(Regex("classes\\d*\\.dex")) }
                    .toList()

                require(dexEntries.isNotEmpty()) {
                    "Android patch bundle is missing DEX entries: $patchFile"
                }
                require(dexEntries.all { it.size > 0L }) {
                    "Android patch bundle contains an empty DEX entry: $patchFile"
                }
            }
        }
    }

    processResources {
        inputs.property("morphePatchVersion", project.version.toString())
        filesMatching("morphe-build.properties") {
            expand("version" to project.version.toString())
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        // The published bundle is consumed on Android by Morphe Manager. Building only the
        // JVM archive leaves out classes.dex and makes Manager report zero patches.
        dependsOn(verifyAndroidBundle)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(project.version.toString())
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

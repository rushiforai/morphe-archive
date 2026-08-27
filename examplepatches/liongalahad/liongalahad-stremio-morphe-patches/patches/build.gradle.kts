import java.util.jar.JarFile

group = "io.github.liongalahad.stremio"

patches {
    about {
        name = "Stremio Morphe Patches"
        description = "Morphe patches for the official Stremio Android TV application"
        source = "https://github.com/liongalahad/stremio-androidTV-morphe-patches"
        author = "liongalahad"
        contact = "https://github.com/liongalahad/stremio-androidTV-morphe-patches/issues"
        website = "https://github.com/liongalahad/stremio-androidTV-morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
    sourceSets.named("main") {
        kotlin.srcDirs(
            "src/main/kotlin",
            "multi-account/morphe/src/main/kotlin",
            "addon-reordering/morphe/src/main/kotlin",
            "side-by-side-installation/morphe/src/main/kotlin"
        )
    }
}

// Gson is needed by the release-only patch list generator but must never be
// packaged into the patch bundle.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    processResources {
        inputs.property("morphePatchVersion", project.version.toString())
        filesMatching("morphe-build.properties") {
            expand("version" to project.version.toString())
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build the Morphe bundle and generate patches-list.json"
        // Morphe Manager loads patches from DEX on Android. The regular JVM
        // build only creates class files, while buildAndroid adds classes.dex
        // to the MPP after creating the JAR.
        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(project.version.toString())

        doLast {
            val bundle = project.tasks.getByName("jar").outputs.files.singleFile
            JarFile(bundle).use { jar ->
                check(jar.entries().asSequence().any { entry ->
                    entry.name.endsWith(".dex", ignoreCase = true) && entry.size > 0L
                }) {
                    "Android patch bundle is missing a non-empty DEX entry: ${bundle.absolutePath}"
                }
            }
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

import com.android.tools.r8.CompilationMode
import com.android.tools.r8.D8
import com.android.tools.r8.D8Command
import com.android.tools.r8.OutputMode
import com.android.tools.r8.utils.ArchiveResourceProvider
import ru.vyarus.gradle.plugin.animalsniffer.AnimalSniffer

plugins {
    alias(libs.plugins.animalsniffer)
}

group = "app.stylus"

patches {
    about {
        name = "Stylus"
        description = "A collection of font-related Morphe patches to improve readability/accessibility."
        source = "git@github.com:ch3thanhs/stylus.git"
        author = "ch3thanhs"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    signature(libs.android.api.signature) { artifact { type = "signature" } }
}

animalsniffer {
    // Check the assembled bundle, which also includes bundled dependencies.
    sourceSets = emptyList()
}

tasks {
    val patchBundle = jar.flatMap { it.archiveFile }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        argumentProviders.add(CommandLineArgumentProvider {
            listOf(patchBundle.get().asFile.absolutePath)
        })
    }

    // Check the class files after D8 has backported calls for Android API 26.
    val desugarPatchesClasses = register("desugarPatchesClasses") {
        val compileClasspath = sourceSets["main"].compileClasspath
        val output = layout.buildDirectory.file("animalsniffer/patches-desugared.jar")

        inputs.file(patchBundle)
        inputs.files(compileClasspath)
        outputs.file(output)

        doLast {
            D8.run(
                D8Command.builder()
                    .addProgramResourceProvider(
                        ArchiveResourceProvider.fromArchive(patchBundle.get().asFile.toPath(), true)
                    )
                    .addClasspathFiles(compileClasspath.files.filter { it.exists() }.map { it.toPath() })
                    .setMode(CompilationMode.DEBUG)
                    .setMinApiLevel(26)
                    .setOutput(output.get().asFile.toPath(), OutputMode.ClassFile)
                    .build()
            )
        }
    }

    val extractPatchesClasses = register<Sync>("extractPatchesClasses") {
        from(desugarPatchesClasses.map { zipTree(it.outputs.files.singleFile) }) {
            include("**/*.class")
        }
        into(layout.buildDirectory.dir("animalsniffer/patches-classes"))
    }

    val checkAndroidApi = register<AnimalSniffer>("checkAndroidApi") {
        description = "Checks that the patch bundle uses APIs available on Android API 26."
        group = "verification"

        source(extractPatchesClasses)
        classpath = sourceSets["main"].compileClasspath
        animalsnifferSignatures = configurations["signature"]
        animalsnifferClasspath = configurations["animalsniffer"]
        sourcesDirs = sourceSets["main"].allSource.sourceDirectories
        reports.text.outputLocation = layout.buildDirectory.file("reports/animalsniffer/patches.text")
        reports.csv.outputLocation = layout.buildDirectory.file("reports/animalsniffer/patches.csv")
    }

    check {
        dependsOn(checkAndroidApi)
    }

    named("buildAndroid") {
        dependsOn(checkAndroidApi)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

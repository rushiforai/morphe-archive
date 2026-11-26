import com.android.tools.r8.CompilationMode
import com.android.tools.r8.D8
import com.android.tools.r8.D8Command
import com.android.tools.r8.OutputMode
import com.android.tools.r8.utils.ArchiveResourceProvider
import ru.vyarus.gradle.plugin.animalsniffer.AnimalSniffer

plugins {
    alias(libs.plugins.animalsniffer)
}

group = "de.mobile.morphe"
version = "1.0.2"

patches {
    about {
        name = "mobile.de Archive & De-Clutter Patches"
        description = "Archiviert mobile.de Inserate lokal und in Google Drive und bietet 6 einzeln schaltbare De-Clutter-Patches (Werbung, Finanzierung, Partner-Widgets, Express-Verkauf, Umfragen, Top-Inserate)."
        source = "https://github.com/itnaegele/mobile-de-morphe-patches"
        author = "itnaegele"
        contact = "https://github.com/itnaegele/mobile-de-morphe-patches/issues"
        website = "https://github.com/itnaegele/mobile-de-morphe-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.morphe.patcher)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")

    signature(libs.android.api.signature) { artifact { type = "signature" } }
}

animalsniffer {
    sourceSets = emptyList()
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("verifyOnApk") {
        description = "Applies built .mpp bundle to pulled mobile.de APK with validate=true"
        dependsOn("buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("VerifyPatchOnApkKt")
        jvmArgs("-Xmx4g")
    }

    val desugarPatchesClasses = register("desugarPatchesClasses") {
        val patchesFile = jar.flatMap { it.archiveFile }
        val classpath = sourceSets["main"].compileClasspath
        val output = layout.buildDirectory.file("animalsniffer/patches-desugared.jar")

        inputs.file(patchesFile)
        inputs.files(classpath)
        outputs.file(output)

        doLast {
            val patchesPath = patchesFile.get().asFile.toPath()
            val outputPath = output.get().asFile.toPath()

            D8.run(
                D8Command.builder()
                    .addProgramResourceProvider(ArchiveResourceProvider.fromArchive(patchesPath, true))
                    .addClasspathFiles(classpath.files.filter { it.exists() }.map { it.toPath() })
                    .setMode(CompilationMode.DEBUG)
                    .setMinApiLevel(26)
                    .setOutput(outputPath, OutputMode.ClassFile)
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
        description = "Checks that the patches file only uses APIs available on Android."
        group = "verification"

        source(extractPatchesClasses)
        classpath = sourceSets["main"].compileClasspath
        animalsnifferSignatures = configurations["signature"]
        animalsnifferClasspath = configurations["animalsniffer"]
        sourcesDirs = sourceSets["main"].allSource.sourceDirectories
        reports.text.outputLocation = layout.buildDirectory.file("reports/animalsniffer/patches.text")
        reports.csv.outputLocation = layout.buildDirectory.file("reports/animalsniffer/patches.csv")
    }

    test {
        failOnNoDiscoveredTests = false
    }

    check {
        dependsOn(checkAndroidApi)
    }

    named("buildAndroid") {
        dependsOn(checkAndroidApi)
    }

    publish {
        dependsOn("generatePatchesList")
    }
}

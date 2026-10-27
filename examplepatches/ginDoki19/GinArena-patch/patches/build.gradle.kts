import com.android.tools.r8.CompilationMode
import com.android.tools.r8.D8
import com.android.tools.r8.D8Command
import com.android.tools.r8.OutputMode
import com.android.tools.r8.utils.ArchiveResourceProvider
import java.util.jar.JarEntry
import java.util.jar.JarOutputStream

group = "app.GinArena.onedm"

patches {
    about {
        name = "GinArena Patch"
        description = "Privacy, ad-removal, and quality-of-life patches for free 1DM 20.0 (30257), CRICFy TV 7.3 (53), CricZ TV 7.3 (10), and MX Player 3.4.1 / 3.4.0 / 3.3.1."
        source = "https://github.com/ginDoki19/GinArena-patch"
        author = "ginDoki19"
        contact = "https://github.com/ginDoki19/GinArena-patch/issues"
        website = "https://github.com/ginDoki19/GinArena-patch"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

// Pure-JDK + D8 compilation of the MX Player in-memory ClassicThemeEngine (.mpe) extension
// (requires zero Android SDK installation on Windows or GitHub Actions).
val mxStubClassesDir = layout.buildDirectory.dir("mxplayerExt/stubs")
val mxExtClassesDir = layout.buildDirectory.dir("mxplayerExt/classes")
val mxExtWorkDir = layout.buildDirectory.dir("mxplayerExt/work")
val mxGeneratedResourcesDir = layout.buildDirectory.dir("generated/mxplayerMpeResources")

fun packDirToJar(sourceDir: File, targetJar: File) {
    targetJar.parentFile.mkdirs()
    JarOutputStream(targetJar.outputStream().buffered()).use { jos ->
        sourceDir.walkTopDown()
            .filter { it.isFile && it.extension == "class" }
            .sortedBy { it.invariantSeparatorsPath }
            .forEach { file ->
                val relPath = file.relativeTo(sourceDir).invariantSeparatorsPath
                jos.putNextEntry(JarEntry(relPath))
                file.inputStream().use { it.copyTo(jos) }
                jos.closeEntry()
            }
    }
}

val compileMxPlayerExtensionStubs = tasks.register<JavaCompile>("compileMxPlayerExtensionStubs") {
    source = fileTree("src/extensionStub/java")
    classpath = files()
    destinationDirectory.set(mxStubClassesDir)
    options.release.set(8)
}

val compileMxPlayerExtensionJava = tasks.register<JavaCompile>("compileMxPlayerExtensionJava") {
    dependsOn(compileMxPlayerExtensionStubs)
    source = fileTree("src/extension/mxplayer/java")
    classpath = files(mxStubClassesDir)
    destinationDirectory.set(mxExtClassesDir)
    options.release.set(8)
}

val buildMxPlayerExtensionMpe = tasks.register("buildMxPlayerExtensionMpe") {
    dependsOn(compileMxPlayerExtensionJava)
    inputs.dir(mxExtClassesDir)
    inputs.dir(mxStubClassesDir)
    outputs.dir(mxGeneratedResourcesDir)

    doLast {
        val classesDir = mxExtClassesDir.get().asFile
        val stubsDir = mxStubClassesDir.get().asFile
        val workDir = mxExtWorkDir.get().asFile.apply {
            deleteRecursively()
            mkdirs()
        }
        val programJar = workDir.resolve("program.jar")
        val stubsJar = workDir.resolve("stubs.jar")
        val dexDir = workDir.resolve("dex").apply { mkdirs() }

        packDirToJar(classesDir, programJar)
        packDirToJar(stubsDir, stubsJar)

        val outResRoot = mxGeneratedResourcesDir.get().asFile.apply {
            deleteRecursively()
        }
        val outMpeFile = outResRoot.resolve("extensions/mxplayer.mpe").apply {
            parentFile.mkdirs()
        }

        val d8Cmd = D8Command.builder()
            .addProgramResourceProvider(ArchiveResourceProvider.fromArchive(programJar.toPath(), true))
            .addClasspathFiles(listOf(stubsJar.toPath()))
            .setMode(CompilationMode.RELEASE)
            .setMinApiLevel(24)
            .setOutput(dexDir.toPath(), OutputMode.DexIndexed)
            .build()
        D8.run(d8Cmd)

        val compiledDex = dexDir.resolve("classes.dex")
        check(compiledDex.isFile) { "D8 did not emit classes.dex in $dexDir" }
        compiledDex.copyTo(outMpeFile, overwrite = true)
    }
}

sourceSets.named("main") {
    resources.srcDir(mxGeneratedResourcesDir)
}

tasks {
    named("processResources") {
        dependsOn(buildMxPlayerExtensionMpe)
    }

    matching { it.name == "sourcesJar" }.configureEach {
        dependsOn(buildMxPlayerExtensionMpe)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build, "buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

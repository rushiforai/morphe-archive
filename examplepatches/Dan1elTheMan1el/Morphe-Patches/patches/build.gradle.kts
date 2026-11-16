import com.android.tools.r8.CompilationMode
import com.android.tools.r8.D8
import com.android.tools.r8.D8Command
import com.android.tools.r8.OutputMode
import org.gradle.api.tasks.compile.JavaCompile

group = "app.danielthemaniel"

patches {
    about {
        name = "DanielTheManiel's Morphe Patches"
        description = "New phone, who dis"
        source = "github"
        author = "DanielTheManiel"
        contact = "https://github.com/Dan1elTheMan1el"
        website = "https://github.com/Dan1elTheMan1el/Morphe-Patches"
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

// ---------------------------------------------------------------------------------------------
// Extensions
//
// Every folder  src/extension/java/app/danielthemaniel/patches/<app>/extension/
// is compiled and dexed into  extensions/<app>.dex  inside the .mpp.
// A patch loads it with  extendWith("extensions/<app>.dex").
//
// To add an extension, drop a .java file into the app's extension folder. No build changes needed.
// ---------------------------------------------------------------------------------------------

// android.jar is only used as compile/dex library stubs. Resolved from (in order):
// -PandroidJar=..., ANDROID_HOME, ANDROID_SDK_ROOT, the default macOS SDK location.
val androidJar: File = run {
    val explicit = providers.gradleProperty("androidJar").orNull
    if (explicit != null) return@run file(explicit)
    val sdkRoot = System.getenv("ANDROID_HOME")
        ?: System.getenv("ANDROID_SDK_ROOT")
        ?: "${System.getProperty("user.home")}/Library/Android/sdk"
    file("$sdkRoot/platforms/android-36/android.jar")
}

val extensionPackageDir = "app/danielthemaniel/patches"
val extensionSourceRoot = file("src/extension/java")
val extensionDexOutput = layout.buildDirectory.dir("generated/extension-dex")

sourceSets {
    create("extension") {
        java.srcDir(extensionSourceRoot)
    }
    // The dex files live in their own generated resource root, so processResources copies them
    // into the jar instead of wiping them (which is what happened when they were written straight
    // into build/resources/main).
    named("main") {
        resources.srcDir(extensionDexOutput)
    }
}

tasks.named<JavaCompile>("compileExtensionJava") {
    classpath += files(androidJar)
    doFirst {
        if (!androidJar.exists()) {
            throw GradleException(
                "android.jar not found at $androidJar. Set ANDROID_HOME or pass -PandroidJar=/path/to/android.jar",
            )
        }
    }
}

val dexExtensions = tasks.register("dexExtensions") {
    description = "Dexes each <app>/extension folder into extensions/<app>.dex."
    group = "build"

    val compileTask = tasks.named<JavaCompile>("compileExtensionJava")
    dependsOn(compileTask)

    val classesDir = compileTask.flatMap { it.destinationDirectory }
    inputs.dir(classesDir).optional()
    inputs.file(androidJar).optional()
    outputs.dir(extensionDexOutput)

    doLast {
        val outRoot = extensionDexOutput.get().asFile
        val extensionsDir = outRoot.resolve("extensions")
        outRoot.deleteRecursively()
        extensionsDir.mkdirs()

        val appsRoot = classesDir.get().asFile.resolve(extensionPackageDir)
        val appDirs = appsRoot.listFiles()
            ?.filter { it.resolve("extension").isDirectory }
            ?.sortedBy { it.name }
            .orEmpty()

        appDirs.forEach { appDir ->
            val classFiles = appDir.resolve("extension")
                .walkTopDown()
                .filter { it.isFile && it.extension == "class" }
                .map { it.toPath() }
                .toList()
            if (classFiles.isEmpty()) return@forEach

            val workDir = temporaryDir.resolve(appDir.name).apply {
                deleteRecursively()
                mkdirs()
            }

            D8.run(
                D8Command.builder()
                    .addProgramFiles(classFiles)
                    .addLibraryFiles(androidJar.toPath())
                    .setMinApiLevel(28)
                    .setMode(CompilationMode.RELEASE)
                    .setOutput(workDir.toPath(), OutputMode.DexIndexed)
                    .build(),
            )

            val dex = workDir.resolve("classes.dex")
            check(dex.exists()) { "D8 produced no classes.dex for extension '${appDir.name}'" }
            dex.copyTo(extensionsDir.resolve("${appDir.name}.dex"), overwrite = true)
            logger.lifecycle("Extension: extensions/${appDir.name}.dex (${classFiles.size} classes)")
        }
    }
}

tasks {
    withType<JavaCompile>().configureEach {
        options.release.set(11)
    }

    processResources {
        dependsOn(dexExtensions)
    }

    // The sources jar also reads the main resource dirs, so it must wait for the dex files too.
    named("sourcesJar") {
        dependsOn(dexExtensions)
    }

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

/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-gradle-plugin
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches-gradle-plugin/commit/b935371b88743e3e15dceb502ab634d99212d380
 */

package app.morphe.patches.gradle

import com.android.tools.build.apkzlib.zip.ZFile
import com.android.tools.r8.CompilationMode
import com.android.tools.r8.D8
import com.android.tools.r8.D8Command
import com.android.tools.r8.OutputMode
import com.android.tools.r8.utils.ArchiveResourceProvider
import org.gradle.api.GradleException
import org.gradle.api.JavaVersion
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.UnknownProjectException
import org.gradle.api.artifacts.VersionCatalogsExtension
import org.gradle.api.file.DuplicatesStrategy
import org.gradle.api.plugins.JavaPluginExtension
import org.gradle.api.publish.PublishingExtension
import org.gradle.api.tasks.SourceSetContainer
import org.gradle.jvm.tasks.Jar
import org.gradle.kotlin.dsl.get
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension
import org.jetbrains.kotlin.gradle.plugin.KotlinPluginWrapper
import java.io.File
import java.util.Properties

@Suppress("unused")
abstract class PatchesPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        val extension = project.extensions.create("patches", PatchesExtension::class.java)

        project.configureDependencies()
        project.configureKotlin()
        project.configureJava()
        project.configureConsumeExtensions(extension)
        project.configureJarTask(extension)
        project.configurePublishing(extension)
    }

    /**
     * Adds the dependencies Morphe Patcher and SMALI to the project.
     * The versions are fetched from the version catalog by the respective project.
     *
     * These dependencies are added to a separate "patcherProvided" configuration
     * because they are provided at runtime by the application that loads the patches.
     * The "implementation" configuration extends from "patcherProvided" so that these
     * dependencies are still available for compilation and runtime tasks,
     * but they can be excluded when bundling dependencies into the patches file.
     */
    private fun Project.configureDependencies() {
        val patcherProvidedScope = configurations.dependencyScope("patcherProvided").get()
        configurations.resolvable("patcherProvidedClasspath") {
            it.extendsFrom(patcherProvidedScope)
        }

        afterEvaluate {
            configurations.getByName("implementation").extendsFrom(patcherProvidedScope)

            val catalog = extensions.getByType(VersionCatalogsExtension::class.java).named("libs")

            operator fun String.invoke(versionAlias: String) = dependencies.add(
                "patcherProvided",
                "$this:" + catalog.findVersion(versionAlias).orElseThrow {
                    IllegalArgumentException("Version with alias $versionAlias not found in version catalog")
                },
            )

            "app.morphe:morphe-patcher"("morphe-patcher")
            "com.github.MorpheApp.smali:smali"("smali")
        }
    }

    /**
     * Configures the Kotlin plugin with JVM 11 as the target because JVM 11 is the target on Android.
     */
    private fun Project.configureKotlin() {
        pluginManager.apply(KotlinPluginWrapper::class.java)

        extensions.configure<KotlinJvmProjectExtension>("kotlin") {
            it.compilerOptions {
                jvmTarget.set(JvmTarget.JVM_11)
            }
        }
    }

    /**
     * Configures the Java plugin with Java 11 as the target because Java 11 is the target on Android.
     * Additionally, adds sources and javadoc JARs, as patches have a public API.
     */
    private fun Project.configureJava() {
        extensions.configure<JavaPluginExtension>("java") {
            it.targetCompatibility = JavaVersion.VERSION_11

            it.withSourcesJar()
            it.withJavadocJar()
        }
    }

    /**
     * Adds a task to build the DEX file of the patches and adds it to the patches file to use on Android,
     * adds the publishing plugin to the project to publish the patches API and
     * configures the publication with the "about" information from the extension.
     */
    private fun Project.configurePublishing(patchesExtension: PatchesExtension) {
        val buildAndroid = tasks.register("buildAndroid") { task ->
            task.description = "Builds the project for Android by compiling to DEX and adding it to the patches file."
            task.group = "build"

            task.dependsOn(tasks["jar"])

            task.doLast {
                val workingDirectory = layout.buildDirectory.dir("morphe").get().asFile.also(File::mkdirs)

                val patchesFile = tasks["jar"].outputs.files.first()
                val classesZipFile = workingDirectory.resolve("classes.zip")

                val d8Builder = D8Command.builder()
                    .addProgramResourceProvider(ArchiveResourceProvider.fromArchive(patchesFile.toPath(), true))
                    .setMode(CompilationMode.RELEASE)
                    .setOutput(classesZipFile.toPath(), OutputMode.DexIndexed)
                    .setMinApiLevel(26)

                // Add android.jar as a library to D8 to allow desugaring if it is found.
                getAndroidJar()?.let {
                    d8Builder.addLibraryFiles(it.toPath())
                }

                // Add the compile and runtime classpath to D8 to allow desugaring project dependencies.
                val runtimeClasspath = configurations.getByName("runtimeClasspath")
                val compileClasspath = configurations.getByName("compileClasspath")

                val classpathFiles = (runtimeClasspath.files + compileClasspath.files)
                    .filter { it.exists() && it != patchesFile }
                    .distinctBy { it.absolutePath }
                    .map { it.toPath() }

                if (classpathFiles.isNotEmpty()) {
                    d8Builder.addClasspathFiles(classpathFiles)
                }

                d8Builder.build().let(D8::run)

                ZFile.openReadWrite(patchesFile).use { zFile ->
                    zFile.mergeFrom(ZFile.openReadOnly(classesZipFile)) { false }
                }
            }
        }

        pluginManager.apply("maven-publish")

        extensions.configure(PublishingExtension::class.java) { extension ->
            // Necessary for the signing plugin for a publication to be created
            // and the signing plugin to sign the publication, when no repositories are defined.
            extension.repositories.mavenLocal {
                it.name = "DummyMavenLocal"
            }
        }

        // Used by gradle-semantic-release-plugin.
        // Tracking: https://github.com/KengoTODA/gradle-semantic-release-plugin/issues/435
        tasks["publish"].apply {
            dependsOn(buildAndroid)
        }
    }

    /**
     * Configures the project to consume the extension artifacts and add them to the resources of the patches project.
     */
    private fun Project.configureConsumeExtensions(patchesExtension: PatchesExtension) {
        val extensionsProject = try {
            project(patchesExtension.extensionsProjectPath ?: return)
        } catch (e: UnknownProjectException) {
            return
        }

        val extensionProjects = extensionsProject.subprojects.filter { extensionProject ->
            extensionProject.plugins.hasPlugin(ExtensionPlugin::class.java)
        }

        val extensionsDependencyScopeConfiguration =
            configurations.dependencyScope("extensionsDependencyScope").get()
        val extensionsConfiguration = configurations.resolvable("extensionConfiguration").apply {
            configure { it.extendsFrom(extensionsDependencyScopeConfiguration) }
        }

        project.dependencies.apply {
            extensionProjects.forEach { extensionProject ->
                add(
                    extensionsDependencyScopeConfiguration.name,
                    project(
                        mapOf(
                            "path" to extensionProject.path,
                            "configuration" to "extensionConfiguration",
                        ),
                    ),
                )
            }
        }

        extensions.configure<SourceSetContainer>("sourceSets") { sources ->
            sources.named("main") { main ->
                main.resources.srcDir(extensionsConfiguration)
            }
        }
    }

    /**
     * Configure the JAR task to bundle implementation dependencies into the patches file
     * and set the manifest with the "about" information from the extension.
     *
     * Dependencies from the "patcherProvided" configuration (Morphe Patcher and SMALI)
     * are excluded because they are provided at runtime by the application that loads the patches.
     */
    private fun Project.configureJarTask(patchesExtension: PatchesExtension) {
        tasks.withType(Jar::class.java).configureEach {
            it.archiveExtension.set("mpp")
            it.duplicatesStrategy = DuplicatesStrategy.EXCLUDE

            // Bundle implementation dependencies into the jar, excluding patcher-provided ones.
            // Compares by module identity (group:name) rather than file identity so that
            // version differences (e.g. Kotlin stdlib version from the Kotlin plugin vs.
            // the version transitively provided by morphe-patcher) don't cause provided
            // dependencies to leak into the jar.
            it.from(provider {
                val runtimeConfig = configurations.getByName("runtimeClasspath")
                val providedConfig = configurations.getByName("patcherProvidedClasspath")

                val providedModules = providedConfig.resolvedConfiguration.resolvedArtifacts
                    .mapTo(mutableSetOf()) { artifact ->
                        "${artifact.moduleVersion.id.group}:${artifact.moduleVersion.id.name}"
                    }

                runtimeConfig.resolvedConfiguration.resolvedArtifacts
                    .filterNot { artifact ->
                        "${artifact.moduleVersion.id.group}:${artifact.moduleVersion.id.name}" in providedModules
                    }
                    .map { artifact ->
                        if (artifact.file.isDirectory) artifact.file else zipTree(artifact.file)
                    }
            })

            // Exclude files from dependencies that must not be merged into the jar.
            it.exclude(
                "META-INF/versions/*/module-info.class",
                "META-INF/*.SF",
                "META-INF/*.DSA",
                "META-INF/*.RSA",
                "META-INF/MANIFEST.MF",
                "META-INF/LICENSE*",
                "META-INF/NOTICE*",
                "**/module-info.class",
            )

            it.manifest.apply {
                attributes["Name"] = patchesExtension.about.name
                attributes["Description"] = patchesExtension.about.description
                attributes["Version"] = project.version.toString()
                attributes["Timestamp"] = System.currentTimeMillis().toString()
                attributes["Source"] = patchesExtension.about.source
                attributes["Author"] = patchesExtension.about.author
                attributes["Contact"] = patchesExtension.about.contact
                attributes["Website"] = patchesExtension.about.website
                attributes["License"] = patchesExtension.about.license

                configurations
                    .getByName("implementation")
                    .allDependencies
                    .firstOrNull { it.group == "app.morphe" && it.name == "morphe-patcher" }
                    ?.version?.let { version ->
                        attributes["Patcher-Version"] = version
                    }
            }
        }
    }

    /**
     * Tries to find the android.jar in the Android SDK.
     */
    private fun Project.getAndroidJar(): File? {
        val sdkDir = getAndroidSdkDir() ?: return null
        val platformsDir = File(sdkDir, "platforms")
        if (!platformsDir.exists()) return null

        // Find the latest platform version.
        return platformsDir.listFiles()
            ?.filter { it.isDirectory && File(it, "android.jar").exists() }
            ?.maxByOrNull { it.name }
            ?.let { File(it, "android.jar") }
    }

    /**
     * Tries to find the Android SDK directory.
     */
    private fun Project.getAndroidSdkDir(): File? {
        // 1. Try sdk.dir in local.properties
        val localPropertiesFile = rootProject.file("local.properties")
        if (localPropertiesFile.exists()) {
            val properties = Properties()
            localPropertiesFile.inputStream().use { properties.load(it) }
            properties.getProperty("sdk.dir")?.let { return File(it) }
        }

        // 2. Try environment variables
        System.getenv("ANDROID_HOME")?.let { return File(it) }
        System.getenv("ANDROID_SDK_ROOT")?.let { return File(it) }

        // 3. Try default locations
        val homeDir = System.getProperty("user.home")
        val defaultLocations = listOf(
            File(homeDir, "Library/Android/sdk"), // macOS
            File(homeDir, "Android/Sdk"), // Linux
        )
        return defaultLocations.firstOrNull { it.exists() }
    }
}

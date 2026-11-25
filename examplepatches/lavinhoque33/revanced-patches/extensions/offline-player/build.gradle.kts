// Copyright (C) 2026 lavinhoque33
// Licensed under the GNU General Public License v3.0.
// Written by lavinhoque33, 2026-11-24.

import org.objectweb.asm.ClassReader
import org.objectweb.asm.ClassVisitor
import org.objectweb.asm.ClassWriter
import org.objectweb.asm.MethodVisitor
import org.objectweb.asm.Opcodes
import org.objectweb.asm.commons.ClassRemapper
import org.objectweb.asm.commons.Remapper
import java.util.jar.JarEntry
import java.util.jar.JarInputStream
import java.util.jar.JarOutputStream
import java.util.zip.ZipFile

buildscript {
    repositories { mavenCentral() }
    dependencies { classpath("org.ow2.asm:asm-commons:9.9") }
}

extension {
    name = "extensions/offline-player.mpe"
}

tasks.named<Sync>("syncExtension") {
    eachFile {
        val suffix = file.name.removePrefix("classes").removeSuffix(".dex")
        path = "offline-player$suffix.mpe"
    }
}

android {
    namespace = "app.morphe.extension.youtube.offline.pcm"
    compileSdk = 36
    defaultConfig { minSdk = 26 }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions { unitTests.isReturnDefaultValues = true }
}

// YouTube and Music have their own (obfuscated) Media3 and Guava builds. Resolve only this
// player's Java runtime, and relocate it instead of replacing or linking to the host's packages.
val pcmRuntime by configurations.creating {
    isCanBeConsumed = false
    isTransitive = false
}

val relocatePcmRuntime by tasks.registering(RelocatePcmRuntime::class) {
    archives.from(pcmRuntime)
    output.set(layout.buildDirectory.file("offline-pcm/runtime.jar"))
}

dependencies {
    val mediaVersion = "1.11.1"
    for (module in listOf("common", "container", "database", "datasource", "decoder", "extractor", "exoplayer")) {
        pcmRuntime("androidx.media3:media3-$module:$mediaVersion@aar")
    }
    pcmRuntime("androidx.exifinterface:exifinterface:1.4.2@aar")
    pcmRuntime("com.google.guava:guava:33.3.1-android@jar")
    pcmRuntime("com.google.guava:failureaccess:1.0.2@jar")

    // These artifacts use Android's library APIs on API 26+; don't emit a second copy of j$.
    compileOnly(libs.annotation)
    compileOnly(project(path = ":extensions:shared", configuration = "offlinePlaybackAbi"))
    // Guava's compile-time annotations aren't part of the relocated runtime. Let R8 resolve them.
    compileOnly("com.google.code.findbugs:jsr305:3.0.2")
    compileOnly("org.checkerframework:checker-qual:3.43.0")
    compileOnly("com.google.errorprone:error_prone_annotations:2.28.0")
    compileOnly("com.google.j2objc:j2objc-annotations:3.0.0")
    implementation(files(relocatePcmRuntime.flatMap { it.output }))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
}

abstract class RelocatePcmRuntime : DefaultTask() {
    @get:InputFiles
    @get:PathSensitive(PathSensitivity.NAME_ONLY)
    abstract val archives: ConfigurableFileCollection

    @get:OutputFile
    abstract val output: RegularFileProperty

    @TaskAction
    fun relocate() {
        val namespace = "rvx/offline/pcm/"
        val packages = listOf(
            "androidx/media3/",
            "androidx/exifinterface/",
            "com/google/common/",
            "com/google/thirdparty/",
        )
        val className = Regex("[A-Za-z0-9_$.]+")
        val remapper = object : Remapper(Opcodes.ASM9) {
            override fun map(internalName: String): String =
                if (packages.any(internalName::startsWith)) "$namespace$internalName" else internalName

            override fun mapValue(value: Any?): Any? {
                // Media3 discovers some optional implementations by their fully qualified names.
                if (value is String && value.matches(className)) {
                    val name = value.replace('.', '/')
                    val mapped = map(name)
                    if (mapped != name) return mapped.replace('/', '.')
                }
                return super.mapValue(value)
            }
        }

        var speedLimitChanges = 0
        val file = output.get().asFile
        file.parentFile.mkdirs()
        JarOutputStream(file.outputStream().buffered()).use { jar ->
            for (archive in archives.files.sortedBy { it.name }) {
                ZipFile(archive).use { zip ->
                    if (archive.extension == "aar") {
                        JarInputStream(zip.getInputStream(zip.getEntry("classes.jar"))).use { input ->
                            for (entry in generateSequence { input.nextJarEntry }) {
                                speedLimitChanges += copyClass(entry.name, input::readBytes, jar, remapper)
                            }
                        }
                    } else {
                        for (entry in zip.entries().asSequence()) {
                            speedLimitChanges += copyClass(
                                entry.name,
                                { zip.getInputStream(entry).use { it.readBytes() } },
                                jar,
                                remapper,
                            )
                        }
                    }
                }
            }
        }
        check(speedLimitChanges == 1) { "Expected exactly one Media3 PCM playback speed constraint" }
    }

    private fun copyClass(
        name: String,
        bytes: () -> ByteArray,
        jar: JarOutputStream,
        remapper: Remapper,
    ): Int {
        // Its resources are unrelated to playback: RVX has its own downloader and notifications.
        if (!name.endsWith(".class") || name.startsWith("META-INF/") || name == "module-info.class" ||
            name == "androidx/media3/exoplayer/offline/DownloadNotificationHelper.class"
        ) return 0

        val source = ClassReader(bytes())
        val writer = ClassWriter(0)
        val relocated = ClassRemapper(writer, remapper)
        var changes = 0
        val visitor = if (source.className == "androidx/media3/exoplayer/audio/DefaultAudioSink") {
            object : ClassVisitor(Opcodes.ASM9, relocated) {
                override fun visitMethod(
                    access: Int,
                    name: String,
                    descriptor: String,
                    signature: String?,
                    exceptions: Array<String>?,
                ): MethodVisitor {
                    val method = super.visitMethod(access, name, descriptor, signature, exceptions)
                    if (name != "setPlaybackParameters" || descriptor != "(Landroidx/media3/common/PlaybackParameters;)V") {
                        return method
                    }
                    return object : MethodVisitor(Opcodes.ASM9, method) {
                        override fun visitLdcInsn(value: Any) {
                            // First 0.1f bounds speed, second bounds pitch. Let the same software
                            // Sonic processor receive the exact positive rate; keep the pitch limit.
                            if (value == 0.1f && changes == 0) {
                                changes++
                                super.visitLdcInsn(0f)
                            } else {
                                super.visitLdcInsn(value)
                            }
                        }
                    }
                }
            }
        } else relocated

        source.accept(visitor, 0)
        val relocatedName = remapper.map(source.className)
        jar.putNextEntry(JarEntry("$relocatedName.class").apply { time = 0 })
        jar.write(writer.toByteArray())
        jar.closeEntry()
        return changes
    }
}

import com.android.tools.r8.CompilationMode
import com.android.tools.r8.D8
import com.android.tools.r8.D8Command
import com.android.tools.r8.OutputMode
import com.android.tools.r8.utils.ArchiveResourceProvider
import org.bouncycastle.crypto.params.Ed25519PrivateKeyParameters
import org.bouncycastle.crypto.signers.Ed25519Signer
import org.gradle.api.GradleException
import org.gradle.api.publish.PublishingExtension
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import java.io.File
import java.io.RandomAccessFile
import java.nio.file.Files
import java.nio.file.StandardCopyOption
import java.security.MessageDigest
import java.security.SecureRandom
import java.util.Base64
import java.util.Properties
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools:r8:8.7.18")
        classpath("org.bouncycastle:bcprov-jdk18on:1.79")
    }
}

plugins {
    id("java-library")
    id("org.jetbrains.kotlin.jvm")
    id("maven-publish")
}

group = "app.sadmod"

val hasGitHubCredentials =
    !System.getenv("GITHUB_TOKEN").isNullOrBlank() ||
        project.findProperty("gpr.key")?.toString()?.isNotBlank() == true

val patcherProvided: Configuration by configurations.creating
val patchListGeneratorClasspath: Configuration by configurations.creating {
    extendsFrom(patcherProvided)
}

configurations {
    compileOnly.get().extendsFrom(patcherProvided)
    testImplementation.get().extendsFrom(patcherProvided)
}

dependencies {
    if (hasGitHubCredentials) {
        patcherProvided("app.morphe:morphe-patcher:2.4.0") {
            exclude(group = "org.jetbrains.kotlin")
        }
        patcherProvided("com.github.MorpheApp.smali:smali:5eaff5a2c9")
    } else {
        patcherProvided(files(rootProject.file(".local-sdk/morphe-patcher-provided.jar")))
    }

    compileOnly("com.google.code.gson:gson:2.11.0")
    patchListGeneratorClasspath("com.google.code.gson:gson:2.11.0")
    patchListGeneratorClasspath(kotlin("reflect"))
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_11)
        freeCompilerArgs.add("-Xskip-metadata-version-check")
    }
}

fun findAndroidJar(): File? {
    val sdkDir = run {
        val localProps = rootProject.file("local.properties")
        if (localProps.exists()) {
            Properties().apply { localProps.inputStream().use { load(it) } }.getProperty("sdk.dir")?.let { File(it) }
        } else {
            null
        }
    } ?: System.getenv("ANDROID_HOME")?.let(::File)
        ?: System.getenv("ANDROID_SDK_ROOT")?.let(::File)

    val platformsDir = sdkDir?.let { File(it, "platforms") }?.takeIf { it.exists() } ?: return null
    return platformsDir.listFiles()
        ?.filter { it.isDirectory && File(it, "android.jar").exists() }
        ?.maxByOrNull { it.name }
        ?.let { File(it, "android.jar") }
}

fun signBundleIfKeyPresent(bundle: File, rootDir: File): Boolean {
    val envKey = System.getenv("MORPHE_SIGNING_KEY")?.trim()?.takeIf { it.isNotEmpty() }
    val keyFile = rootDir.resolve("morphe-signing.key")
    val keyB64 = envKey ?: if (keyFile.exists()) keyFile.readText().trim() else return false

    val decoder = Base64.getDecoder()
    val encoder = Base64.getEncoder()
    val privateKey = Ed25519PrivateKeyParameters(decoder.decode(keyB64), 0)
    val publicKey = encoder.encodeToString(privateKey.generatePublicKey().encoded)

    rootDir.resolve("morphe-signing.pub").takeIf(File::exists)?.readText()?.trim()?.let { published ->
        if (published != publicKey) {
            throw GradleException("The signing key does not match morphe-signing.pub")
        }
    }

    val magic = "MorpheSig1"
    val eocdSignature = 0x06054b50
    val eocdSize = 22
    RandomAccessFile(bundle, "rw").use { archive ->
        val eocd = ByteArray(eocdSize)
        archive.seek(archive.length() - eocdSize)
        archive.readFully(eocd)
        fun readLe(at: Int, bytes: Int) = (0 until bytes).fold(0) { acc, i ->
            acc or ((eocd[at + i].toInt() and 0xFF) shl (8 * i))
        }
        if (readLe(0, 4) != eocdSignature || readLe(eocdSize - 2, 2) != 0) {
            throw GradleException("$bundle is already signed or not a valid ZIP archive")
        }

        val digest = MessageDigest.getInstance("SHA-256")
        archive.seek(0)
        val buf = ByteArray(64 * 1024)
        while (true) {
            val read = archive.read(buf)
            if (read < 0) break
            digest.update(buf, 0, read)
        }

        val message = magic.toByteArray(Charsets.US_ASCII) + digest.digest()
        val sig = Ed25519Signer().run {
            init(true, privateKey)
            update(message, 0, message.size)
            generateSignature()
        }
        val comment = "$magic $publicKey ${encoder.encodeToString(sig)}".toByteArray(Charsets.US_ASCII)
        archive.seek(archive.length() - 2)
        archive.write(comment.size and 0xFF)
        archive.write((comment.size ushr 8) and 0xFF)
        archive.write(comment)
    }
    return true
}

tasks.named<ProcessResources>("processResources") {
    dependsOn(":extensions:sadmod:prepareMorpheArtifacts")
    from(project(":extensions:sadmod").layout.buildDirectory.dir("morphe-out"))
}

tasks.named<Jar>("jar") {
    archiveBaseName.set("patches")
    archiveExtension.set("mpp")
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE

    exclude(
        "META-INF/*.SF",
        "META-INF/*.DSA",
        "META-INF/*.RSA",
        "**/module-info.class"
    )

    manifest {
        attributes(
            mapOf(
                "Name" to "SadMod Patches",
                "Description" to "Open-source Material 3 Expressive UI, privacy routing, and local APK security inspection patches",
                "Version" to project.version.toString(),
                "Timestamp" to System.currentTimeMillis().toString(),
                "Source" to "https://github.com/NotRin7/sadmod-patches",
                "Author" to "NotRin7",
                "Contact" to "na",
                "Website" to "https://github.com/NotRin7/sadmod-patches",
                "License" to "GNU General Public License v3.0",
                "Patcher-Version" to "2.4.0"
            )
        )
    }
}

val buildAndroid by tasks.registering {
    description = "Builds patches for Android by compiling patch classes to DEX inside the .mpp bundle."
    group = "build"
    dependsOn(tasks.named("jar"))

    doLast {
        val mppFile = tasks.named<Jar>("jar").get().archiveFile.get().asFile
        val workDir = layout.buildDirectory.dir("morphe-dex").get().asFile.apply { mkdirs() }
        val classesZip = File(workDir, "classes.zip").apply { delete() }

        val d8Builder = D8Command.builder()
            .addProgramResourceProvider(ArchiveResourceProvider.fromArchive(mppFile.toPath(), true))
            .setMode(CompilationMode.RELEASE)
            .setOutput(classesZip.toPath(), OutputMode.DexIndexed)
            .setMinApiLevel(26)

        findAndroidJar()?.let { d8Builder.addLibraryFiles(it.toPath()) }

        val seenArtifactNames = mutableSetOf<String>()
        val classpathFiles = (configurations.getByName("runtimeClasspath").files +
            configurations.getByName("compileClasspath").files)
            .filter { it.exists() && it != mppFile }
            .distinctBy { it.absolutePath }
            .filter { file ->
                val normalized = file.name.replace(Regex("-[0-9]+.*\\.jar$"), ".jar")
                seenArtifactNames.add(normalized)
            }
            .map { it.toPath() }
        if (classpathFiles.isNotEmpty()) {
            d8Builder.addClasspathFiles(classpathFiles)
        }

        D8.run(d8Builder.build())

        // Merge compiled classes*.dex into the root of patches-<version>.mpp
        val mergedTmp = File(workDir, "${mppFile.name}.tmp")
        ZipFile(mppFile).use { origZip ->
            ZipFile(classesZip).use { dexZip ->
                ZipOutputStream(mergedTmp.outputStream().buffered()).use { zos ->
                    val dexNames = dexZip.entries().asSequence()
                        .filter { !it.isDirectory && it.name.endsWith(".dex") }
                        .map { it.name }
                        .toSet()

                    val origEntries = origZip.entries()
                    while (origEntries.hasMoreElements()) {
                        val e = origEntries.nextElement()
                        if (e.name in dexNames || e.isDirectory) continue
                        val outEntry = ZipEntry(e.name).apply { time = 0L }
                        zos.putNextEntry(outEntry)
                        origZip.getInputStream(e).use { it.copyTo(zos) }
                        zos.closeEntry()
                    }

                    val dexEntries = dexZip.entries()
                    while (dexEntries.hasMoreElements()) {
                        val e = dexEntries.nextElement()
                        if (e.isDirectory || !e.name.endsWith(".dex")) continue
                        val outEntry = ZipEntry(e.name).apply { time = 0L }
                        zos.putNextEntry(outEntry)
                        dexZip.getInputStream(e).use { it.copyTo(zos) }
                        zos.closeEntry()
                    }
                }
            }
        }
        Files.move(mergedTmp.toPath(), mppFile.toPath(), StandardCopyOption.REPLACE_EXISTING)

        if (!signBundleIfKeyPresent(mppFile, rootDir) && rootDir.resolve("morphe-signing.pub").exists()) {
            logger.warn("No MORPHE_SIGNING_KEY is set; ${mppFile.name} was left unsigned.")
        }
    }
}

tasks.register("generateSigningKey") {
    description = "Creates the Ed25519 key pair (morphe-signing.pub / morphe-signing.key) to sign releases."
    group = "build"

    doLast {
        val privFile = rootDir.resolve("morphe-signing.key")
        val pubFile = rootDir.resolve("morphe-signing.pub")
        if (privFile.exists() || pubFile.exists()) {
            throw GradleException("morphe-signing.key or morphe-signing.pub already exists.")
        }
        val encoder = Base64.getEncoder()
        val priv = Ed25519PrivateKeyParameters(SecureRandom())
        privFile.writeText(encoder.encodeToString(priv.encoded) + "\n")
        pubFile.writeText(encoder.encodeToString(priv.generatePublicKey().encoded) + "\n")
        logger.lifecycle("Created morphe-signing.pub (commit) and morphe-signing.key (keep secret / GitHub Actions MORPHE_SIGNING_KEY).")
    }
}

val generatePatchesList by tasks.registering(JavaExec::class) {
    description = "Generates patches-list.json from the compiled .mpp bundle."
    group = "build"
    dependsOn(buildAndroid)

    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
}

extensions.configure<PublishingExtension> {
    repositories {
        mavenLocal {
            name = "DummyMavenLocal"
        }
    }
}

tasks.named("assemble") {
    dependsOn(buildAndroid)
}

tasks.named("publish") {
    dependsOn(buildAndroid, generatePatchesList)
}

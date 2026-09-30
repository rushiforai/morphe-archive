package app.ahmedyarub.patches.harness

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchResult
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.concurrent.TimeUnit
import java.util.logging.Level
import java.util.logging.Logger
import java.util.zip.ZipFile

/**
 * Runs the real patcher against a real app, the way Morphe Manager and the CLI do.
 *
 * Fingerprints and hooks are written against obfuscated builds, so the only check that means
 * anything is applying them to the build they target. The APKs are not in the repository; a
 * run points at them with the properties described in [TargetApk.configured].
 *
 * Every run gets a JVM of its own. Fingerprints cache their match in a static, and patches keep
 * what they resolved in top-level variables, so a second run in the same JVM starts from the
 * first run's leftovers. Manager patches in a fresh process for the same reason.
 */
internal object ApkPatching {
    class Outcome(
        val packageName: String,
        val versionName: String,
        /** Patch name (or description, for an unnamed patch) to its failure, null when it applied. */
        val results: Map<String, String?>,
        /** The patched, unsigned APK, or null when a patch failed and nothing was written. */
        val patchedApk: File?,
        /** References in the patched code to members that do not exist. See [ExtensionReferences]. */
        val unresolved: List<String>,
    ) {
        val failures get() = results.filterValues { it != null }
    }

    val buildDirectory = File(System.getProperty("morphe.buildDir", "build"))

    /** The package name and version of [apk], read without patching anything. */
    fun metadata(apk: File): Pair<String, String> {
        quietLogging()
        return Patcher(PatcherConfig(apk, temporaryFilesPath = workDirectory("metadata"))).use { patcher ->
            patcher.context.packageMetadata.let { it.packageName to it.versionName }
        }
    }

    /**
     * Applies the named patches (and their dependencies) to [apk] in a new JVM.
     *
     * @param label Names the working and output files, so runs do not overwrite each other.
     */
    fun patch(
        apk: File,
        patchNames: Collection<String>,
        label: String,
    ): Outcome {
        val resultFile = workDirectory(label).resolveSibling("$label.result").apply { parentFile.mkdirs() }
        runInFreshJvm(PatchRunner::class.java.name, listOf(apk.path, label, resultFile.path) + patchNames)

        var packageName = ""
        var versionName = ""
        var patchedApk: File? = null
        val results = linkedMapOf<String, String?>()
        val unresolved = mutableListOf<String>()
        resultFile.readLines().forEach { line ->
            val fields = line.split('\t')
            when (fields[0]) {
                "META" -> {
                    packageName = fields[1]
                    versionName = fields[2]
                }
                "APK" -> patchedApk = File(fields[1])
                "OK" -> results[fields[1]] = null
                "FAIL" -> results[fields[1]] = fields[2].unescape()
                "UNRESOLVED" -> unresolved += fields[1]
            }
        }
        return Outcome(packageName, versionName, results, patchedApk, unresolved)
    }

    /** Applies [patches] in this JVM and records the outcome in [resultFile]. Used by [PatchRunner]. */
    fun patchHere(
        apk: File,
        patches: Set<Patch<*>>,
        label: String,
        resultFile: File,
    ) {
        quietLogging()
        val results = mutableListOf<PatchResult>()
        val lines = mutableListOf<String>()

        Patcher(PatcherConfig(apk, temporaryFilesPath = workDirectory(label))).use { patcher ->
            val metadata = patcher.context.packageMetadata
            lines += "META\t${metadata.packageName}\t${metadata.versionName}"

            patcher += patches
            runBlocking { patcher().collect { results += it } }

            results.forEach { result ->
                val name = result.patch.name ?: result.patch.description ?: result.patch.toString()
                lines += result.exception?.let { "FAIL\t$name\t${it.stackTraceToString().escape()}" } ?: "OK\t$name"
            }

            if (results.none { it.exception != null }) {
                val output = buildDirectory.resolve("patched/$label.apk").apply { parentFile.mkdirs() }
                apk.copyTo(output, overwrite = true)
                patcher.get().applyTo(output)
                lines += "APK\t${output.absolutePath}"
                ExtensionReferences.unresolved(output).forEach { lines += "UNRESOLVED\t$it" }
            }
        }

        resultFile.writeText(lines.joinToString("\n"))
    }

    /** Signs [apk] with a throwaway key, for an emulator or a device without the app installed. */
    fun sign(apk: File): File {
        val signed = apk.resolveSibling(apk.nameWithoutExtension + "-signed.apk")
        ApkUtils.signApk(
            apk,
            signed,
            "Morphe",
            ApkUtils.KeyStoreDetails(
                keyStore = buildDirectory.resolve("patched/test.keystore"),
                keyStorePassword = null,
                alias = "Morphe",
                password = "",
            ),
        )
        return signed
    }

    fun runInFreshJvm(
        mainClass: String,
        arguments: List<String>,
    ) {
        val java = File(System.getProperty("java.home"), "bin/java").path
        val command =
            listOf(
                java,
                "-Xmx${System.getProperty("morphe.childHeap", "8g")}",
                "-Dmorphe.buildDir=${buildDirectory.absolutePath}",
                "-Dmorphe.bundle=${System.getProperty("morphe.bundle")}",
                "-cp",
                System.getProperty("java.class.path"),
                mainClass,
            ) + arguments

        val process = ProcessBuilder(command).redirectErrorStream(true).start()
        val output = process.inputStream.bufferedReader().readText()
        check(process.waitFor(30, TimeUnit.MINUTES)) { "$mainClass timed out" }
        check(process.exitValue() == 0) { "$mainClass exited with ${process.exitValue()}:\n$output" }
    }

    fun workDirectory(label: String) = buildDirectory.resolve("tmp/apk-patching/$label")

    /**
     * Resolves a configured path to a base APK. An .apkm bundle (a zip of split APKs, as
     * APKMirror ships them) has its base APK extracted once and reused.
     */
    fun baseApk(path: File): File {
        if (path.extension != "apkm") return path

        val extracted = buildDirectory.resolve("tmp/apk-bundles/${path.nameWithoutExtension}/base.apk")
        if (extracted.exists() && extracted.lastModified() >= path.lastModified()) return extracted

        extracted.parentFile.mkdirs()
        ZipFile(path).use { bundle ->
            val entry = bundle.getEntry("base.apk") ?: error("$path has no base.apk")
            bundle.getInputStream(entry).use { input ->
                extracted.outputStream().use { input.copyTo(it) }
            }
        }
        return extracted
    }

    /** The patcher logs every class it touches at INFO; keep the output readable. */
    private fun quietLogging() {
        Logger.getLogger("").level = Level.WARNING
        Logger.getLogger("").handlers.forEach { it.level = Level.WARNING }
    }

    private fun String.escape() = replace("\\", "\\\\").replace("\n", "\\n").replace("\t", "\\t")

    private fun String.unescape() =
        buildString {
            var index = 0
            while (index < this@unescape.length) {
                val char = this@unescape[index]
                if (char == '\\' && index + 1 < this@unescape.length) {
                    append(
                        when (val next = this@unescape[index + 1]) {
                            'n' -> '\n'
                            't' -> '\t'
                            else -> next
                        },
                    )
                    index += 2
                } else {
                    append(char)
                    index++
                }
            }
        }
}

/** An app build the patches are checked against. */
internal data class TargetApk(
    val app: String,
    val file: File,
) {
    companion object {
        /**
         * The APKs passed in with `-Pmorphe.apks=<app>=<path>,...`, where the path is a base APK or an
         * APKMirror .apkm bundle, e.g. `instagram=E:/morphe/ig448/base.apk,reddit=E:/morphe/reddit.apkm`.
         */
        fun configured(): List<TargetApk> =
            System.getProperty("morphe.apks").orEmpty()
                .split(',')
                .map(String::trim)
                .filter(String::isNotEmpty)
                .map { entry ->
                    val app = entry.substringBefore('=')
                    val file = File(entry.substringAfter('='))
                    require(file.isFile) { "The APK configured for $app does not exist: $file" }
                    TargetApk(app, file)
                }
    }
}

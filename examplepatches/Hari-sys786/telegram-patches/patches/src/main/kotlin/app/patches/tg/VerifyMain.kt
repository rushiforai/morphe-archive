package app.patches.tg

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Development harness: applies the built `.mpp` to a real APK and reports, per patch, whether its
 * fingerprints resolved. Not part of the shipped bundle.
 *
 * Usage: verifyPatches <apkFile> <outputDir> <patchBundle.mpp> [includeDisabled]
 */
fun main(args: Array<String>) {
    require(args.size >= 3) { "Usage: <apkFile> <outputDir> <patchBundle.mpp> [includeDisabled]" }
    val apkFile = File(args[0])
    val outputDir = File(args[1]).apply { mkdirs() }
    val bundle = File(args[2])
    val includeDisabled = args.getOrNull(3)?.toBoolean() ?: true

    val loaded = loadPatchesFromJar(setOf(bundle))
    println("Loaded ${loaded.size} patch(es) from ${bundle.name}:")
    loaded.sortedBy { it.name }.forEach { println("  - ${it.name}  (default=${it.default})") }

    val selected: Set<Patch<*>> =
        if (includeDisabled) loaded.toSet() else loaded.filter { it.default }.toSet()
    println("\nSelected ${selected.size} patch(es) for this run (includeDisabled=$includeDisabled).\n")

    val config = PatcherConfig(apkFile, outputDir.resolve("morphe-temporary-files"))
    Patcher(config).use { patcher ->
        patcher += selected

        val results = LinkedHashMap<String, String>()
        runBlocking {
            patcher().collect { result ->
                val name = result.patch.name ?: "(unnamed)"
                results[name] = if (result.exception == null) {
                    "OK"
                } else {
                    "FAIL: " + result.exception!!.stackTraceToString().lineSequence().first()
                }
            }
        }

        val patched = patcher.get()
        val dexDir = outputDir.resolve("patched_dex").apply { mkdirs() }
        patched.dexFiles.forEach { dex ->
            dexDir.resolve(dex.name).outputStream().use { out -> dex.stream.copyTo(out) }
        }

        val report = buildString {
            appendLine("=== PER-PATCH RESULTS ===")
            results.toSortedMap().forEach { (name, status) ->
                appendLine(if (status == "OK") "OK    $name" else "FAIL  $name :: $status")
            }
            val failed = results.values.count { it != "OK" }
            appendLine()
            appendLine("total=${results.size} ok=${results.size - failed} failed=$failed")
            appendLine("patchedDexFiles=${patched.dexFiles.map { it.name }}")
        }
        println(report)
        outputDir.resolve("verify-report.txt").writeText(report)
    }
}

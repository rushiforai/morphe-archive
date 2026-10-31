package app.zeekradapt.patches.dhu

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkMerger
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.File
import java.nio.file.Files

/**
 * Applies a DHU adapter patch to an APK without Morphe Manager, for local testing.
 * Split bundles (.apkm, .xapk, .apks) are merged first. The output is unsigned.
 *
 * ./gradlew :patches:patchApk -Papk=<input> -Pout=<output.apk> -Ppkg=<package|any> [-Popts=key=value,...]
 */
fun main(arguments: Array<String>) {
    require(arguments.size >= 3) { "Usage: DhuPatchApkKt <input> <output.apk> <package|any> [key=value...]" }

    val input = File(arguments[0]).canonicalFile
    val output = File(arguments[1]).canonicalFile
    val packageName = arguments[2]
    require(input.isFile) { "Input does not exist: $input" }
    output.parentFile?.mkdirs()

    val workspace = Files.createTempDirectory("dhu-patch").toFile()

    val apk = if (input.extension.lowercase() in setOf("apkm", "xapk", "apks")) {
        workspace.resolve("merged.apk").also { ApkMerger().merge(input, it) }
    } else {
        input
    }

    val patches = listOf(
        dhuAdapterWazePatch,
        dhuAdapterAppleMusicPatch,
        dhuAdapterSpotifyPatch,
        dhuAdapterYouTubeMusicPatch,
        dhuAdapterTelegramPatch,
    )
    val patch: Patch<*> = patches.firstOrNull { p -> p.compatibility?.any { it.packageName == packageName } == true }
        ?: dhuAdapterUniversalPatch

    arguments.drop(3).forEach { argument ->
        val (key, raw) = argument.split("=", limit = 2)
        val value: Any? = when (patch.options[key].default) {
            is Boolean -> raw.toBooleanStrict()
            is Int -> raw.toInt()
            is Float -> raw.toFloat()
            else -> raw
        }
        patch.options[key] = value
    }

    println("Patch: ${patch.name} ${patch.compatibility?.map { it.packageName } ?: "(any app)"}")
    Patcher(PatcherConfig(apk, workspace.resolve("patcher"))).use { patcher ->
        patcher += setOf(patch)
        runBlocking {
            patcher().collect { result ->
                result.exception?.let { throw it }
                println("Applied: ${result.patch.name}")
            }
        }
        patcher.get().applyTo(apk.copyTo(output, overwrite = true))
    }
    println("Unsigned output: $output")
}

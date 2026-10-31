package app.morphe.util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.File

/** Optional offline check. Input APKs and output directories must remain private. */
fun main(args: Array<String>) = runBlocking {
    require(args.size == 4) { "Expected bundle, source APK, output directory, exact patch name" }
    val selected = loadPatchesFromJar(setOf(File(args[0]))).filter { it.name == args[3] }.toSet()
    check(selected.size == 1) { "Expected exactly one selected fix" }
    val directory = File(args[2])
    check(!directory.exists()) { "Refusing to overwrite validation evidence" }
    directory.mkdirs()
    Patcher(PatcherConfig(File(args[1]), directory)).use { patcher ->
        patcher += selected
        patcher().collect { result ->
            check(result.exception == null) { "Patch failed: ${result.exception}" }
        }
        val result = patcher.get()
        for (dex in result.dexFiles) {
            File(directory, dex.name).outputStream().use { output ->
                dex.stream.use { it.copyTo(output) }
            }
        }
        println("PASS: selected release patch applied; DEX outputs=${result.dexFiles.size}")
    }
}

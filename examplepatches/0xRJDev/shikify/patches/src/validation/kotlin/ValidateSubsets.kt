import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File

private suspend fun apply(apk: File, work: File, selected: Set<Patch<*>>): Int {
    work.deleteRecursively();work.mkdirs()
    var failures = 0
    val output = work.resolve("subset.apk")
    Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = work.resolve("tmp"), useBytecodeMode = BytecodeMode.FULL, validate = true)).use { patcher ->
        patcher += selected
        patcher().collect { result ->
            val error = result.exception ?: return@collect
            failures++
            println("FAILED: ${result.patch.name ?: "(internal)"}: ${error.message?.lines()?.take(3)?.joinToString(" | ")}")
        }
        apk.copyTo(output, overwrite = true)
        patcher.get().applyTo(output)
    }
    return failures
}

/** Every patch must apply alone, and the rest must apply without it, so any selection in Manager works. */
fun main(args: Array<String>) = runBlocking {
    val (bundle, apk, directory) = args.map(::File)
    val names = loadPatchesFromJar(setOf(bundle)).filter { it.name != null }.map { it.name!! }.sorted()
    var failures = 0
    for (name in names) {
        for ((label, keep) in listOf<Pair<String, (String) -> Boolean>>("alone" to { it == name }, "without" to { it != name })) {
            val selected = loadPatchesFromJar(setOf(bundle)).filter { it.name != null && keep(it.name!!) }.toSet()
            val found = apply(apk, directory, selected)
            failures += found
            println("${if (found == 0) "OK" else "FAIL"}: $label $name")
        }
    }
    check(failures == 0) { "Subset validation found $failures problems" }
    println("SUBSETS PASS: ${names.size} patches, each alone and each left out")
}

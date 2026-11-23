package util

import app.morphe.patcher.patch.PatchLoader
import java.io.File
import kotlin.system.exitProcess

/**
 * Regression check for the shipped bundle: loads the exact .mpp through the same jar/dex patch loader Morphe
 * Manager uses and asserts the expected patch names are present.
 *
 * The validation harness (ValidatePatches) applies patch instances straight from the build output, so it cannot
 * catch a bundle that Manager refuses to load. This can.
 *
 * Usage: verifyBundle <bundle.mpp> [expectedName ...]
 */
fun main(args: Array<String>) {
    val bundle = File(args.firstOrNull() ?: error("usage: verifyBundle <bundle.mpp> [expected names...]"))
    require(bundle.isFile) { "Bundle not found: $bundle" }
    val expected = args.drop(1).filter { it.isNotBlank() }.toSet()

    // Morphe Manager reads the bundle with Android's DexClassLoader, which needs a real classes.dex.
    // The JVM jar loader happily reads the .class entries beside it, so this must be asserted separately.
    java.util.zip.ZipFile(bundle).use { zip ->
        val dexes = zip.entries().toList().filter { it.name.lowercase().endsWith(".dex") }
        require(dexes.isNotEmpty()) { "FAIL bundle has no .dex entry" }
        require(dexes.all { it.size > 0 }) { "FAIL bundle has an empty .dex entry" }
        println("dex entries: " + dexes.joinToString { "${it.name} (${it.size} bytes)" })
    }

    val loader = PatchLoader.Jar(setOf(bundle))
    val all = loader.toList()
    val names = all.mapNotNull { it.name }.toSortedSet()
    println("bundle: ${bundle.name}")
    println("patches: ${loader.size}")
    names.forEach { println("  - $it") }
    all.forEachIndexed { i, patch -> if (patch.name.isNullOrBlank()) println("  ! null-name patch #$i: ${patch::class.java.name}") }

    val missing = expected - names
    if (missing.isNotEmpty()) {
        System.err.println("FAIL missing patches: $missing")
        exitProcess(1)
    }
    if (loader.isEmpty()) {
        System.err.println("FAIL bundle exposes no patches")
        exitProcess(1)
    }
    println("OK bundle loads")
}

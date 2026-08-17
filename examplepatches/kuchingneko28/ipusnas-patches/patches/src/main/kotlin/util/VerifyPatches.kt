package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.resource.ResourceMode
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Applies every patch in the built .mpp file to a real APK and reports
 * which patches succeed and which fingerprints fail to match.
 *
 * Usage: ./gradlew :patches:verifyPatches --args="<path-to-apk> [<output-dir>]"
 */
fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Usage: verifyPatches <apk> [outputDir]")
        kotlin.system.exitProcess(1)
    }
    val apk = File(args[0])
    require(apk.exists()) { "APK not found: $apk" }
    val outDir = File(args.getOrElse(1) { "build/verify-output" }).apply { mkdirs() }

    val mpp = File("build/libs/").listFiles { f ->
        f.name.endsWith(".mpp") && !f.name.contains("javadoc") && !f.name.contains("sources")
    }!!.first()

    println("[*] Loading patches from $mpp")
    val patches = loadPatchesFromJar(setOf(mpp))

    val verifier = object : app.morphe.patcher.dex.DexVerifier {
        override fun verifyDexFile(file: File) {}
        override fun verifyDexDirectory(file: File) {}
        override fun verifyApkFile(file: File) {}
    }
    val config = PatcherConfig(
        apk,
        outDir,
        "",
        "",
        true,
        setOf<app.morphe.patcher.resource.CpuArchitecture>(),
        BytecodeMode.FULL,
        verifier
    )

    Patcher(config).use { patcher ->
        patcher += patches
        runBlocking {
            patcher().collect { result ->
                val exception = result.exception
                if (exception != null) {
                    println("[FAIL] ${result.patch.name}: ${exception.message}")
                } else {
                    println("[ OK ] ${result.patch.name}")
                }
            }
        }
        val result = patcher.get()
        println("[*] Patched dex files: ${result.dexFiles.size}")
    }
}

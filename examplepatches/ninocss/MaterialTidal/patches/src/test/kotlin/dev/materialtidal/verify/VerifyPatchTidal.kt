package dev.materialtidal.verify

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) {
    require(args.size >= 3) {
        "Usage: VerifyPatchTidalKt <tidal.apkm> <patches.mpp> <verifyWorkDir>"
    }

    val apkmFile = File(args[0])
    val mppFile = File(args[1])
    val workDir = File(args[2]).apply { mkdirs() }

    require(apkmFile.isFile) { "Missing APKM file: $apkmFile" }
    require(mppFile.isFile) { "Missing MPP file: $mppFile" }

    val baseApk = workDir.resolve("base.apk")
    println("Extracting base.apk from ${apkmFile.name}...")
    ZipFile(apkmFile).use { zip ->
        val entry = zip.getEntry("base.apk")
            ?: error("base.apk not found inside ${apkmFile.name}")
        zip.getInputStream(entry).use { input ->
            baseApk.outputStream().use { output ->
                input.copyTo(output)
            }
        }
    }

    val patchLoader = loadPatchesFromJar(setOf(mppFile))
    val patches = patchLoader.toSet()
    println("Loaded ${patches.size} patch(es) from ${mppFile.name}: ${patches.map { it.name }}")
    require(patches.isNotEmpty()) { "No patches loaded from $mppFile" }

    val patcherWorkDir = workDir.resolve("patcher-work")
    val config = PatcherConfig(
        apkFile = baseApk,
        temporaryFilesPath = patcherWorkDir,
        validate = true,
    )

    val failures = mutableListOf<String>()
    var dexCount = 0

    Patcher(config).use { patcher ->
        patcher += patches
        runBlocking {
            patcher().collect { result ->
                val ex = result.exception
                if (ex != null) {
                    failures += "${result.patch}: ${ex.message}\n${ex.stackTraceToString()}"
                } else {
                    println("PASS: ${result.patch}")
                }
            }
        }

        if (failures.isNotEmpty()) {
            error("Patch verification failed:\n" + failures.joinToString("\n---\n"))
        }

        println("Compiling patched DEX files...")
        val patcherResult = patcher.get()
        val dexOutDir = workDir.resolve("patched-dex").apply {
            deleteRecursively()
            mkdirs()
        }
        patcherResult.dexFiles.forEach { dex ->
            dexCount++
            dexOutDir.resolve(dex.name).outputStream().use { out ->
                dex.stream.copyTo(out)
            }
        }
        println("Compiled $dexCount patched DEX file(s) to ${dexOutDir.absolutePath}")
    }

    println("ALL VERIFICATIONS PASSED.")
}

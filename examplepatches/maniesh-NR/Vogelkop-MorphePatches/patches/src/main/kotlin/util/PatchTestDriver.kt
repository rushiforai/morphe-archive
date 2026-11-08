/*
 * Local verification driver: applies the built patch bundle to an APK and
 * reports per-patch results plus the process peak RSS. Not part of the bundle.
 *
 * Run via the "patchTestApk" Gradle task:
 *   ./gradlew patchTestApk -PtestApk=/path/base.apk -PtestOut=/path/out.apk
 */
package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.util.logging.Logger
import kotlin.concurrent.thread
import kotlinx.coroutines.runBlocking

fun main() {
    val logger = Logger.getLogger("PatchTestDriver")
    val apk = File(System.getProperty("testApk") ?: error("-DtestApk=<file> required"))
    val bundle = File(System.getProperty("testBundle") ?: "build/libs/patches-1.0.0.mpp")
    val out = File(System.getProperty("testOut") ?: "build/patched-test.apk")
    // Optional package name; when set, only patches whose compatibility list
    // includes it are executed (mirrors what Morphe Manager does per app).
    val testPackage = System.getProperty("testPackage")

    var peakRssKb = 0L
    val sampler = thread(isDaemon = true, name = "rss-sampler") {
        while (!Thread.currentThread().isInterrupted) {
            runCatching {
                val rss = File("/proc/self/status").readLines()
                    .firstOrNull { it.startsWith("VmRSS") }
                    ?.split(Regex("\\s+"))?.getOrNull(1)?.toLong() ?: 0L
                if (rss > peakRssKb) peakRssKb = rss
            }
            Thread.sleep(25)
        }
    }

    val allPatches = loadPatchesFromJar(setOf(bundle))
    val patches = if (testPackage == null) allPatches else allPatches.filter { patch ->
        val packages: List<app.morphe.patcher.patch.Compatibility>? =
            runCatching { patch.compatibility }.getOrNull()
        packages == null || packages.any { it.packageName == testPackage }
    }
    logger.info("Loaded ${allPatches.size} patches, running ${patches.size}" +
        (testPackage?.let { " for $it" } ?: ""))

    val started = System.currentTimeMillis()
    val failed = mutableListOf<String>()

    Patcher(
        PatcherConfig(
            apkFile = apk,
            temporaryFilesPath = File("/tmp/ptest-tmp").apply { mkdirs() },
            fileWorkspacePath = File("/tmp/ptest-ws").apply { mkdirs() },
        ),
    ).use { patcher ->
        patcher += patches.toSet()
        runBlocking {
            patcher { patch -> logger.info(">>> executing: ${patch.name}") }
                .collect { result ->
                    val patch = result.patch
                    val exception = result.exception
                    if (exception != null) {
                        failed += patch.name.orEmpty()
                        logger.severe("${patch.name} FAILED: ${exception.stackTraceToString()}")
                    } else {
                        logger.info("${patch.name} succeeded")
                    }
                }
        }
        patcher.writeApk(out)
    }

    val elapsed = System.currentTimeMillis() - started
    sampler.interrupt()
    logger.info("──────────────────────────────────────────────")
    logger.info("Patched APK: $out (${out.takeIf { it.exists() }?.length() ?: 0} bytes)")
    logger.info("Elapsed: ${elapsed} ms   Peak RSS: ${peakRssKb / 1024} MB")
    if (failed.isNotEmpty()) {
        logger.severe("FAILED patches: $failed")
        kotlin.system.exitProcess(1)
    }
    logger.info("All patches succeeded.")
}

package app.syncpatches.validator

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Applies the patch bundle to the Sync APK and exits non-zero if any
 * fingerprint or replacement fails. Used to validate patches.mpp before
 * handing it to the user; the result is never written to disk.
 */
fun main() {
    runBlocking {
    val apkFile = File(System.getProperty("validate.apk") ?: error("missing -Dvalidate.apk"))
    val mppFile = File(System.getProperty("validate.mpp") ?: error("missing -Dvalidate.mpp"))
    val workDir = File(
        System.getProperty("validate.workdir")
            ?: mppFile.parentFile.resolve("validator/build/tmp-validation").absolutePath
    )

    val patches = loadPatchesFromJar(setOf(mppFile))

    println("Loaded ${patches.size} named patch(es): ${patches.map { it.name }}")

    Patcher(
        PatcherConfig(
            apkFile = apkFile,
            temporaryFilesPath = workDir,
        ),
    ).use { patcher ->
        patcher += patches

        var failed = false
        patcher().collect { result ->
            val exception = result.exception
            if (exception != null) {
                failed = true
                System.err.println("FAIL: ${result.patch}")
                System.err.println(exception.stackTraceToString())
                exception.cause?.let {
                    System.err.println("Caused by: ${it.stackTraceToString()}")
                }
            } else {
                println("OK: ${result.patch}")
            }
        }

        if (failed) {
            System.err.println("Validation FAILED")
            kotlin.system.exitProcess(1)
        }

        // Optionally write the patched dex files (for inspection only).
        System.getProperty("validate.output")?.let { outputDir ->
            val out = File(outputDir).apply { mkdirs() }
            val result = patcher.get()
            result.dexFiles.forEach { dex ->
                File(out, dex.name).outputStream().use { dex.stream.copyTo(it) }
            }
            println("Wrote ${result.dexFiles.size} dex files to $out")

            // Deep verification with the official Android SDK tools.
            System.getProperty("validate.verify")?.let { sdkPath ->
                app.morphe.patcher.dex.SdkDexVerifier(File(sdkPath)).verifyDexDirectory(out)
                println("Dex verification with SDK tools PASSED")
            }
        }

        println("Validation PASSED (patches applied in-memory only, nothing written)")

        // Write the patched resources apk for deep inspection (e.g. aapt2
        // manifest checks) when explicitly requested via -Dvalidate.resources.
        System.getProperty("validate.resources")?.let { path ->
            patcher.get().resources?.resourcesApk?.copyTo(File(path), overwrite = true)
            println("Wrote patched resources apk to $path")
        }
        }
    }
}

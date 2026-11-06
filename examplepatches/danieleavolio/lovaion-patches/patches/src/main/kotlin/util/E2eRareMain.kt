package util

import app.daniele.patches.rarecam.pairIpBypassPatch
import app.daniele.patches.rarecam.unlockProPatch
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Applies the Rare patches to an APK with the real patcher engine and writes the
 * patched APK. Used to verify the patch set before publishing it:
 *
 *   .\gradlew.bat :patches:e2eRare -Papk=<input.apk> -Pout=<patched.apk>
 */
@Suppress("unused")
fun main(args: Array<String>) {
    val apk = File(args[0])
    val out = File(args[1])

    val result = Patcher(
        PatcherConfig(
            apkFile = apk,
            // Keep the patcher's scratch files out of the repository.
            temporaryFilesPath = File(System.getProperty("java.io.tmpdir"), "morphe-e2e"),
        ),
    ).use { patcher ->
        patcher += setOf(pairIpBypassPatch, unlockProPatch)

        runBlocking {
            patcher().collect { patchResult ->
                println("${patchResult.patch.name}: ${patchResult.exception ?: "OK"}")
            }
        }

        patcher.get()
    }

    out.delete()
    apk.copyTo(out)
    result.applyTo(out)
    println("Patched APK written to $out")
}

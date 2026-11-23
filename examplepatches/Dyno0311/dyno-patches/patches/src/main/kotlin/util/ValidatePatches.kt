package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import dev.dyno0311.patches.apps.camscanner.ads.removeAdsPatch
import dev.dyno0311.patches.apps.camscanner.premium.unlockPremiumPatch
import dev.dyno0311.patches.apps.camscanner.piracy.hidePiracyWarningPatch
import dev.dyno0311.patches.apps.camscanner.watermark.removeWatermarkPatch
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.system.exitProcess

/**
 * Local verification harness: applies the CamScanner patches to a real APK with validation enabled.
 * Usage: validateCamScanner <input.apk> [output.apk]
 */
fun main(args: Array<String>) {
    val apk = File(args.getOrElse(0) { error("usage: validateCamScanner <input.apk> [output.apk]") })
    val out = File(args.getOrElse(1) { apk.resolveSibling("patched-${apk.name}").path })
    require(apk.isFile) { "APK not found: $apk" }

    val config = PatcherConfig(
        apkFile = apk,
        validate = true
    )

    // Optional selection so the harness can reproduce exactly what a user ticks, not "everything".
    val requested = System.getProperty("patches", "").split(",").map { it.trim() }.filter { it.isNotEmpty() }
    val all = mapOf(
        "premium" to unlockPremiumPatch,
        "ads" to removeAdsPatch,
        "watermark" to removeWatermarkPatch,
        "piracy" to hidePiracyWarningPatch
    )
    val selected = if (requested.isEmpty()) {
        // mirror Manager: only patches whose default flag is true
        all.filterValues { it.default }.values.toSet()
    } else {
        val unknown = requested - all.keys
        require(unknown.isEmpty()) { "Unknown patch keys: $unknown (known: ${all.keys})" }
        requested.map { all.getValue(it) }.toSet()
    }
    println("selected: " + selected.map { it.name })

    var failures = 0
    Patcher(config).use { patcher ->
        patcher += selected
        runBlocking {
            patcher().collect { result ->
                val error = result.exception
                if (error != null) {
                    failures++
                    println("FAIL  ${result.patch.name}: ${error.message}")
                } else {
                    println("OK    ${result.patch.name}")
                }
            }
        }
        if (failures == 0) {
            patcher.writeApk(out)
            println("wrote ${out.absolutePath} (${out.length()} bytes)")
        }
    }

    if (failures > 0) {
        System.err.println("$failures patch(es) failed")
        exitProcess(1)
    }
}

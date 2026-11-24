package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Remove telemetry (opt-in, default off).
 *
 * Two independent switches, because Waze's telemetry leaves the app through two doors:
 *
 *  1. **Firebase**, through the manifest. Waze ships Crashlytics and Performance Monitoring (no
 *     Analytics - the Measurement SDK is not in the APK at all, verified on 5.28.4.900) and
 *     declares no opt-out for either. Each component reads its own flag at start-up:
 *     `firebase_crashlytics_collection_enabled=false` and
 *     `firebase_performance_collection_deactivated=true`. The SDKs still initialise, find
 *     themselves disabled and never open a transport.
 *     The flag alone is not enough for Crashlytics: Waze re-enables it in code from
 *     `com.waze.crash.g.d()`, which also attaches BUILD_TYPE and USER_FLAG identifiers. That
 *     method is emptied too, so the runtime cannot undo the manifest.
 *  2. **Waze's own stats pipeline** lives in the separate `No usage stats` row - it is the
 *     background half (local stats database, upload batches, thread monitors) and is toggled on
 *     its own so it can be used without this one.
 *
 * Scope, stated plainly: this stops crash reports and Firebase performance data leaving the app.
 * Waze's traffic reporting is native and separate and keeps working, which is intentional - killing
 * it would take other drivers' data away. Police and hazard alerts keep working; they are config,
 * not stats.
 *
 * PROVENANCE: the manifest flags and the dispatch anchor were identified in
 * bearinmindcat/morphe-patches (GPLv3) - see `CREDITS.md`.
 */
/**
 * Crashlytics own start-up (`com.waze.crash.g.d()`): attaches BUILD_TYPE and USER_FLAG and turns
 * collection on, which would override the manifest flag. Void, no parameters, and it carries both
 * constants - the pair is unique in the build.
 */
private object CrashlyticsInitFingerprint : Fingerprint(
    definingClass = "Lcom/waze/crash/g;",
    name = "d",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("BUILD_TYPE"), string("USER_FLAG")),
)

/** Adds (or corrects) the two Firebase opt-out flags on <application>. */
private val firebaseOffPatch = resourcePatch(
    description = "Turns Crashlytics and Performance Monitoring off in the manifest.",
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val flags = listOf(
            "firebase_crashlytics_collection_enabled" to "false",
            "firebase_performance_collection_deactivated" to "true",
        )
        document("AndroidManifest.xml").use { dom ->
            val application = dom.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("removeTelemetryPatch: <application> not found")
            val existing = dom.getElementsByTagName("meta-data")
            val written = mutableListOf<String>()
            for ((key, value) in flags) {
                var node: Element? = null
                for (index in 0 until existing.length) {
                    val candidate = existing.item(index) as? Element ?: continue
                    if (candidate.getAttribute("android:name") == key) {
                        node = candidate
                        break
                    }
                }
                if (node == null) {
                    node = dom.createElement("meta-data").also { application.appendChild(it) }
                    node.setAttribute("android:name", key)
                }
                node.setAttribute("android:value", value)
                written += "$key=$value"
            }
            println("removeTelemetryPatch: manifest flags $written")
        }
    }
}

@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Stops crash reports, usage analytics and performance data leaving the app. " +
        "Traffic reporting and alerts keep working.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    dependsOn(firebaseOffPatch)

    execute {
        CrashlyticsInitFingerprint.method.addInstruction(0, "return-void")
        println("removeTelemetryPatch: crash init silenced, Firebase flags set")
    }
}

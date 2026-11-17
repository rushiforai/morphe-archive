package app.zdrgon.patches.callrecorder.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.callrecorder.shared.Constants.COMPATIBILITY_CALL_RECORDER
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * Call Recorder — Remove telemetry.
 *
 * Census (verified 2026-11-16 against the exact 3.6.9 APK; the
 * 3.7.8 build is identical here): the
 * only telemetry in the app is Bugsnag crash/ANR reporting (SDK
 * classes plus its native library). It is initialized purely by
 * its manifest ContentProvider — there is not one Bugsnag call in
 * app code. The AppMeasurement/Firebase classes present are a
 * handful of transitive stubs with no analytics stack behind them;
 * no AdMob, no advertising ID use, no datatransport, and the
 * license sync talks to the developer's server only about the
 * license itself (app function).
 *
 * The patch disables the Bugsnag startup provider in the manifest,
 * so the SDK never initializes and its native library never loads:
 * no crash reports, no ANR reports, no session data leaves the
 * device. A missing provider is a hard failure — a build that
 * changed the manifest must not silently ship with the reporting
 * still live.
 */
@Suppress("unused")
val removeTelemetryPatch = resourcePatch(
    name = "Remove telemetry",
    description = "Disables the Bugsnag crash-reporting startup provider so no crash, " +
        "ANR or session reports are sent. Call Recorder ships no other telemetry SDK. " +
        "Recording and all other features are unaffected. Call Recorder 3.6.9 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CALL_RECORDER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val target = "com.bugsnag.android.internal.BugsnagContentProvider"

        document("AndroidManifest.xml").use { doc ->
            var disabled = 0
            val elements = doc.getElementsByTagName("provider")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                if (element.getAttribute("android:name") == target) {
                    element.setAttribute("android:enabled", "false")
                    disabled++
                }
            }
            if (disabled != 1) {
                throw PatchException(
                    "Call Recorder telemetry: found $disabled Bugsnag startup providers " +
                        "in the manifest, expected 1; refusing to ship with the crash " +
                        "reporting state unknown."
                )
            }
            logger.info("Call Recorder telemetry: Bugsnag startup provider disabled in the manifest.")
        }
    }
}

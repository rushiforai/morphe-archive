package app.zdrgon.patches.contentcam.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.contentcam.shared.Constants.COMPATIBILITY_CONTENTCAM
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * ContentCam — Remove telemetry.
 *
 * Census (verified 2026-11-16 against the exact 2.8.0 XAPK):
 * ContentCam ships NO telemetry SDKs at all — no Firebase (no
 * Analytics, no Crashlytics, no Installations), no AdMob, no
 * advertising ID, no install referrer, and no third-party analytics
 * (no Amplitude, Sentry, Adjust, AppMetrica, ...). The entitlement
 * path reports nothing anywhere (local RSA verification only, see
 * the "Enable Premium" recon), and the only URLs in the dex are the
 * developer's site and social links.
 *
 * The one piece of upload plumbing present is Google's
 * datatransport library with its CCT backend, a transitive
 * dependency: nothing in the app ever initializes TransportRuntime
 * or produces an event for it (zero references from outside the
 * library), so it is inert — but its three manifest components are
 * background phone-home machinery declared in the manifest, and
 * this patch disables all three so the system can never start
 * them. Same treatment as App Finder's datatransport cut. A
 * missing component is a hard failure: a build that changed the
 * manifest must not silently ship with the plumbing still enabled.
 */
@Suppress("unused")
val removeTelemetryPatch = resourcePatch(
    name = "Remove telemetry",
    description = "Disables the unused Google datatransport upload services in the " +
        "manifest. ContentCam ships no analytics or crash-reporting SDKs; this removes " +
        "the one piece of inert upload plumbing it carries. All features are " +
        "unaffected. ContentCam 2.8.0 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CONTENTCAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val targets = setOf(
            "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
        )

        document("AndroidManifest.xml").use { doc ->
            var disabled = 0
            for (tag in listOf("service", "receiver", "activity", "provider")) {
                val elements = doc.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val element = elements.item(i) as Element
                    if (element.getAttribute("android:name") in targets) {
                        element.setAttribute("android:enabled", "false")
                        disabled++
                    }
                }
            }
            if (disabled != targets.size) {
                throw PatchException(
                    "ContentCam telemetry: disabled $disabled of ${targets.size} datatransport " +
                        "components in the manifest; refusing to ship with the upload plumbing " +
                        "partly enabled."
                )
            }
            logger.info("ContentCam telemetry: all ${targets.size} datatransport components disabled in the manifest.")
        }
    }
}

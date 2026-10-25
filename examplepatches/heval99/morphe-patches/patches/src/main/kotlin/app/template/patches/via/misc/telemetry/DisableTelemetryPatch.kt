package app.template.patches.via.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_VIA
import org.w3c.dom.Element

// Via's only telemetry is Firebase Analytics. The tracker's crash method only logs locally and
// Crashlytics never starts (no FirebaseInitProvider). The tracker's init is left alone: the hub
// queues events until a tracker registers, so skipping it would keep them in memory. The remote
// feature fetch, update and sync checks, report-abuse and ad-block filter downloads are untouched.

// Firebase Analytics' documented manifest kill switch. It also stops the automatic events
// (first_open, session_start, screen_view) the sink hook cannot reach. The stock 7.3.3 manifest
// does not set it, and R8 strips setAnalyticsCollectionEnabled from the bundled SDK.
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"

/** Sets the Firebase Analytics manifest switch under `<application>`. */
private val disableAnalyticsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_VIA)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            // Overwrite in place should a later build ship the key; only direct children count.
            val metas = application.getElementsByTagName("meta-data")
            val meta = (0 until metas.length)
                .mapNotNull { metas.item(it) as? Element }
                .firstOrNull { it.parentNode == application && it.getAttribute("android:name") == ANALYTICS_DEACTIVATED_KEY }
                ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", ANALYTICS_DEACTIVATED_KEY)
                    application.appendChild(it)
                }
            meta.setAttribute("android:value", "true")
        }
    }
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics.",
) {
    compatibleWith(COMPATIBILITY_VIA)

    // 1. Firebase Analytics' manifest switch, for the automatic events.
    dependsOn(disableAnalyticsManifestPatch)

    execute {
        // 2. The tracker's event sink returns before it builds the Bundle and calls logEvent.
        FirebaseTrackerLogEventFingerprint.method.returnEarly()
    }
}

package app.template.patches.pdb.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

private fun Document.el(tag: String, vararg attrs: Pair<String, String>): Element =
    createElement(tag).apply { attrs.forEach { (k, v) -> setAttribute(k, v) } }

/** Third-party tracker components that are disabled in the manifest. */
private val TRACKER_COMPONENTS = listOf(
    // Google Analytics for Firebase (measurement) — usage/event ping machine.
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    // Yandex AppMetrica — device telemetry service + its exported preload provider.
    "io.appmetrica.analytics.internal.PreloadInfoContentProvider",
    "io.appmetrica.analytics.internal.AppMetricaService",
    "io.appmetrica.analytics.IAppMetricaService",
)

/**
 * Crashlytics stays *registered* (the app calls `FirebaseCrashlytics.getInstance()`
 * from its Application.onCreate — removing the registrars crashes startup with
 * `NullPointerException: FirebaseCrashlytics component is not present`) but its
 * data collection is switched off through Crashlytics' documented manifest opt-out
 * below. Same pattern for Firebase Analytics.
 *
 * `FirebaseInitProvider` is intentionally kept — the app needs core Firebase for
 * the email-verification sign-in flow.
 */
private val COLLECTION_OPT_OUTS = listOf(
    "firebase_crashlytics_collection_enabled",
    "analytics_collection_enabled",
    "google_analytics_default_allow_ad_personalization_signals",
)

/**
 * Removes third-party telemetry at patch time.
 *
 *  - Google **measurement** receivers/services: disabled, so no usage events or
 *    install referrer pings reach Google.
 *  - **AppMetrica** (Yandex) provider + services: disabled, so the telemetry
 *    service cannot run (its ad sibling is already killed by Remove ads).
 *  - **Crashlytics** registrars: removed from the Firebase component registry.
 *
 * Deliberately untouched: `FirebaseInitProvider` and the Firebase messaging
 * receiver (push notifications are a real feature), and the app's own backend
 * endpoints.
 */
@Suppress("unused")
val pdbDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Disables Google Analytics measurement and Yandex AppMetrica telemetry, and " +
        "turns off Crashlytics/Analytics data collection via their official opt-out flags.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        document(MANIFEST).use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element

            // Disable every tracker component (the manifest DOM does not expose
            // namespaced attributes via getAttribute; go through .attributes).
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in TRACKER_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "provider") el.setAttribute("android:exported", "false")
                }
            }

            // Collection opt-outs (Crashlytics + Analytics keep working as classes,
            // they just stop collecting/uploading).
            for (meta in COLLECTION_OPT_OUTS) {
                val metas = doc.getElementsByTagName("meta-data")
                var present = false
                for (i in 0 until metas.length) {
                    val el = metas.item(i) as? Element ?: continue
                    if (el.attributes?.getNamedItem("android:name")?.nodeValue == meta) {
                        el.setAttribute("android:value", "false")
                        present = true
                        break
                    }
                }
                if (!present) {
                    application.appendChild(
                        doc.el(
                            "meta-data",
                            "android:name" to meta,
                            "android:value" to "false",
                        ),
                    )
                }
            }
        }
    }
}

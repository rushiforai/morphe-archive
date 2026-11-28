package app.template.patches.pluralsight.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.PLURALSIGHT_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Auto-init components that must not run.
 *
 * Heap — the behavioural session recorder — is initialised entirely by two manifest
 * ContentProviders (verified in the 2026.11.05 build):
 *
 *   io.heap.autocapture.HeapViewAutocaptureContentProvider  (com.pluralsight.HeapViewAutocaptureContentProvider, initOrder 1)
 *   io.heap.core.HeapContentProvider                         (com.pluralsight.HeapCoreContentProvider, initOrder 2)
 *
 * Disabling the pair stops Heap's view autocapture and its session clock from ever
 * starting, which is the whole SDK — Heap has no other init path here (no `startRecording`
 * call site exists in this build). Firebase Analytics' own collection is additionally
 * switched off through the standard opt-outs below.
 */
private val TRACKER_COMPONENTS = listOf(
    "io.heap.autocapture.HeapViewAutocaptureContentProvider",
    "io.heap.core.HeapContentProvider",
)

/**
 * Firebase collection opt-outs (morphe/repo standard names).
 *
 * NOTE: none of these meta-data entries exists in Pluralsight's manifest — verified. So
 * they are **created** rather than flipped; a flip-only loop would silently do nothing.
 */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Disables Pluralsight's auto-init telemetry components and sets the Firebase opt-outs.
 *
 * Companion to [pluralsightDisableTrackersPatch], which no-ops the app's own Firebase
 * Analytics event sink. FCM push, Firebase Remote Config and Crashlytics are left alone —
 * in this build they back notifications and config, not analytics.
 */
@Suppress("unused")
val pluralsightDisableTrackerComponentsPatch = resourcePatch(
    name = "Disable tracker components",
    description = "Disables Heap's two auto-init ContentProviders (behavioural session " +
        "recording) and sets the Firebase analytics collection opt-outs. FCM push and " +
        "remote config are kept.",
    default = true,
) {
    compatibleWith(PLURALSIGHT_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in TRACKER_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "provider") el.setAttribute("android:exported", "false")
                }
            }

            // Flip any opt-out that already exists, then create the rest (the common case
            // in this build — none of these keys is present, see [OPT_OUTS]).
            val existing = mutableMapOf<String, Element>()
            val metas = doc.getElementsByTagName("meta-data")
            for (i in 0 until metas.length) {
                val el = metas.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in OPT_OUTS) {
                    el.setAttribute("android:value", OPT_OUTS.getValue(name))
                    existing[name] = el
                }
            }

            val application = doc.getElementsByTagName("application").item(0) as Element
            for ((key, value) in OPT_OUTS) {
                if (key in existing) continue
                val meta = doc.createElement("meta-data")
                meta.setAttribute("android:name", key)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
        }
    }
}
package app.template.patches.adidas.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.ADIDAS_RUNNING_COMPATIBILITY
import org.w3c.dom.Element

/** Third-party telemetry components disabled in the manifest. */
private val TRACKER_COMPONENTS = listOf(
    // Google Analytics for Firebase / Google Analytics v3 measurement pipeline.
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    // Adjust attribution SDK auto-init provider.
    "com.adjust.sdk.SystemLifecycleContentProvider",
)

/** Firebase Analytics / Google Analytics collection opt-outs. */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Disables adidas Running's third-party telemetry components in the manifest: the
 * Google Analytics measurement receiver/services and the Adjust lifecycle provider are
 * switched off, and the Firebase/Google Analytics collection opt-outs are set.
 * Firebase Cloud Messaging push is deliberately left intact.
 */
@Suppress("unused")
val adidasDisableTrackerComponentsPatch = resourcePatch(
    name = "Disable tracker components",
    description = "Disables the Google Analytics measurement receiver/services and the " +
        "Adjust lifecycle provider, and sets the Firebase/Google Analytics collection opt-outs.",
    default = true,
) {
    category("Privacy")
    compatibleWith(ADIDAS_RUNNING_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in TRACKER_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "receiver" || el.tagName == "service") {
                        el.setAttribute("android:exported", "false")
                    }
                }
            }

            val application = doc.getElementsByTagName("application").item(0) as Element
            val metas = doc.getElementsByTagName("meta-data")
            val handled = mutableSetOf<String>()
            for (i in 0 until metas.length) {
                val el = metas.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in OPT_OUTS) {
                    el.setAttribute("android:value", OPT_OUTS.getValue(name))
                    handled += name
                }
            }
            for ((name, value) in OPT_OUTS) {
                if (name in handled) continue
                val meta = doc.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
        }
    }
}

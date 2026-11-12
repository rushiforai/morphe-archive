package app.template.patches.nikerunclub.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.NIKE_RUN_CLUB_COMPATIBILITY
import org.w3c.dom.Element

/** Adobe Experience Platform components disabled in the manifest. */
private val TRACKER_COMPONENTS = listOf(
    // Auto-discovers + registers Adobe extensions declared in the manifest.
    "com.adobe.marketing.mobile.ExtensionDiscoveryService",
    // Adobe Assurance (debug/telemetry link) UI.
    "com.adobe.marketing.mobile.assurance.internal.ui.AssuranceActivity",
    // Adobe in-app messaging (promotional full-screen messages).
    "com.adobe.mobile.MessageFullScreenActivity",
)

/**
 * Firebase Analytics collection opt-outs, applied as manifest meta-data. NRC ships no
 * Firebase Analytics extension (only FCM + Installations), but the flags are set
 * defensively so no Firebase measurement upload can occur.
 */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Removes Nike Run Club's third-party telemetry components at the manifest layer:
 * the Adobe extension-discovery service and Adobe's Assurance / in-app-message
 * activities are disabled, and the Firebase collection opt-outs are set. The Adobe
 * code path itself is neutralised by [nikeDisableTrackersPatch].
 */
@Suppress("unused")
val nikeDisableTrackerComponentsPatch = resourcePatch(
    name = "Disable tracker components",
    description = "Disables Adobe's extension-discovery service and messaging activities " +
        "and sets the Firebase Analytics collection opt-outs.",
    default = true,
) {
    category("Privacy")
    compatibleWith(NIKE_RUN_CLUB_COMPATIBILITY)

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

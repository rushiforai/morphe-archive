package app.nullroute3.patches.abrp.privacy

import app.nullroute3.patches.abrp.shared.Constants.COMPATIBILITY_ABRP
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

private val ANALYTICS_FLAGS = setOf(
    "google_analytics_adid_collection_enabled",
    "google_analytics_ssaid_collection_enabled",
    "google_analytics_default_allow_ad_personalization_signals",
    "google_analytics_default_allow_google_signals",
)

/**
 * Firebase Analytics collects the advertising ID and SSAID. These manifest
 * flags are read by the SDK at init.
 */
@Suppress("unused")
val disableAnalyticsCollectionPatch = patch(
    name = "Disable analytics collection",
    description = "Sets the Firebase Analytics collection flags to false in the manifest",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ABRP)

    finalize {
        resourceXml("AndroidManifest.xml").use { manifest ->
            for (metaData in manifest.root.elements("meta-data")) {
                if (metaData.attribute("android:name") in ANALYTICS_FLAGS) {
                    metaData.setAttribute("android:value", "false")
                }
            }
        }
    }
}

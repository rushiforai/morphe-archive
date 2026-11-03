package semicoloncolonel.mobilestream.patches.whitehouse.privacy

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants

// White House 47.7.8 ships Firebase Analytics with every ad setting on: it
// reads the advertising ID and the Android ID, and its consent defaults
// grant ad storage, ad user data, and ad personalization. The app logs what
// you read, how far you scroll, what you watch, and what you search for.
// Analytics collection is switched off in the manifest, along with the ad
// ID, the Android ID, and every consent default, and the Privacy Sandbox
// ad permissions are removed. The shared host blocklist also covers
// Firebase's upload.
//
// Not touched: push notifications (OneSignal), polls, and Firebase App
// Check, which polls use to verify the app.

private val consentDefaults = mapOf(
    "google_analytics_default_allow_analytics_storage" to "false",
    "google_analytics_default_allow_ad_storage" to "false",
    "google_analytics_default_allow_ad_user_data" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_analytics_collection_enabled" to "false",
)

private val adPermissions = setOf(
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "com.google.android.gms.permission.AD_ID",
)

private val consentDefaultsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = application.getElementsByTagName("meta-data")
            val existing = (0 until metaData.length)
                .mapNotNull { metaData.item(it) as? Element }
                .associateBy { it.getAttribute("android:name") }
            for ((name, value) in consentDefaults) {
                val element = existing[name] ?: document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                element.setAttribute("android:value", value)
            }
            val permissions = document.getElementsByTagName("uses-permission")
            (0 until permissions.length)
                .map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") in adPermissions }
                .forEach { manifest.removeChild(it) }
        }
    }
}

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Firebase Analytics, which records what you read, watch, and search " +
        "for, and stops the app from reading your advertising ID. Push notifications and " +
        "polls are left alone. Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch, consentDefaultsPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}

package app.template.patches.daylio

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DAYLIO
import org.w3c.dom.Element
import org.w3c.dom.Node

// Daylio 1.72.0 (291) - telemetry, attribution and marketing paths.
//
// WHAT IS NOT HERE: an ad blocker. Daylio 1.72.0 ships no ad SDK at all - checked, not assumed:
//
//   * the package census has no ads package: com.google.android.gms.ads -> 0 classes, and none of
//     AdMob / Meta Audience Network / AppLovin / ironSource / Unity Ads / Pangle / Mintegral is
//     present anywhere in the 12,506 classes;
//   * no ad API token survives anywhere either: MobileAds, AdRequest, loadAd, InterstitialAd,
//     RewardedAd, BannerAd, onAdLoaded -> 0 hits each.
//
// The four hits that look ad-shaped are not ad code: "ad_impression" is Firebase Analytics' own
// reserved event name, and the "admob_app_id" strings belong to a database schema unrelated to a
// runtime ad SDK. So there is nothing to block.
//
// What the app DOES ship is a full measurement stack, and that is what this patch removes:
//
//   Firebase Analytics + Google Tag Manager (122 gtm classes, 14 measurement classes)
//   Firebase Crashlytics
//   Firebase AppCheck on Play Integrity  (which cannot pass on a re-signed APK anyway)
//   the Advertising ID and install-referrer permissions that feed attribution
//   optionally, the "special offer" discount-notification receivers
//
// Everything here is manifest-level. Nothing in the dex is rewritten, so there is no new code that
// could crash: the SDKs are still present, they are simply never switched on or never told to
// collect. That matters because app code does call FirebaseAnalytics in 5 places; removing the
// library would turn those calls into NoClassDefFoundError, while switching collection off makes
// them no-ops.

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

internal val disableAnalyticsOption = booleanOption(
    key = "disableAnalytics",
    default = true,
    title = "Turn off analytics",
    description = "Stops Firebase Analytics and Google Tag Manager from collecting or sending anything. " +
        "The app keeps working; its analytics calls become no-ops.",
)

internal val disableCrashlyticsOption = booleanOption(
    key = "disableCrashlytics",
    default = true,
    title = "Turn off crash reporting",
    description = "Stops Firebase Crashlytics from uploading crash reports.",
)


internal val removeAdvertisingPermissionsOption = booleanOption(
    key = "removeAdvertisingPermissions",
    default = true,
    title = "Remove advertising-ID and install-referrer access",
    description = "Removes the AD_ID, ad-services and install-referrer permissions, so the app cannot " +
        "read your advertising ID or the install attribution that came with it.",
)

internal val removeSpecialOffersOption = booleanOption(
    key = "removeSpecialOffers",
    default = false,
    title = "Remove discount notifications",
    description = "Removes the three receivers that schedule Daylio's discount / special-offer " +
        "notifications. Off by default because it changes something you can see: you stop being " +
        "notified when a discount is running.",
)

/**
 * Reads an attribute by local name, whatever namespace binding the decoder produced.
 * getAttributeNS(ANDROID_NS, ...) returns "" when the decoded document does not bind the android
 * prefix to that exact URI, which is what made the first run of this patch see zero registrars.
 */
private fun Element.attr(local: String): String {
    for (i in 0 until attributes.length) {
        val attribute = attributes.item(i)
        if (attribute.localName == local || attribute.nodeName == "android:$local") {
            return attribute.nodeValue ?: ""
        }
    }
    return ""
}

private fun Element.children(): List<Node> {
    val nodes = mutableListOf<Node>()
    for (i in 0 until childNodes.length) nodes += childNodes.item(i)
    return nodes
}

private fun Element.elements(tag: String): List<Element> =
    children().filterIsInstance<Element>().filter { it.tagName == tag }

/** Adds an <application> meta-data entry, replacing any existing value for the same name. */
private fun setMetaData(document: org.w3c.dom.Document, application: Element, name: String, value: String) {
    val existing = application.elements("meta-data").firstOrNull {
        it.attr("name") == name
    }
    if (existing != null) {
        existing.setAttribute("android:value", value)
        return
    }
    val entry = document.createElement("meta-data")
    entry.setAttribute("android:name", name)
    entry.setAttribute("android:value", value)
    application.appendChild(entry)
}

internal val daylioTrackingManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
                ?: throw PatchException("Daylio tracking patch: no root element in AndroidManifest.xml")
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Daylio tracking patch: AndroidManifest.xml has no <application>")

            if (disableAnalyticsOption.value == true) {
                // Firebase reads this at initialisation; the Analytics SDK then collects nothing.
                setMetaData(document, application, "firebase_analytics_collection_enabled", "false")
                setMetaData(document, application, "google_analytics_default_allow_analytics_storage", "false")
                setMetaData(document, application, "google_analytics_default_allow_ad_storage", "false")
                setMetaData(document, application, "google_analytics_default_allow_ad_user_data", "false")
                setMetaData(document, application, "google_analytics_default_allow_ad_personalization_signals", "false")
            }

            if (disableCrashlyticsOption.value == true) {
                setMetaData(document, application, "firebase_crashlytics_collection_enabled", "false")
            }

            // AppCheck registrars are deliberately left in place.
            //
            // Daylio asks the Firebase component container for its AppCheck component during
            // startup: MyApplication.a(Context) does FirebaseApp.get(z12.class) (z12 is AppCheck
            // after R8 renaming) and immediately dereferences it, then fetches the Play Integrity
            // token component (rr6). Removing either registrar makes those lookups return null and
            // the app dies before the first screen:
            //   NullPointerException: Attempt to read from field 'o23 z12.a' on a null object
            //   at net.daylio.MyApplication.a / onCreate
            // Nothing is gained by removing them anyway: Daylio never calls
            // installAppCheckProviderFactory, so AppCheck has no provider and cannot produce or
            // send a token.

            if (removeAdvertisingPermissionsOption.value == true) {
                // Attribution plumbing. These are only used by the measurement SDKs above, so on a
                // device they simply stop being granted; the app has no other use for them.
                val advertising = setOf(
                    "com.google.android.gms.permission.AD_ID",
                    "android.permission.ACCESS_ADSERVICES_AD_ID",
                    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                )
                var removed = 0
                manifest.elements("uses-permission").forEach { element ->
                    if (element.attr("name") in advertising) {
                        element.parentNode?.removeChild(element)
                        removed++
                    }
                }
                println("Daylio tracking: removed $removed advertising/attribution permission(s).")
            }

            if (removeSpecialOffersOption.value == true) {
                // The discount-notification scheduling. Removing the receivers leaves the alarm
                // intents with no target, which Android drops, so nothing fires.
                val offers = setOf(
                    "net.daylio.receivers.SpecialOfferStartReceiver",
                    "net.daylio.receivers.SpecialOfferEndReceiver",
                    "net.daylio.receivers.SpecialOfferLastChanceReceiver",
                )
                var removed = 0
                application.elements("receiver").forEach { element ->
                    if (element.attr("name") in offers) {
                        element.parentNode?.removeChild(element)
                        removed++
                    }
                }
                println("Daylio tracking: removed $removed special-offer receiver(s).")
            }
        }
    }
}

internal val removeDaylioTrackingPatch = bytecodePatch(
    name = "Remove tracking & marketing",
    description = "Daylio ships no ad SDK - this build has none to block. It does ship Firebase Analytics, " +
        "Tag Manager, Crashlytics and the advertising-ID permissions; this turns " +
        "those off. Every part is switchable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DAYLIO)
    dependsOn(daylioTrackingManifestPatch)

    disableAnalyticsOption()
    disableCrashlyticsOption()
    removeAdvertisingPermissionsOption()
    removeSpecialOffersOption()

    execute {
        check(packageMetadata.packageName == "net.daylio") { "This patch is for net.daylio only." }
        println(
            "Daylio tracking: note there is no ad SDK in this build; what is removed is measurement, " +
                "crash reporting and the advertising-ID path.",
        )
    }
}

package app.unlimited.sportsnet.patches.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.unlimited.sportsnet.patches.shared.Constants.COMPATIBILITY_SPORTSNET
import app.unlimited.sportsnet.patches.shared.originalSignaturePatch
import app.unlimited.sportsnet.patches.shared.emptyVoidMethods

private const val ANALYTICS = "Lcom/rogers/sportsnet/service/analytics"

/** Diva (the Sportsnet+ player) builds its Youbora and Conviva trackers here; null means none. */
private object YouboraBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/deltatre/divaboadapter/analytics/MediaAnalyticsProvider;",
    name = "youboraBuilder",
)

private object ConvivaBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/deltatre/divaboadapter/analytics/MediaAnalyticsProvider;",
    name = "convivaBuilder",
)

/** Turns off Firebase Analytics, its advertising ID use, and Crashlytics, as the SDKs document. */
private val disableFirebaseCollectionPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
            ).forEach { (name, value) ->
                val metaData = document.createElement("meta-data")
                metaData.setAttribute("android:name", name)
                metaData.setAttribute("android:value", value)
                application.appendChild(metaData)
            }
        }
    }
}

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Stops Adobe, Comscore, New Relic, Chartbeat, Firebase, Conviva and Youbora " +
        "from collecting and sending data about you and what you watch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)
    dependsOn(disableFirebaseCollectionPatch)

    execute {
        // Adobe keeps starting, since other code waits for its visitor ID, but sends nothing.
        emptyVoidMethods(
            "Lcom/rogers/android/core/analytics/implementation/AdobeAnalyticsManager;",
            "sendEvent", "trackAction", "startSession",
        )
        emptyVoidMethods(
            "Lcom/rogers/core/analytics/adobe/AdobeAnalyticProvider;",
            "trackErrorEvent", "trackUserEvent", "trackAppEvent", "trackBrowseEvent",
            "trackPlaybackEvent", "trackSubscriptionEvent", "trackSubscriptionEvents",
        )

        emptyVoidMethods("$ANALYTICS/comscore/ComScoreAnalyticsManager;")
        emptyVoidMethods("$ANALYTICS/newrelic/NewRelicAnalyticsManager;")
        emptyVoidMethods("Lcom/chartbeat/androidsdk/Tracker;")

        YouboraBuilderFingerprint.method.returnEarly(null)
        ConvivaBuilderFingerprint.method.returnEarly(null)
    }
}

package app.badfella.patches.ticktick.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.badfella.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private object LegacyAnalyticsConstructorFingerprint : Fingerprint(
    definingClass = "Lb7/a;", // Legacy Google Analytics provider in supported build 8240.
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/android/gms/analytics/GoogleAnalytics;", name = "getInstance"),
        methodCall(definingClass = "Lcom/google/android/gms/analytics/GoogleAnalytics;", name = "newTracker"),
    ),
)

private val disableLegacyAnalyticsPatch = bytecodePatch {
    execute {
        // The provider already handles an absent tracker. Avoid starting its dispatch worker at all.
        LegacyAnalyticsConstructorFingerprint.method.addInstructions(0, """
            invoke-direct {p0}, Ljava/lang/Object;-><init>()V
            return-void
        """)
    }
}

@Suppress("unused")
val disableAnalyticsPatch = resourcePatch(
    name = "Disable analytics collection",
    description = "Disables declared analytics and crash collection and removes advertising permissions. Keeps Firebase Messaging and location permissions. Does not guarantee zero tracking."
) {
    compatibleWith(COMPATIBILITY_TICKTICK)
    dependsOn(disableLegacyAnalyticsPatch)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val permissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
            )
            val components = setOf(
                "com.google.android.gms.analytics.AnalyticsReceiver",
                "com.google.android.gms.analytics.AnalyticsService",
                "com.google.android.gms.analytics.CampaignTrackingService",
                "com.google.android.gms.analytics.AnalyticsJobService",
                "com.google.android.gms.measurement.AppMeasurementReceiver",
                "com.google.android.gms.measurement.AppMeasurementService",
                "com.google.android.gms.measurement.AppMeasurementJobService",
                "com.ticktick.task.analytics.channel.ChannelTrackingReceiver",
                "com.bugsnag.android.internal.BugsnagContentProvider",
            )
            val nodes = manifest.getElementsByTagName("*")
            for (index in nodes.length - 1 downTo 0) {
                val node = nodes.item(index) as Element
                val name = node.getAttributeNS(ANDROID, "name")
                if ((node.tagName == "uses-permission" && name in permissions) ||
                    (node.tagName in setOf("receiver", "service", "provider") && name in components)
                ) {
                    node.parentNode.removeChild(node)
                }
            }

            val application = manifest.getElementsByTagName("application").item(0) as Element
            val settings = mapOf(
                "firebase_analytics_collection_enabled" to false,
                "firebase_analytics_collection_deactivated" to true,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_performance_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "google_analytics_ssaid_collection_enabled" to false,
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "google_analytics_default_allow_ad_personalization_signals" to false,
                "google_analytics_deferred_deep_link_enabled" to false,
            )
            for ((name, value) in settings) {
                val metadata = application.getElementsByTagName("meta-data")
                val existing = (0 until metadata.length)
                    .map { metadata.item(it) as Element }
                    .firstOrNull { it.parentNode == application && it.getAttributeNS(ANDROID, "name") == name }
                val node = existing ?: manifest.createElement("meta-data").also(application::appendChild)
                node.setAttributeNS(ANDROID, "android:name", name)
                node.removeAttributeNS(ANDROID, "resource")
                node.setAttributeNS(ANDROID, "android:value", value.toString())
            }
        }
    }
}

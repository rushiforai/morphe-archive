package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG
import org.w3c.dom.Element

private const val DISABLED_PREFIX = "disabled_"

private val disablePermissions = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

private val metaValues = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "google_analytics_automatic_screen_reporting_enabled" to "false",
    "google_analytics_default_allow_analytics_storage" to "false",
    "google_analytics_default_allow_ad_storage" to "false",
    "google_analytics_default_allow_ad_user_data" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "app_data_collection_default_enabled" to "false",
    "io.sentry.auto-init" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)

private val disableComponents = setOf(
    "com.google.android.gms.analytics.AnalyticsService",
    "com.google.android.gms.analytics.AnalyticsReceiver",
    "com.google.android.gms.analytics.AnalyticsJobService",
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "io.sentry.android.core.SentryInitProvider",
    "io.sentry.android.core.SentryPerformanceProvider",
    "io.sentry.ndk.SentryNdkPreloadProvider",
)

private val disableComponentShortNames = disableComponents.map { it.substringAfterLast('.') }.toSet()

@Suppress("unused")
val disableManifestTelemetryPatch = resourcePatch(
    name = "Disable manifest telemetry",
    description = "Disables Firebase and Google Analytics collection flags, Sentry and Facebook SDK collection flags, " +
        "the ad ID and install referrer permissions, and the Google Analytics, Measurement, and Sentry components " +
        "in AndroidManifest.xml.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val permissions = manifest.getElementsByTagName("uses-permission")
            for (i in 0 until permissions.length) {
                val element = permissions.item(i) as Element
                val name = element.getAttribute("android:name")
                if (name in disablePermissions) element.setAttribute("android:name", DISABLED_PREFIX + name)
            }

            val metaElements = manifest.getElementsByTagName("meta-data")
            val presentMeta = mutableSetOf<String>()
            for (i in 0 until metaElements.length) {
                val element = metaElements.item(i) as Element
                val name = element.getAttribute("android:name")
                val value = metaValues[name] ?: continue
                presentMeta += name
                element.setAttribute("android:value", value)
            }

            val application = manifest.getElementsByTagName("application").item(0) as Element
            metaValues.filterKeys { it !in presentMeta }.forEach { (name, value) ->
                application.appendChild(manifest.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                })
            }

            for (tag in listOf("service", "receiver", "provider")) {
                val components = manifest.getElementsByTagName(tag)
                for (i in 0 until components.length) {
                    val element = components.item(i) as Element
                    val name = element.getAttribute("android:name")
                    if (name in disableComponents || name.substringAfterLast('.') in disableComponentShortNames) {
                        element.setAttribute("android:enabled", "false")
                    }
                }
            }
        }
    }
}

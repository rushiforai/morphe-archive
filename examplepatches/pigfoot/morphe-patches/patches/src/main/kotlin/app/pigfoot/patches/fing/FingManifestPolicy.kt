package app.pigfoot.patches.fing

import org.w3c.dom.Document
import org.w3c.dom.Element

internal val fingTelemetryMetadata = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "google_analytics_automatic_screen_reporting_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "google_analytics_deferred_deep_link_enabled" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false"
)
internal val fingAdPermissions = setOf(
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "com.google.android.gms.permission.AD_ID"
)
internal val fingAnalyticsComponents = setOf(
    "com.google.android.gms.analytics.AnalyticsJobService",
    "com.google.android.gms.analytics.AnalyticsService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.analytics.AnalyticsReceiver",
    "com.google.android.gms.measurement.AppMeasurementReceiver"
)

internal fun applyFingManifestPolicy(doc: Document) {
    val apps = doc.getElementsByTagName("application")
    require(apps.length == 1) { "Ambiguous Fing application manifest" }
    val app = apps.item(0) as Element
    // Validate every key before writing any of the telemetry metadata.
    val existing = (0 until app.childNodes.length).mapNotNull { app.childNodes.item(it) as? Element }
    for (key in fingTelemetryMetadata.keys) require(existing.count {
        it.tagName == "meta-data" && it.getAttribute("android:name") == key
    } <= 1) { "Duplicate Fing telemetry metadata: $key" }
    for ((key, value) in fingTelemetryMetadata) {
        val node = existing.singleOrNull { it.tagName == "meta-data" && it.getAttribute("android:name") == key }
            ?: doc.createElement("meta-data").also { app.appendChild(it) }
        node.setAttribute("android:name", key)
        node.removeAttribute("android:resource")
        node.setAttribute("android:value", value)
    }
    val nodes = doc.getElementsByTagName("*")
    val remove = (0 until nodes.length).map { nodes.item(it) as Element }.filter {
        val name = it.getAttribute("android:name")
        it.tagName in setOf("uses-permission", "uses-permission-sdk-23") && name in fingAdPermissions ||
            it.tagName in setOf("service", "receiver") && name in fingAnalyticsComponents
    }
    remove.forEach { it.parentNode.removeChild(it) }
}

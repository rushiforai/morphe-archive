package patches.buienradar.tracking

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR
import patches.buienradar.shared.Constants.originalInput

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            fun elements(tag: String): List<Element> {
                val nodes = application.getElementsByTagName(tag)
                return (0 until nodes.length).map { nodes.item(it) as Element }
            }
            fun flag(name: String, value: Boolean) {
                val matches = elements("meta-data").filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate manifest flag: $name" }
                val element = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name)
                    application.appendChild(it)
                }
                element.setAttributeNS(ANDROID, "android:value", value.toString())
            }

            // Hard deactivation takes precedence over the OneTrust consent callback,
            // which grants analytics storage and re-enables collection at runtime.
            flag("firebase_analytics_collection_deactivated", true)
            listOf(
                "firebase_analytics_collection_enabled", "google_analytics_automatic_screen_reporting_enabled",
                "google_analytics_adid_collection_enabled", "google_analytics_sgtm_upload_enabled",
                "google_analytics_default_allow_analytics_storage", "google_analytics_default_allow_ad_storage",
                "google_analytics_default_allow_ad_user_data", "google_analytics_default_allow_ad_personalization_signals",
                "firebase_crashlytics_collection_enabled", "firebase_sessions_enabled",
            ).forEach { flag(it, false) }

            // Crashlytics and Sessions registrars stay: app code dereferences Crashlytics,
            // and Crashlytics depends on the Sessions component. Their flags disable upload.
            elements("meta-data").single {
                it.getAttribute("android:name") ==
                    "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar"
            }.let { it.parentNode.removeChild(it) }
            listOf(
                "receiver" to "com.google.android.gms.measurement.AppMeasurementReceiver",
                "service" to "com.google.android.gms.measurement.AppMeasurementService",
                "service" to "com.google.android.gms.measurement.AppMeasurementJobService",
            ).forEach { (tag, name) ->
                elements(tag).single { it.getAttribute("android:name") == name }
                    .setAttributeNS(ANDROID, "android:enabled", "false")
            }

            val permissions = doc.getElementsByTagName("uses-permission")
            val removed = (0 until permissions.length).map { permissions.item(it) as Element }.filter {
                val name = it.getAttribute("android:name")
                name == "com.google.android.gms.permission.AD_ID" ||
                    name == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    name == "android.permission.AD_SERVICES_CONFIG" ||
                    name.startsWith("android.permission.ACCESS_ADSERVICES_")
            }
            check(removed.size == 5) { "Expected five advertising/attribution permissions, found ${removed.size}" }
            removed.forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Disables Snowplow (RTL, DPG Media and Kantar), Firebase Analytics, Crashlytics and Sessions, " +
        "Smartocto and Bitmovin video analytics, Usabilla telemetry and campaigns, and advertising/attribution IDs. " +
        "Weather alerts keep working.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)
    dependsOn(originalInput, trackingResources)

    execute {
        // Snowplow trackers are never created. All users null-check them and log instead.
        // The Kantar user-ID ping is a plugin of the RTL tracker and stops with it.
        SnowplowInitFingerprint.method.addInstructions(0, "return-void")

        // The dispatcher only forwards events and records which ones were sent.
        AnalyticsDispatchFingerprint.method.addInstructions(0, "return-void")

        // Smartocto "videoPlay" ping on first playback of each video.
        val smartoctoRequest = SmartoctoRequestFingerprint.originalClassDef.type
        smartoctoListenerFingerprint(smartoctoRequest).method.addInstructions(0, "return-void")

        // Bitmovin Analytics: return the player/source without attaching a collector.
        BitmovinPlayerAnalyticsFingerprint.method.addInstructions(0, "return-object p0")
        BitmovinSourceAnalyticsFingerprint.method.addInstructions(0, "return-object p0")

        // Usabilla: telemetry level 0 records nothing, so nothing is submitted.
        // Event-triggered campaigns stop; the feedback form opened from Settings remains.
        UsabillaTelemetryRecorderFingerprint.method.addInstructions(0, "const/4 p1, 0x0")
        UsabillaSendEventFingerprint.method.addInstructions(0, "return-void")

        // Also ignore a persisted Crashlytics opt-in, which overrides the manifest flag.
        crashlyticsCollectionEnabledFingerprint(CrashlyticsArbiterFingerprint.originalClassDef.type).method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}

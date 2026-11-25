package patches.weerplaza

import app.morphe.patcher.Fingerprint
import patches.shared.uniqueMatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            fun elements(tag: String): List<Element> {
                val nodes = doc.getElementsByTagName(tag)
                return (0 until nodes.length).map { nodes.item(it) as Element }
            }
            fun flag(name: String, value: Boolean) {
                val matches = elements("meta-data").filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate $name" }
                val e = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name); application.appendChild(it)
                }
                e.setAttributeNS(ANDROID, "android:value", value.toString())
            }
            flag("firebase_analytics_collection_deactivated", true)
            flag("firebase_performance_collection_deactivated", true)
            listOf("firebase_analytics_collection_enabled", "google_analytics_automatic_screen_reporting_enabled",
                "google_analytics_adid_collection_enabled", "google_analytics_sgtm_upload_enabled",
                "google_analytics_default_allow_analytics_storage", "google_analytics_default_allow_ad_storage",
                "google_analytics_default_allow_ad_user_data", "google_analytics_default_allow_ad_personalization_signals",
                "firebase_crashlytics_collection_enabled", "firebase_sessions_enabled", "firebase_performance_collection_enabled",
                "firebase_performance_logcat_enabled", "firebase_inappmessaging_auto_data_collection_enabled",
                "delivery_metrics_exported_to_big_query_enabled").forEach { flag(it, false) }
            // Performance's instrumented HTTP wrappers remain available, hard-deactivated.
            val removed = elements("meta-data").filter {
                val n = it.getAttribute("android:name")
                n.startsWith("com.google.firebase.components:com.google.firebase.crashlytics.") ||
                    n.startsWith("com.google.firebase.components:com.google.firebase.inappmessaging.") ||
                    n == "com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar" ||
                    n == "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar"
            }
            check(removed.size == 8) { "Expected eight optional Firebase registrars, found ${removed.size}" }
            removed.forEach { it.parentNode.removeChild(it) }
            listOf("infoplaza.network.ads.ppid.PPIDContentProvider", "com.google.android.gms.ads.AdService",
                "com.google.android.gms.measurement.AppMeasurementReceiver", "com.google.android.gms.measurement.AppMeasurementService",
                "com.google.android.gms.measurement.AppMeasurementJobService").forEach {
                doc.one("android:name", it).setAttributeNS(ANDROID, "android:enabled", "false")
            }
            val permissions = elements("uses-permission").filter {
                val n = it.getAttribute("android:name")
                n == "com.google.android.gms.permission.AD_ID" || n == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    n == "com.amazon.privacypass.ATTEST" || n == "android.permission.AD_SERVICES_CONFIG" ||
                    n.startsWith("android.permission.ACCESS_ADSERVICES_") || n.startsWith("infoplaza.network.ads.ppid.")
            }
            check(permissions.size == 13) { "Expected thirteen advertising/PPID permissions, found ${permissions.size}" }
            permissions.forEach { it.parentNode.removeChild(it) }
            val own = elements("permission").filter { it.getAttribute("android:name").startsWith("infoplaza.network.ads.ppid.") }
            check(own.size == 1) { "Expected own PPID permission" }
            own.forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables app/Firebase analytics, Crashlytics, Performance, Sessions, PPID, advertising identifiers, video statistics, Didomi metrics/API events, optional RevenueCat telemetry and known WebView trackers, retaining weather, purchases and push.",
) {
    dependsOn(originalInput)
    compatibleWith(weerplaza)
    dependsOn(hideAds, trackingResources)
    execute {
        fun stop(cls: String, name: String, vararg params: String) = exact(cls, name, "V", *params).method.addInstructions(0, "return-void")
        fun disabled(cls: String, name: String, vararg params: String) = exact(cls, name, "Z", *params).method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        stop("Lu7/b;", "b", "Landroid/content/Context;")
        stop("Lu7/b;", "c", "Ljava/lang/String;", "Ljava/lang/String;")
        stop("Lu7/b;", "d", "Landroid/app/Activity;", "Ljava/lang/String;")
        stop("Lu7/b;", "e", "Z"); stop("Lu7/b;", "f", "Ljava/lang/String;"); stop("Lu7/b;", "g", "Ljava/util/List;")
        stop("Lp9/a;", "a", "Lo9/e;")
        // Callers log unconditionally: provide an inert wrapper rather than null or SDK initialization.
        val crash = "Lcom/google/firebase/crashlytics/a;"
        exact(crash, "b", crash).method.addInstructions(0, """
            new-instance v0, $crash
            const/4 v1, 0x0
            invoke-direct {v0, v1}, $crash-><init>(Le4/y;)V
            return-object v0
        """.trimIndent())
        stop(crash, "d", "Ljava/lang/String;"); stop(crash, "e", "Ljava/lang/Throwable;"); stop(crash, "f", "Ljava/lang/String;", "Ljava/lang/String;")
        disabled("Le4/e0;", "d") // persisted collection opt-in overrides manifest alone
        Fingerprint(definingClass = "Lcom/google/firebase/messaging/k0;", name = "a", returnType = "Z", strings = listOf("export_to_big_query", "delivery_metrics_exported_to_big_query_enabled")).uniqueMatch().method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        disabled("Lio/didomi/sdk/s9;", "a", "Ljava/lang/String;", "Ljava/lang/String;")
        // b() has no app callback; it only queues events and marks its sender busy.
        // Suppress enqueue, replay and network dispatch together, before any busy flag is set.
        disabled("Lio/didomi/sdk/apiEvents/b;", "b", "[Lio/didomi/sdk/i;")
        stop("Lio/didomi/sdk/apiEvents/b;", "c", "[Lio/didomi/sdk/i;")
        stop("Lio/didomi/sdk/apiEvents/b;", "f")
        Fingerprint(definingClass = "Ln9/e;", name = "a", returnType = "Ljava/lang/String;", strings = listOf("infoplaza.network.ads.ppid")).uniqueMatch().method.addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
        exact("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo", "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", "Landroid/content/Context;").method.addInstructions(0, """
            new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
            const-string v1, "00000000-0000-0000-0000-000000000000"
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
            return-object v0
        """.trimIndent())
        Fingerprint(definingClass = "Lm1/i;", name = "y", returnType = "V", parameters = listOf("Ljava/util/Map;"), strings = listOf("%7E%7E00%7E%7E", "~~00~~")).uniqueMatch().method.addInstructions(0, "return-void")
        val rc = "Lcom/revenuecat/purchases/"
        listOf("getAutomaticDeviceIdentifierCollectionEnabled", "getDiagnosticsEnabled").forEach { disabled("${rc}PurchasesConfiguration;", it) }
        stop("${rc}PurchasesOrchestrator;", "setFirebaseAppInstanceID", "Ljava/lang/String;")
        stop("${rc}PurchasesOrchestrator;", "setAttributes", "Ljava/util/Map;")
        stop("${rc}subscriberattributes/SubscriberAttributesManager;", "collectDeviceIdentifiers", "Ljava/lang/String;", "Landroid/app/Application;")
        stop("${rc}common/events/EventsManager;", "track", "${rc}common/events/FeatureEvent;")
        stop("${rc}common/events/EventsManager;", "flushEvents", "${rc}common/Delay;")
        stop("${rc}common/events/EventsManager;", "flushLegacyEvents")
        stop("${rc}common/events/EventsManager;", "performPriorityFlush")
        stop("${rc}common/diagnostics/DiagnosticsSynchronizer;", "syncDiagnosticsFileIfNeeded")
        stop("${rc}common/diagnostics/DiagnosticsSynchronizer;", "syncDiagnosticsFileIfBigEnough")
        stop("${rc}common/diagnostics/DiagnosticsTracker;", "trackEvent", "${rc}common/diagnostics/DiagnosticsEntry;")
        stop("${rc}common/diagnostics/DiagnosticsTracker;", "trackEventInCurrentThread\$purchases_defaultsBc8Release", "${rc}common/diagnostics/DiagnosticsEntry;")
        Fingerprint(definingClass = "${rc}subscriberattributes/caching/SubscriberAttributesCache;", name = "getUnsyncedSubscriberAttributes", returnType = "Ljava/util/Map;").matchAll(2..2).forEach {
            it.method.addInstructions(0, "invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;\nmove-result-object v0\nreturn-object v0")
        }
        installWebRequestPolicy(WebControl.Tracking)
    }
}

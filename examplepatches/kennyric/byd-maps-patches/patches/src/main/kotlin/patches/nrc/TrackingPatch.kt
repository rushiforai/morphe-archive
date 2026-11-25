package patches.nrc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            check(applications.length == 1) { "Expected one NRC application" }
            val application = applications.item(0)
            for ((name, value) in mapOf("firebase_analytics_collection_deactivated" to "true", "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true", "delivery_metrics_exported_to_big_query_enabled" to "false")) {
                val nodes = doc.getElementsByTagName("meta-data")
                check((0 until nodes.length).none { (nodes.item(it) as Element).getAttribute("android:name") == name }) { "NRC collection metadata already present: $name" }
                application.appendChild(doc.createElement("meta-data").apply {
                    setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", name)
                    setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", value)
                })
            }
            for (name in listOf("com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_AD_ID", "android.permission.ACCESS_ADSERVICES_ATTRIBUTION")) {
                val nodes = doc.getElementsByTagName("uses-permission")
                val matches = (0 until nodes.length).map { nodes.item(it) as Element }.filter { it.getAttribute("android:name") == name }
                check(matches.size == 1) { "Expected one NRC advertising permission $name, found ${matches.size}" }
                matches.single().let { it.parentNode.removeChild(it) }
            }
        }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Disables inventoried native/web collectors, analytics-only partner/heartbeat/profile launchers, queued Firebase exports and advertising IDs while retaining session refresh, account, media and notification state.") {
    compatibleWith(nrc)
    dependsOn(originalInput, hideAds, trackingResources)
    execute {
        val sinks = mapOf(
            "${TRACK}AnalyticsTrackerImpl;" to listOf("trackEvent(Lnl/pinch/nrc/analytics/event/NRCAnalyticsEvent;)V"),
            "${TRACK}FirebaseAnalyticsTracker;" to listOf("logEvent(Lnl/pinch/nrc/analytics/event/FirebaseEvent;Z)V", "setUserId(Ljava/lang/String;)V", "setUserProperty(Ljava/lang/String;Ljava/lang/String;)V", "setDefaultEventParameters(Ljava/util/Map;)V", "clearUserId()V"),
            "${TRACK}ComScoreTracker;" to listOf("a()V", "logEvent()V", "setAnalyticsProperty(Lnl/pinch/nrc/analytics/properties/NmoProperty;)V"),
            "${TRACK}ChartBeatTracker;" to listOf("a()V", "logEvent(Lnl/pinch/nrc/analytics/event/ChartBeatEvent;)V"),
            "${TRACK}ParselyTracker;" to listOf("logEvent(Lnl/pinch/nrc/analytics/event/ParselyEvent;Ljava/util/Map;)V", "setAnalyticsProperty(Lnl/pinch/nrc/analytics/properties/ParselyProperty;)V", "flush()V", "stopEngagement()V"),
            WEB to listOf("loadWebViewTrackers(Landroid/webkit/WebView;)V"),
            "${SERVICE}AttentionTimeService;" to listOf("a(Ljava/lang/String;J)V"),
            "${SERVICE}CxenseSegmentService;" to listOf("f(Lcom/mediahuis/oneapps/sharedsdk/model/core/UserData;)V"),
            "${SERVICE}CxenseUserDataSyncService;" to listOf("b(Lcom/mediahuis/oneapps/sharedsdk/model/core/UserData;)V"),
            "Lcom/google/firebase/perf/transport/TransportManager;" to listOf("u(Lcom/google/firebase/perf/v1/PerfMetric\$Builder;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V"),
            "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;" to listOf("recordException(Ljava/lang/Throwable;)V", "sendUnsentReports()V"),
            "Lpinch/nrcnext/logging/CrashlyticsTree;" to listOf("log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V"),
            "Lcom/google/firebase/messaging/MessagingAnalytics;" to listOf("v(Lcom/google/firebase/messaging/reporting/MessagingClientEvent\$Event;Landroid/content/Intent;Lcom/google/android/datatransport/TransportFactory;)V", "w(Ljava/lang/String;Landroid/os/Bundle;)V", "y(Landroid/os/Bundle;)V"),
        )
        // Fields, constructors and getters remain real. In particular, Parsely's
        // direct engagement consumers must not query an uninitialized singleton.
        sinks.forEach { (cls, signatures) -> signatures.forEach { change(cls, it, STOP) } }
        val falseMethods = mapOf(
            "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;" to listOf("isAutomaticDataCollectionEnabled()Z"),
            "Lcom/google/firebase/perf/FirebasePerformance;" to listOf("isPerformanceCollectionEnabled()Z"),
            "Lcom/google/firebase/messaging/MessagingAnalytics;" to listOf("a()Z", "shouldUploadFirelogAnalytics(Landroid/content/Intent;)Z", "shouldUploadScionMetrics(Landroid/content/Intent;)Z", "shouldUploadScionMetrics(Landroid/os/Bundle;)Z"),
        )
        falseMethods.forEach { (cls, signatures) -> signatures.forEach { change(cls, it, FALSE) } }
        change("${TRACK}MediahuisAnalyticsTracker;", "logEvent(Lnl/pinch/nrc/analytics/event/MediahuisEvent;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", UNIT)
        // This factory contains analytics partners only; functional device UUID,
        // session, stored settings, consent state and getters are initialized by
        // the untouched TrackingService constructor around this call.
        change("${SERVICE}TrackingService;", "d(Lcom/mediahuis/oneapps/sharedsdk/core/model/AppInfo;Lcom/mediahuis/oneapps/sharedsdk/core/model/BrandInfo;Lcom/mediahuis/oneapps/sharedsdk/helper/IDeviceInformation;)Ljava/util/List;", """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)
        val parsely = exact("${TRACK}ParselyTracker;", "<init>", "V", "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;").method
        val initializers = parsely.implementation!!.instructions.withIndex().filter { (_, insn) ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Lcom/parsely/parselyandroid/ParselyTracker\$Companion;" && it.name == "init\$default" && it.returnType == "V" &&
                    it.parameterTypes == listOf("Lcom/parsely/parselyandroid/ParselyTracker\$Companion;", "Ljava/lang/String;", "I", "Landroid/content/Context;", "Z", "I", "Ljava/lang/Object;")
            } == true
        }
        check(initializers.size == 1) { "Expected one NRC Parsely initializer, found ${initializers.size}" }
        parsely.removeInstruction(initializers.single().index)
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCrashlyticsCollectionEnabled", "V", "Z").method.addInstructions(0, "const/4 p1, 0x0")
        change("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", """
            new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
            const-string v1, "00000000-0000-0000-0000-000000000000"
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
            return-object v0
        """)
        enable("Tracking")
    }
}

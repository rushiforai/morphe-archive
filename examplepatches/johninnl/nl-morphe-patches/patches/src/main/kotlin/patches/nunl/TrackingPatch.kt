package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            fun elements(tag: String): List<Element> {
                val nodes = doc.getElementsByTagName(tag)
                return (0 until nodes.length).map { nodes.item(it) as Element }
            }
            val application = elements("application").single()
            fun flag(name: String, value: Boolean) {
                val found = elements("meta-data").filter { it.getAttribute("android:name") == name }
                check(found.size <= 1) { "Duplicate NU.nl collection flag $name" }
                val element = found.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID,"android:name",name); application.appendChild(it)
                }
                element.setAttributeNS(ANDROID,"android:value",value.toString())
            }
            flag("firebase_analytics_collection_deactivated", true)
            flag("firebase_performance_collection_deactivated", true)
            flag("firebase_analytics_collection_enabled", false)
            flag("google_analytics_automatic_screen_reporting_enabled", false)
            flag("google_analytics_adid_collection_enabled", false)
            flag("google_analytics_sgtm_upload_enabled", false)
            flag("google_analytics_default_allow_analytics_storage", false)
            flag("google_analytics_default_allow_ad_storage", false)
            flag("google_analytics_default_allow_ad_user_data", false)
            flag("google_analytics_default_allow_ad_personalization_signals", false)
            flag("firebase_crashlytics_collection_enabled", false)
            flag("firebase_sessions_enabled", false)
            flag("firebase_performance_collection_enabled", false)
            flag("firebase_performance_logcat_enabled", false)
            flag("delivery_metrics_exported_to_big_query_enabled", false)
            listOf("com.google.android.gms.ads.AdService", "com.google.android.gms.measurement.AppMeasurementReceiver",
                "com.google.android.gms.measurement.AppMeasurementService", "com.google.android.gms.measurement.AppMeasurementJobService",
                "com.google.android.gms.tagmanager.TagManagerService", "com.google.android.gms.tagmanager.TagManagerPreviewActivity").forEach {
                doc.one(it).setAttributeNS(ANDROID,"android:enabled","false")
            }
            val registrar = doc.one("com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar")
            registrar.parentNode.removeChild(registrar)
            val permissions = elements("uses-permission").filter {
                val n = it.getAttribute("android:name")
                n == "com.google.android.gms.permission.AD_ID" || n == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    n == "android.permission.AD_SERVICES_CONFIG" || n.startsWith("android.permission.ACCESS_ADSERVICES_")
            }
            check(permissions.size == 6) { "Expected six NU.nl advertising permissions, found ${permissions.size}" }
            permissions.forEach { it.parentNode.removeChild(it) }
        }
        check(listApkEntries("assets/").contains("assets/containers/GTM-WHQHCXT.json")) { "Missing NU.nl GTM container" }
        delete("assets/containers/GTM-WHQHCXT.json")
        val path = "assets/jwplayer/jwpsrv.js"
        val file = get(path)
        val script = file.readText()
        val sink = "function Oe(e,a){var t=new Image;t.src=a;"
        check(script.windowed(sink.length).count { it == sink } == 1) { "NU.nl JWPlayer pixel sender changed" }
        file.writeText(script.replace(sink, "function Oe(e,a){return;var t=new Image;t.src=a;"))
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables inventoried native/media collectors, persistent UDS and user-profile identifiers, queued push statistics and known WebView collectors; retains BFF local state, content, login and notification forwarding.",
) {
    dependsOn(originalInput)
    compatibleWith(nunl)
    dependsOn(hideAds, trackingResources)
    execute {
        exact("Lnl/nu/android/tracking/engine/sdks/firebase/FirebaseTracker;", "trackEvent", "V", "Ljava/lang/String;", "Landroid/os/Bundle;").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/sac/SacSnowplowTracker;", "send", "V", "Lnl/sanomamedia/android/nu/analytics/skit/events/Event;", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/trackingsdk/TrackingSDKInitializer;", "onApplicationCreate", "V").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/trackingsdk/TrackingSDKInitializer;", "configureSDK", "V").method.addInstructions(0, "return-void")
        exact("Lbe/persgroep/tracking/TrackingSDK;", "track", "V", "Lbe/persgroep/tracking/base/model/TrackingEvent;").method.addInstructions(0, "return-void")
        exact("Lbe/persgroep/advertising/userprofile/config/InitConfigHandler;", "initialize", "V").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/nobo/NoboSdkInitializer;", "initNoboSDK", "V").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/nobo/NoboTracker;", "track", "V", "Lnl/nu/performance/api/client/objects/NoboEvent;").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/analytics/log/NoboLogger;", "send", "V", "Lnl/sanomamedia/android/nu/analytics/skit/events/Event;").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/usabilla/UsabillaTracker;", "init", "V").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/usabilla/UsabillaTracker;", "performSendEvent\$tracking", "V", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/usabilla/QueuedEventSender;", "sendEvent", "V", "Ljava/lang/Object;").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/tracking/engine/sdks/HttpTracker;", "track", "V", "Lnl/nu/performance/api/client/objects/HttpEvent;").method.addInstructions(0, "return-void")
        preserveOnboardingAcknowledgements()
        exact("Lnl/nu/android/push/tracking/TrackingEventBroadcastReceiver;", "trackEvents", "V", "Landroid/content/Intent;").method.addInstructions(0, "return-void")
        exact("Lnet/persgroep/pipoidcsdk/client/telemetry/TelemetryClient;", "register", "V", "Lnet/persgroep/pipoidcsdk/client/telemetry/MetricType;", "Ljava/lang/String;", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient;", "sendErrorMetric\$privacygatesdk_release", "V", "Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;", "Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/timber/CrashReportingTree;", "log", "V", "I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/perf/transport/TransportManager;", "dispatchLog", "V", "Lcom/google/firebase/perf/v1/PerfMetric;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/messaging/MessagingAnalytics;", "logToScion", "V", "Ljava/lang/String;", "Landroid/os/Bundle;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/messaging/MessagingAnalytics;", "logToFirelog", "V", "Lcom/google/firebase/messaging/reporting/MessagingClientEvent\$Event;", "Landroid/content/Intent;", "Lcom/google/android/datatransport/TransportFactory;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/messaging/MessagingAnalytics;", "setUserPropertyIfRequired", "V", "Landroid/os/Bundle;").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/analytics/skit/Engine;", "dispatch", "V").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/analytics/skit/Engine;", "send", "V", "Lnl/sanomamedia/android/nu/analytics/skit/events/Event;").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/analytics/skit/Engine;", "send", "V", "Lnl/sanomamedia/android/nu/analytics/skit/events/Event;", "Z").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/analytics/skit/Engine;", "sendEventToBackend", "V", "Lnl/sanomamedia/android/nu/analytics/skit/events/Event;", "Lnl/sanomamedia/android/nu/analytics/skit/BackendBase;").method.addInstructions(0, "return-void")
        exact("Lnl/sanomamedia/android/nu/analytics/skit/Engine;", "sendEventToBackend", "V", "Lnl/sanomamedia/android/nu/analytics/skit/events/Event;", "Lnl/sanomamedia/android/nu/analytics/skit/BackendBase;", "Z").method.addInstructions(0, "return-void")
        exact("Lcom/mondriaan/dpns/client/android/DPNSDeliveryStatisticsManager;", "sendDeliveryStatistics", "V", "Landroid/content/Context;", "Lcom/mondriaan/dpns/client/android/DPNSGlobalPreferences;", "Ljava/lang/Long;", "Lcom/mondriaan/dpns/client/android/DPNSDeliveryStatisticsEvent;").method.addInstructions(0, "return-void")
        exact("Lcom/mondriaan/dpns/client/android/DPNSDeliveryStatisticsManager;", "scheduleDelivery", "V", "Landroid/content/Context;", "Lcom/mondriaan/dpns/client/android/DPNSGlobalPreferences;", "Z").method.addInstructions(0, "return-void")
        exact("Lcom/mondriaan/dpns/client/android/DPNSDeliveryStatisticsManager;", "sendPendingDeliveryStatistics", "V", "Landroid/content/Context;", "Lcom/mondriaan/dpns/client/android/DPNSGlobalPreferences;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "log", "V", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "recordException", "V", "Ljava/lang/Throwable;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "recordException", "V", "Ljava/lang/Throwable;", "Lcom/google/firebase/crashlytics/CustomKeysAndValues;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "sendUnsentReports", "V").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setUserId", "V", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKeys", "V", "Lcom/google/firebase/crashlytics/CustomKeysAndValues;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey", "V", "Ljava/lang/String;", "D").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey", "V", "Ljava/lang/String;", "F").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey", "V", "Ljava/lang/String;", "I").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey", "V", "Ljava/lang/String;", "J").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey", "V", "Ljava/lang/String;", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey", "V", "Ljava/lang/String;", "Z").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/analytics/FirebaseAnalytics;", "logEvent", "V", "Ljava/lang/String;", "Landroid/os/Bundle;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setCurrentScreen", "V", "Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setUserId", "V", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setUserProperty", "V", "Ljava/lang/String;", "Ljava/lang/String;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setDefaultEventParameters", "V", "Landroid/os/Bundle;").method.addInstructions(0, "return-void")
        exact("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;", "isAutomaticDataCollectionEnabled", "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/google/firebase/perf/config/ConfigResolver;", "isPerformanceMonitoringEnabled", "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/google/firebase/sessions/settings/SessionsSettings;", "getSessionsEnabled", "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/google/firebase/messaging/MessagingAnalytics;", "deliveryMetricsExportToBigQueryEnabled", "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lnl/nu/android/tracking/userprofilesdk/UserProfileRepositoryInitializer;", "onActivityCreateParallel", "Ljava/lang/Object;", "Lkotlinx/coroutines/CoroutineScope;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0")
        exact("Lnet/persgroep/pipoidcsdk/client/telemetry/TelemetryClient;", "init", "Ljava/lang/Object;", "Lnet/persgroep/pipoidcsdk/client/telemetry/Meta;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0")
        exact("Lcom/google/firebase/sessions/settings/RemoteSettings;", "updateSettings", "Ljava/lang/Object;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0")
        exact("Lnl/nu/android/network/modifiers/UDSTokenHeaderModifier;", "getValue", "Ljava/lang/String;").method.addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
        exact("Lnl/nu/android/configurations/UserDataStoreTokenProvider;", "getUdsToken", "Ljava/lang/Object;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
        exact("Lnl/nu/android/tracking/userprofilesdk/UserProfileIdProvider;", "getAllIds", "Ljava/util/Map;").method.addInstructions(0, "invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;\nmove-result-object v0\nreturn-object v0")
        exact("Lbe/persgroep/advertising/banner/xandr/service/BrandMetricsService;", "call", "Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        installWebRequestPolicy(tracking = true)
    }
}

/** The first-party acknowledgement persists which onboarding cards were shown.
 * Only these three measured canonical payloads pass; analytics and unknown
 * BFF mutations stop before the original dispatcher collects or sends them. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun preserveOnboardingAcknowledgements() {
    val engine = "${APP}tracking/engine/TrackingEngineImpl;"
    val event = "${OBJECTS}BFFEvent;"
    val entry = exact(engine,"trackBFFEvent","V",event)
    val name = "morpheFunctionalOnboardingEvent"
    check(entry.classDef.methods.none { it.name == name }) { "Duplicate NU.nl functional-event guard" }
    entry.classDef.methods.add(helper(engine,name,"Z",listOf(event),2,"""
        if-eqz p0, :deny
        invoke-virtual {p0}, $event->getEventType()Ljava/lang/String;
        move-result-object v0
        const-string v1, "wncCardShownEvent"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :deny
        invoke-virtual {p0}, $event->getData()Ljava/lang/String;
        move-result-object v0
        const-string v1, "ImJyZWFraW5nTmV3cyI="
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :allow
        const-string v1, "InByb21vdGVMb2dpbiI="
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :allow
        const-string v1, "ImZvbGxvd1RvcGljcyI="
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-nez v1, :allow
        :deny
        const/4 v0, 0x0
        return v0
        :allow
        const/4 v0, 0x1
        return v0
    """))
    entry.method.addInstructionsWithLabels(0,"""
        invoke-static {p1}, $engine->$name($event)Z
        move-result v0
        if-nez v0, :functional_acknowledgement
        return-void
    """.trimIndent(),ExternalLabel("functional_acknowledgement",entry.method.getInstruction(0)))
}

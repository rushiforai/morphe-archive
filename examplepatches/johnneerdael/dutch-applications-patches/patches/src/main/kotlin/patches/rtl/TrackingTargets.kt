package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode

private data class TrackingGate(val owner: String, val signature: String,
    val flags: Int, val registers: Int, val count: Int, val body: String)

// Exact shipped boundaries; initialized functional SDK services remain intact.
private val basicGates = listOf(
    TrackingGate("Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient;", "sendErrorMetric\$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V", 0x11, 11, 22, "return-void"),
    TrackingGate("Lbe/persgroep/advertising/userprofile/IdManager;", "getUserIdsWithoutPrivacyCheck()Ljava/util/Map;", 0x1, 5, 35, "sget-object v0, Lpw3;->h:Lpw3;\nreturn-object v0"),
    TrackingGate("Lbe/persgroep/advertising/userprofile/IdManager;", "setExternalUserIds(Ljava/util/Map;)V", 0x1, 3, 14, "return-void"),
    TrackingGate("Lbe/persgroep/advertising/userprofile/base/device/DeviceInfo;", "advertisingId(Landroid/content/Context;)Ljava/lang/String;", 0x11, 6, 33, "const-string v0, \"\"\nreturn-object v0"),
    TrackingGate("Lbe/persgroep/advertising/userprofile/base/device/DeviceInfo;", "appSetId(Landroid/content/Context;Lui2;)Ljava/lang/Object;", 0x11, 5, 28, "const-string v0, \"\"\nreturn-object v0"),
    TrackingGate("Lbe/persgroep/advertising/userprofile/base/device/DeviceInfo;", "deviceId(Landroid/content/Context;)Ljava/lang/String;", 0x11, 2, 9, "const-string v0, \"\"\nreturn-object v0"),
    TrackingGate("Lbe/persgroep/advertising/userprofile/base/provider/DeviceInfoProvider;", "provideAllUserProfileIds(Lui2;)Ljava/lang/Object;", 0x11, 12, 92, "sget-object v0, Lpw3;->h:Lpw3;\nreturn-object v0"),
    TrackingGate("Lced;", "a(Lui2;)Ljava/lang/Object;", 0x11, 11, 155, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;", "configureAnalytics(Lcom/bitmovin/player/api/Player;Landroid/content/Context;Lcom/bitmovin/player/api/analytics/AnalyticsPlayerConfig;)Lcom/bitmovin/player/api/Player;", 0x19, 12, 44, "return-object p0"),
    TrackingGate("Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;", "configureAnalytics(Lcom/bitmovin/player/api/source/Source;Lcom/bitmovin/player/api/analytics/AnalyticsSourceConfig;)Lcom/bitmovin/player/api/source/Source;", 0x19, 3, 12, "return-object p0"),
    TrackingGate("Lcom/google/firebase/analytics/FirebaseAnalytics;", "getAppInstanceId()Lodc;", 0x1, 5, 18, "const/4 v0, 0x0\ninvoke-static {v0}, Lzdc;->P(Ljava/lang/Object;)Lwui;\nmove-result-object v0\nreturn-object v0"),
    TrackingGate("Lcom/google/firebase/analytics/FirebaseAnalytics;", "logEvent(Ljava/lang/String;Landroid/os/Bundle;)V", 0x1, 12, 13, "return-void"),
    TrackingGate("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setAnalyticsCollectionEnabled(Z)V", 0x1, 3, 8, "const/4 p1, 0x0"),
    TrackingGate("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setUserId(Ljava/lang/String;)V", 0x1, 4, 7, "return-void"),
    TrackingGate("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setUserProperty(Ljava/lang/String;Ljava/lang/String;)V", 0x1, 9, 10, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "log(Ljava/lang/String;)V", 0x1, 2, 3, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "recordException(Ljava/lang/Throwable;)V", 0x1, 3, 10, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "recordException(Ljava/lang/Throwable;Lcom/google/firebase/crashlytics/CustomKeysAndValues;)V", 0x1, 3, 10, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey(Ljava/lang/String;D)V", 0x1, 4, 5, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey(Ljava/lang/String;F)V", 0x1, 3, 5, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey(Ljava/lang/String;I)V", 0x1, 3, 5, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey(Ljava/lang/String;J)V", 0x1, 4, 5, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey(Ljava/lang/String;Ljava/lang/String;)V", 0x1, 3, 3, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKey(Ljava/lang/String;Z)V", 0x1, 3, 5, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setCustomKeys(Lcom/google/firebase/crashlytics/CustomKeysAndValues;)V", 0x1, 2, 4, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setUserId(Ljava/lang/String;)V", 0x1, 2, 3, "return-void"),
    TrackingGate("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;", "isAutomaticDataCollectionEnabled()Z", 0x20001, 2, 15, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;", "setCrashlyticsDataCollectionEnabled(Ljava/lang/Boolean;)V", 0x20001, 5, 45, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"),
    TrackingGate("Lcom/google/firebase/crashlytics/internal/settings/DefaultSettingsSpiCall;", "invoke(Lcom/google/firebase/crashlytics/internal/settings/SettingsRequest;Z)Lorg/json/JSONObject;", 0x1, 8, 39, "const/4 v0, 0x0\nreturn-object v0"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "deliveryMetricsExportToBigQueryEnabled()Z", 0x9, 6, 40, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "logToFirelog(Lcom/google/firebase/messaging/reporting/MessagingClientEvent\$Event;Landroid/content/Intent;La0d;)V", 0xa, 8, 46, "return-void"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "logToScion(Ljava/lang/String;Landroid/os/Bundle;)V", 0x9, 6, 100, "return-void"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "setDeliveryMetricsExportToBigQuery(Z)V", 0x9, 4, 15, "const/4 p0, 0x0"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "shouldUploadFirelogAnalytics(Landroid/content/Intent;)Z", 0x9, 1, 10, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "shouldUploadScionMetrics(Landroid/content/Intent;)Z", 0x9, 2, 12, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/messaging/MessagingAnalytics;", "shouldUploadScionMetrics(Landroid/os/Bundle;)Z", 0x9, 2, 10, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/perf/FirebasePerformance;", "isPerformanceCollectionEnabled()Z", 0x1, 1, 10, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/perf/FirebasePerformance;", "setPerformanceCollectionEnabled(Ljava/lang/Boolean;)V", 0x20001, 3, 47, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"),
    TrackingGate("Lcom/google/firebase/perf/FirebasePerformance;", "setPerformanceCollectionEnabled(Z)V", 0x1, 2, 4, "const/4 p1, 0x0"),
    TrackingGate("Lcom/google/firebase/perf/config/ConfigResolver;", "getIsPerformanceCollectionDeactivated()Ljava/lang/Boolean;", 0x1, 3, 14, "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\nreturn-object v0"),
    TrackingGate("Lcom/google/firebase/perf/config/ConfigResolver;", "isPerformanceMonitoringEnabled()Z", 0x1, 3, 13, "const/4 v0, 0x0\nreturn v0"),
    TrackingGate("Lcom/google/firebase/perf/config/RemoteConfigManager;", "triggerFirebaseRemoteConfigFetchAndActivateOnSuccessfulFetch()V", 0x2, 4, 15, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/FlgTransport;", "log(Lcom/google/firebase/perf/v1/PerfMetric;)V", 0x1, 5, 18, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "dispatchLog(Lcom/google/firebase/perf/v1/PerfMetric;)V", 0x2, 5, 25, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "log(Lcom/google/firebase/perf/v1/GaugeMetric;)V", 0x1, 3, 3, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "log(Lcom/google/firebase/perf/v1/GaugeMetric;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 0x1, 6, 6, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "log(Lcom/google/firebase/perf/v1/NetworkRequestMetric;)V", 0x1, 3, 3, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "log(Lcom/google/firebase/perf/v1/NetworkRequestMetric;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 0x1, 6, 6, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "log(Lcom/google/firebase/perf/v1/TraceMetric;)V", 0x1, 3, 3, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "log(Lcom/google/firebase/perf/v1/TraceMetric;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 0x1, 6, 6, "return-void"),
    TrackingGate("Lcom/google/firebase/perf/transport/TransportManager;", "syncLog(Lcom/google/firebase/perf/v1/PerfMetric\$Builder;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 0x2, 6, 28, "return-void"),
    TrackingGate("Lcom/google/firebase/sessions/SessionFirelogPublisherImpl;", "attemptLoggingSessionEvent(Lcom/google/firebase/sessions/SessionEvent;)V", 0x12, 3, 10, "return-void"),
    TrackingGate("Lcom/google/firebase/sessions/SessionFirelogPublisherImpl;", "mayLogSession(Lcom/google/firebase/sessions/SessionDetails;)V", 0x1, 5, 10, "return-void"),
    TrackingGate("Lcom/google/firebase/sessions/SessionFirelogPublisherImpl;", "shouldLogSession(Lui2;)Ljava/lang/Object;", 0x12, 8, 87, "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0"),
    TrackingGate("Lcom/google/firebase/sessions/settings/RemoteSettings;", "updateSettings(Lui2;)Ljava/lang/Object;", 0x1, 16, 157, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lcom/snowplowanalytics/snowplow/configuration/FocalMeterConfiguration;", "makeRequest(Ljava/lang/String;)V", 0x12, 10, 84, "return-void"),
    TrackingGate("Lcom/snowplowanalytics/snowplow/network/OkHttpNetworkConnection;", "requestSender(Luha;)I", 0x12, 6, 37, "const/4 v0, -0x1\nreturn v0"),
    TrackingGate("Lcom/swrve/sdk/SwrveBase;", "event(Ljava/lang/String;)V", 0x1, 9, 27, "return-void"),
    TrackingGate("Lcom/swrve/sdk/SwrveBase;", "event(Ljava/lang/String;Ljava/util/Map;)V", 0x1, 10, 30, "return-void"),
    TrackingGate("Lcom/swrve/sdk/SwrveBase;", "queueMessageClickEvent(Lcom/swrve/sdk/messaging/SwrveButton;JLjava/lang/String;)V", 0x1, 14, 73, "return-void"),
    TrackingGate("Lcom/swrve/sdk/SwrveBase;", "queueMessageImpressionEvent(ILjava/lang/String;)V", 0x1, 11, 41, "return-void"),
    TrackingGate("Lcom/usabilla/sdk/ubform/Usabilla;", "sendEvent(Landroid/content/Context;Ljava/lang/String;)V", 0x11, 6, 15, "return-void"),
    TrackingGate("Lcom/usabilla/sdk/ubform/Usabilla;", "setCustomVariables(Ljava/util/Map;)V", 0x11, 5, 16, "return-void"),
    TrackingGate("Ldze;", "p3()Z", 0x11, 2, 14, "const/4 v0, 0x1\nreturn v0"),
    TrackingGate("Lfob;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 19, 152, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lfrb;", "a(Lzj;)V", 0x11, 5, 15, "return-void"),
    TrackingGate("Lfrb;", "b(Lfrb;Z)V", 0x19, 13, 53, "return-void"),
    TrackingGate("Lfrb;", "c(Lfrb;Z)V", 0x19, 13, 61, "return-void"),
    TrackingGate("Lgob;", "a(Lzj;)V", 0x11, 16, 94, "return-void"),
    TrackingGate("Lkf4;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 5, 41, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lnf4;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 9, 62, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lnl/rtl/videoplayer/analytics/SmartOctoSessionTracker;", "trackEvent(Lui2;)Ljava/lang/Object;", 0x12, 15, 85, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lnl/rtl/videoplayer/analytics/smartocto/SmartOctoSessionConsumer;", "trackEvent()V", 0x12, 5, 18, "return-void"),
    TrackingGate("Lof4;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 9, 93, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lqdd;", "a(Ladd;)V", 0x11, 5, 15, "return-void"),
    TrackingGate("Lrf4;", "a(Lzj;)V", 0x11, 3, 4, "return-void"),
    TrackingGate("Lrf4;", "b(Lrf4;Lzj;Lwi2;)Ljava/lang/Object;", 0x19, 7, 66, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lrf4;", "c(Lwi2;)Ljava/lang/Object;", 0x11, 7, 59, "const-string v0, \"\"\nreturn-object v0"),
    TrackingGate("Lrf4;", "d(Lrf4;Ljava/lang/StringBuilder;Lj;Lwi2;)Ljava/lang/Object;", 0x19, 12, 116, "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"),
    TrackingGate("Lrf4;", "e()V", 0x11, 6, 19, "return-void"),
    TrackingGate("Lry5;", "getUserIdsWithoutPrivacyCheck()Ljava/util/Map;", 0x11, 6, 33, "sget-object v0, Lpw3;->h:Lpw3;\nreturn-object v0"),
    TrackingGate("Lvl;", "a(Lzj;)V", 0x11, 5, 29, "return-void"),
    TrackingGate("Lnl/rtl/videoplayer/data/LoadDataRepository;", "loadLabels(Ljava/lang/String;Lui2;)Ljava/lang/Object;", 0x11, 7, 42, "sget-object v0, Lpw3;->h:Lpw3;\nreturn-object v0"),
)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyBasicTrackingGates() {
    for (gate in basicGates) {
        val method = exact(gate.owner, gate.signature).method
        val count = method.instructions.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
            Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) }
        check(method.accessFlags == gate.flags && method.implementation!!.registerCount == gate.registers &&
            count == gate.count) { "RTL tracking contract changed: ${gate.owner}->${gate.signature}" }
        method.addInstructions(0, gate.body)
    }
}

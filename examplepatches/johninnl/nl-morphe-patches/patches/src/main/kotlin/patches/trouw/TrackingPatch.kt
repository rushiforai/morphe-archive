package patches.trouw

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Suppresses native analytics collectors and queued uploads, advertising identifiers, ContentSquare/Heap WebView instrumentation and known web collector requests while preserving content, account and push.") {
    dependsOn(originalInput)
    compatibleWith(trouw)
    dependsOn(hideAds, trackingResources)
    execute {
        // FIAM registrars are absent: this callback-free SDK flag adapter must
        // not query a null optional component during MainViewModel startup.
        change("${APP}domain/messaging/SuppressFirebaseInAppMessagingUseCase;", "invoke(Z)V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl;", "sendPendingEvents()V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl;", "sendTrackingEvent(Lnl/persgroep/edition/feature/component/tracking/model/event/TrackingEvent;)V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl;", "track(Lnl/persgroep/edition/feature/component/tracking/model/event/TrackingEvent;)V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl;", "updateConsent(ZZ)V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/events/tracking/FirebaseTracker;", "trackEvent(Lnl/persgroep/edition/feature/component/tracking/model/event/FirebaseTrackingEvent;)V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/events/tracking/FirebaseTracker;", "updateConsent(Z)V", STOP)
        change("Lnl/persgroep/edition/application/startup/task/TrackingStartupTask;", "onStartup()V", STOP)
        change("Lnl/persgroep/edition/application/startup/task/CrashlyticsStartupTask;", "onStartup()V", STOP)
        change("Lnl/persgroep/edition/application/startup/task/UsabillaStartupTask;", "onStartup()V", STOP)
        change("Lbe/persgroep/tracking/TrackingSDK;", "track(Lbe/persgroep/tracking/base/model/TrackingEvent;)V", STOP)
        change("Lbe/persgroep/tracking/snowplow/SnowplowManager;", "track(Lcom/snowplowanalytics/snowplow/event/Event;Lbe/persgroep/tracking/base/model/TrackingResponse;)V", STOP)
        change("Lbe/persgroep/tracking/snowplow/SnowplowManager;", "track(Lbe/persgroep/tracking/snowplow/model/SnowplowEvent;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "addUserId()V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "optInAndReapplyEventProperties()V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "sendEvent(Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareEvent;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "sendScreenView(Lnl/persgroep/edition/tracking/contract/models/PageContext;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "syncPendingTracks()V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "updateUserIdentity(Z)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "onMarketingConsentUpdate(Z)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "trackEvent(Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareEvent;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker;", "trackScreenView(Lnl/persgroep/edition/tracking/contract/models/PageContext;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl;", "initializeCimSdk()V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl;", "track(Ljava/util/Map;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl;", "trackEvent(Ljava/util/Map;)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl;", "updateConsent(Z)V", STOP)
        change("Lnl/persgroep/edition/feature/component/tracking/domain/tracker/usabilla/UsabillaTracker;", "trackUsabillaEvent(Ljava/lang/String;)V", STOP)
        change("Lnl/persgroep/edition/domain/analytics/comscore/ComscoreEventTransmitter;", "execute(Ljava/util/Map;)V", STOP)
        change("Lcom/comscore/Analytics;", "notifyViewEvent(Ljava/util/LinkedHashMap;)V", STOP)
        change("Lnet/persgroep/marketingtemplatessdk/implementations/piano/CxenseManager;", "trackPageView(Ljava/lang/String;)V", STOP)
        change("Lbe/persgroep/advertising/userprofile/config/InitConfigHandler;", "initialize()V", STOP)
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "setExternalUserIds(Ljava/util/Map;)V", STOP)
        change("Lnl/persgroep/edition/domaindata/userprofile/data/UserProfileRepositoryImpl;", "updateUserIds()V", STOP)
        change("Lnl/dpgmedia/publishingservices/videosdk/internal/player/core/tracking/PlayerAnalyticsReducer;", "maybeDispatch(Lnl/dpgmedia/publishingservices/videosdk/core/analytics/VideoSdkAnalyticsDispatcher;Lnl/dpgmedia/publishingservices/videosdk/core/analytics/VideoSdkAnalyticsEvent;)V", STOP)
        change("Lnl/dpgmedia/publishingservices/videosdk/internal/player/core/tracking/PlayerCimReducer;", "maybeDispatch(Lnl/dpgmedia/publishingservices/videosdk/core/cim/VideoSdkCimEvent;)V", STOP)
        change("Lnet/persgroep/pipoidcsdk/client/telemetry/TelemetryClient;", "register(Lnet/persgroep/pipoidcsdk/client/telemetry/MetricType;Ljava/lang/String;Ljava/lang/String;)V", STOP)
        change("Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient;", "sendErrorMetric\$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V", STOP)
        change("Lcom/google/firebase/perf/transport/TransportManager;", "syncLog(Lcom/google/firebase/perf/v1/PerfMetric\$Builder;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", STOP)
        change("Lcom/facebook/appevents/AppEventsLoggerImpl;", "flush()V", STOP)
        change("Lcom/facebook/appevents/AppEventsLoggerImpl;", "logEvent(Ljava/lang/String;DLandroid/os/Bundle;)V", STOP)
        change("Lcom/facebook/appevents/AppEventsLoggerImpl;", "logEvent(Ljava/lang/String;Landroid/os/Bundle;)V", STOP)
        change("Lcom/facebook/appevents/AppEventsLoggerImpl;", "logEvent(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lcom/facebook/appevents/OperationalData;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "attemptUploaderStart()V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "addUserProperties(Ljava/util/Map;Ljava/util/Date;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "eventCommitted(Lcom/contentsquare/proto/unifiedanalytics/ingest/v1/UnifiedAnalyticsEnvelopeProtos\$Event;Lcom/contentsquare/proto/unifiedanalytics/ingest/v1/UnifiedAnalyticsEnvelopeProtos\$BatchHeader;Lcom/contentsquare/core/statemanager/model/SdkState;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "identify(Ljava/lang/String;Ljava/util/Date;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "startRecording(Ljava/util/Date;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "track(Ljava/lang/String;Ljava/util/Map;Ljava/util/Date;Lio/heap/core/api/plugin/model/SourceInfo;Lio/heap/core/api/plugin/model/Pageview;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "trackComponentTransition(Ljava/util/List;Ljava/util/List;Ljava/util/Date;Lio/heap/core/api/plugin/model/SourceInfo;Lio/heap/core/api/plugin/model/Pageview;Ljava/util/List;)V", STOP)
        change("Lio/heap/core/api/HeapApiImpl;", "trackNotificationInteraction(Lio/heap/core/api/model/NotificationInteractionProperties;Ljava/util/Date;Lio/heap/core/api/plugin/model/SourceInfo;)V", STOP)
        change("Lio/heap/core/web/v4/HeapJsWebViewIntegration;", "register(Landroid/webkit/WebView;Ljava/util/Set;)V", STOP)
        change("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;", "isAutomaticDataCollectionEnabled()Z", FALSE)
        change("Lnl/dpgmedia/publishingservices/videosdk/core/sdk/VideoSdkConfig;", "getTelemetryEnabled()Z", FALSE)
        change("Lnl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction;", "getEnableCimTracking()Z", FALSE)
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "getCachedUserIds()Ljava/util/Map;", EMPTY_MAP)
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "getUserIdsWithoutPrivacyCheck()Ljava/util/Map;", EMPTY_MAP)
        change("Lnl/dpgmedia/publishingservices/videosdk/internal/player/core/tracking/PlayerTelemetryDispatcher;", "dispatch-gIAlu-s(Lnl/dpgmedia/publishingservices/videosdk/core/telemetry/VideoSdkTelemetryEvent;[B)Ljava/lang/Object;", SUCCESS_UNIT)
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "fetch-IoAF18A(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "const-string v0, \"\"\ninvoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v0\nreturn-object v0")
        // Advertising IdManager fetch returns Result<String>, not Result<Unit>.
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "fetchUserIds()Lkotlinx/coroutines/Job;", """
            const/4 v0, 0x0
            invoke-static {v0}, Lkotlinx/coroutines/JobKt;->Job(Lkotlinx/coroutines/Job;)Lkotlinx/coroutines/CompletableJob;
            move-result-object v0
            invoke-interface {v0}, Lkotlinx/coroutines/CompletableJob;->complete()Z
            return-object v0
        """)
        change("Lcom/contentsquare/android/internal/features/webviewbridge/WebViewTrackingManager;", "a(Landroid/webkit/WebView;Lcom/contentsquare/android/api/bridge/xpf/XpfWebViewIdProvider;Lcom/contentsquare/android/api/csq/CsqWebViewApi;)V", STOP)
        change("Lio/piano/android/cxense/SendTask;", "sendConversionEvents\$sdk_release(Ljava/util/List;)V", "const/4 v0, 0x0\ninvoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;\nreturn-void")
        change("Lio/piano/android/cxense/SendTask;", "sendDmpEventsViaApi\$sdk_release(Ljava/util/List;)V", "const/4 v0, 0x0\ninvoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;\nreturn-void")
        change("Lio/piano/android/cxense/SendTask;", "sendDmpEventsViaPersisted\$sdk_release(Ljava/util/List;)V", "const/4 v0, 0x0\ninvoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;\nreturn-void")
        change("Lio/piano/android/cxense/SendTask;", "sendPageViewEvents\$sdk_release(Ljava/util/List;)V", "const/4 v0, 0x0\ninvoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;\nreturn-void")
        // Preserve readiness: consumers await this deferred even when analytics is off.
        change("${APP}application/startup/task/ContentsquareStartupTask;", "onStartup()V", """
            iget-object v0, p0, ${APP}application/startup/task/ContentsquareStartupTask;->contentsquareStartupListener:${APP}feature/component/tracking/domain/tracker/contentsquare/ContentsquareStartupListener;
            invoke-virtual {v0}, ${APP}feature/component/tracking/domain/tracker/contentsquare/ContentsquareStartupListener;->onCSQStartupCompleted()V
            return-void
        """)
        change("${APP}injection/AnalyticsModule\$Companion;", "provideCimTracker(Landroid/content/Context;Lnl/persgroep/common/DpgBrand;)Lnl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTracker;", """
            new-instance v0, ${APP}feature/component/tracking/domain/tracker/cim/CimTrackerNoop;
            invoke-direct {v0}, ${APP}feature/component/tracking/domain/tracker/cim/CimTrackerNoop;-><init>()V
            return-object v0
        """)
        change("Lcom/google/firebase/messaging/ByteStreams;", "logNotificationReceived(Landroid/content/Intent;)V", STOP)
        change("Lcom/google/firebase/messaging/ByteStreams;", "logToScion(Landroid/os/Bundle;Ljava/lang/String;)V", STOP)
        change("Lcom/google/firebase/messaging/ByteStreams;", "shouldUploadScionMetrics(Landroid/content/Intent;)Z", FALSE)
        change("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", """
            new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
            const-string v1, "00000000-0000-0000-0000-000000000000"
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
            return-object v0
        """)
        change("Lcom/google/firebase/messaging/ByteStreams;", "deliveryMetricsExportToBigQueryEnabled()Z", FALSE)
        change("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "recordException(Ljava/lang/Throwable;)V", STOP)
        change("Lcom/comscore/util/setup/Setup;", "setUp()V", STOP)
        // Prevent native automatic/lifecycle ingress and offline-cache uploads.
        // These callback-free JNI sinks have no implementation to prepend to.
        val nativeSignatures = listOf("flushOfflineCacheNative()V", "notifyDistributedContentViewEventNative(Ljava/lang/String;Ljava/lang/String;)V",
            "notifyEnterForegroundNative()V", "notifyExitForegroundNative()V", "notifyHiddenEventEventInfoNative(J)V",
            "notifyHiddenEventNative(Ljava/util/Map;)V", "notifyUxActiveNative()V", "notifyUxInactiveNative()V",
            "notifyViewEventEventInfoNative(J)V", "notifyViewEventNative(Ljava/util/Map;)V", "startNative()V")
        nativeSignatures.forEach { signature ->
            val params = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
            val fp = exact("Lcom/comscore/Analytics;",signature.substringBefore('('),"V",*params.toTypedArray())
            val original = fp.method
            check(original.implementation == null && original.accessFlags and AccessFlags.NATIVE.value != 0) { "Trouw Comscore JNI sink changed: $signature" }
            check(fp.classDef.methods.remove(original))
            fp.classDef.methods.add(helper("Lcom/comscore/Analytics;",original.name,"V",params,0,STOP).apply {
                accessFlags = original.accessFlags and AccessFlags.NATIVE.value.inv()
            })
        }
        installWebPolicy(tracking = true)
    }
}

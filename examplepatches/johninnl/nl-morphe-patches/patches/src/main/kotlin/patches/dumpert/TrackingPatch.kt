package patches.dumpert

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Suppresses audited native analytics, queued Piano/Facebook sends, optional diagnostics and advertising identifiers. Preserves content, accounts, purchases, push and initialized privacy services.") {
    dependsOn(originalInput, hideAds, trackingResources)
    compatibleWith(dumpert)
    execute {
        change("${APP}analytics/AnalyticsInitialiserImpl;", "init()V", STOP)
        change("${APP}analytics/CentralAnalyticsLogger;", "logEvent(Lnl/livewall/dumpert/analytics/AnalyticsEvent;Ljava/util/Map;)V", STOP)
        change("${APP}analytics/AnalyticsUserPropertiesTracker\$1\$2;", "emit(Lkotlin/Pair;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", UNIT)
        change("${APP}data/services/post_rec/PostRecTracker;", "track(Lnl/livewall/dumpert/data/services/post_rec/PostRecEvent;)V", STOP)

        // Complete before entering the original identifier-acquisition mutex.
        change("${APP}ads/PpidProviderImpl;", "prefetchIdentifiers(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", UNIT)
        change("${APP}ads/PpidProviderImpl;", "resolvePpid(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", NULL)
        change("${APP}ads/PpidProviderImpl;", "resolvePpidNow()Ljava/lang/String;", NULL)
        change("${APP}ads/PpidProviderImpl;", "getAdvertisingId()Ljava/lang/String;", EMPTY_STRING)
        change("${APP}ads/PpidProviderImpl;", "isLimitAdTrackingEnabled()Z", "const/4 v0, 0x1\nreturn v0")

        // Keep the actual initialized singleton, StateFlow and account observer.
        change("${APP}piano/CxenseManager;", "fetchSegments(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", EMPTY_LIST)
        change("${APP}piano/CxenseManager;", "retrieveUserSegments(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", EMPTY_LIST)
        change("${APP}piano/CxenseManager;", "setDMPUserId(Ljava/lang/String;)V", STOP)
        change("${APP}piano/CxenseManager;", "getDMPUserId()Ljava/lang/String;", EMPTY_STRING)
        change("${APP}piano/CxenseManager;", "createAdParams()Ljava/util/Map;", EMPTY_MAP)
        // This suspend method returns String, not Unit. Match its native fallback,
        // including lastRndValue; p0 is register24 and needs the from16 move.
        change("${APP}piano/CxenseManager;", "trackPageView(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", """
            invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
            move-result-object v0
            invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;
            move-result-object v0
            move-object/from16 v1, p0
            iput-object v0, v1, Lnl/livewall/dumpert/piano/CxenseManager;->lastRndValue:Ljava/lang/String;
            return-object v0
        """)
        change("Lio/piano/android/cxense/AdvertisingIdProvider;", "getAdvertisingInfoTask\$lambda\$0(Lio/piano/android/cxense/AdvertisingIdProvider;)V", STOP)
        for (name in listOf("sendPageViewEvents", "sendDmpEventsViaApi", "sendDmpEventsViaPersisted", "sendConversionEvents")) {
            // The private overload converts real EventRecord customId/isSent to
            // EventStatus and calls the original callback. Never claim delivery.
            change("Lio/piano/android/cxense/SendTask;", "$name\$sdk_release(Ljava/util/List;)V", """
                const/4 v0, 0x0
                invoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;
                return-void
            """)
        }
        suppressSdkTracking()
    }
}

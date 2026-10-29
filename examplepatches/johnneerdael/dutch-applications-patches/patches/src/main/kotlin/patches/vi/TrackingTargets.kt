package patches.vi

import com.android.tools.smali.dexlib2.Opcode

internal val trackingTargets = listOf(
    OwnedMethod("Lnl/vi/application/App;", "enableFirebaseCrashAnalytics()V", 18, 5, 25, listOf(
        OwnedEdit(2, listOf(Opcode.CONST_4), listOf(null), listOf("const/4 v1, 0x0")),
    )),
    OwnedMethod("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;", "isAutomaticDataCollectionEnabled()Z", 131073, 2, 14, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lnl/vi/core/ads/config/AdsIDFetcher\$fetchAdID\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 17, 8, 101, listOf(
        OwnedEdit(21, listOf(Opcode.IGET_OBJECT), listOf("Lnl/vi/core/ads/config/AdsIDFetcher\$fetchAdID\$1;->\$context:Landroid/content/Context;"), listOf("new-instance p1, Ljava/io/IOException;", "const-string v0, \"Advertising identifier collection disabled\"", "invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V", "nop"), target = 85, branch = 3),
    )),
    OwnedMethod("Lnl/vi/ads/data/google_consent/GoogleConsent\$getIFA_UUID\$\$inlined\$TryCatchCoroutine\$2;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 17, 11, 68, listOf(
        OwnedEdit(25, listOf(Opcode.SGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.GOTO, Opcode.CONST_STRING, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC), listOf("Lnl/vi/ads/data/google_consent/GoogleConsent;->INSTANCE:Lnl/vi/ads/data/google_consent/GoogleConsent;", "Lnl/vi/ads/data/google_consent/GoogleConsent;->getAppContext()Landroid/content/Context;", null, "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", null, "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;->getId()Ljava/lang/String;", null, null, null, null, "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;->isLimitAdTrackingEnabled()Z", null, "Lnl/vi/ads/data/google_consent/GoogleConsent;->access\$setTrackingEnabled\$p(Z)V"), listOf("const/4 v2, 0x0", "const-string v4, \"\"", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop")),
    )),
    OwnedMethod("Lnl/vi/ads/data/google_consent/GoogleConsent\$isAdvertisingIDAvailable\$\$inlined\$TryCatchCoroutine\$2;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 17, 6, 53, listOf(
        OwnedEdit(8, listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_NEZ, Opcode.CONST_STRING, Opcode.SGET_OBJECT, Opcode.NEW_INSTANCE, Opcode.CONST_STRING, Opcode.INVOKE_DIRECT, Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.GOTO), listOf("Lnl/vi/ads/data/google_consent/GoogleConsent\$isAdvertisingIDAvailable\$\$inlined\$TryCatchCoroutine\$2;->\$activity\$inlined:Landroid/app/Activity;", null, "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", null, "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;->getId()Ljava/lang/String;", null, null, null, "Lnl/vi/ads/data/google_consent/GoogleConsent;->INSTANCE:Lnl/vi/ads/data/google_consent/GoogleConsent;", null, null, "Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V", "Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;", "Ljava/lang/StringBuilder;->toString()Ljava/lang/String;", null, "Lnl/vi/ads/data/google_consent/GoogleConsent;->log(Ljava/lang/String;)V", null, null, "Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z", null, null, null, null, null, null, "Lkotlin/text/StringsKt;->startsWith\$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z", null, null, null), listOf("const/4 v1, 0x0", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop", "nop"), target = 43, branch = 1),
    )),
    OwnedMethod("Lnl/vi/shared/module/logger/AppLogger;", "createDirectoryAndFile()V", 17, 4, 26, listOf(
        OwnedEdit(24, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
    )),
    OwnedMethod("Lnl/vi/shared/module/logger/AppLogger\$createLogFile\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 17, 23, 493, listOf(
        OwnedEdit(179, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
        OwnedEdit(235, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
        OwnedEdit(250, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
        OwnedEdit(314, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
        OwnedEdit(378, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
        OwnedEdit(489, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->log(Ljava/lang/String;)V"), listOf("nop")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "initialize()V", 17, 2, 36, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "logScreen(Lnl/vi/shared/module/analytics/screenLog/LogScreen;)V", 17, 5, 28, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "sendApiPerformanceEvent(Ljava/util/HashMap;)V", 17, 4, 30, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "sendEvent(Ljava/lang/String;)V", 17, 3, 6, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "sendEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V", 17, 9, 41, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "sendView(Landroid/app/Activity;Ljava/lang/String;Lnl/vi/data/article/Article;Lnl/vi/data/gridblock/GridBlockItem;Ljava/lang/String;)V", 17, 10, 72, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "sendComView(Lnl/vi/data/article/Article;Lnl/vi/data/gridblock/GridBlockItem;)V", 18, 4, 36, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/shared/module/analytics/ViAnalytics;", "setIdfa(Ljava/lang/String;)V", 17, 4, 15, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/feature/livestream/LiveStreamAnalytics;", "logStreamOneSecond()V", 18, 7, 12, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/feature/livestream/LiveStreamAnalytics;", "logStreamStart()V", 18, 4, 11, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/feature/livestream/LiveStreamAnalytics;", "logStreamStop()V", 18, 3, 6, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/core/blueConic/BlueConicManagerImp;", "init(Landroid/app/Application;)V", 1, 3, 22, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/core/blueConic/BlueConicManagerImp;", "logScreenName(Ljava/lang/String;Ljava/util/Map;)V", 1, 5, 31, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/core/blueConic/BlueConicManagerImp;", "setGDPRPurposes()V", 18, 7, 111, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/core/blueConic/BlueConicManagerImp;", "reCreateProfile()V", 1, 2, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lcom/facebook/UserSettingsManager;", "getAutoLogAppEventsEnabled()Z", 25, 3, 14, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lcom/facebook/UserSettingsManager;", "getAdvertiserIDCollectionEnabled()Z", 25, 3, 15, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lnl/vi/shared/util/PrefUtils;", "getStringPref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", 9, 3, 5, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const-string v0, \"ad_id\"", "invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z", "move-result v0", "if-nez v0, :policy_8", "const-string v0, \"ifa_id\"", "invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z", "move-result v0", "if-eqz v0, :policy_10", ":policy_8", "const-string v0, \"\"", "return-object v0", ":policy_10")),
    )),
    OwnedMethod("Lcom/comscore/metrics/Request;", "a()Z", 4, 7, 86, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzae;", "zzw()Z", 17, 2, 11, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x1", "return v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzgi;", "run()V", 17, 16, 196, listOf(
        OwnedEdit(5, listOf(Opcode.IGET_OBJECT), listOf("Lcom/google/android/gms/measurement/internal/zzgi;->zza:Ljava/net/URL;"), listOf("new-instance v4, Ljava/io/IOException;", "const-string v5, \"Measurement transport disabled\"", "invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V", "throw v4", "iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgi;->zza:Ljava/net/URL;")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzko;", "run()V", 17, 6, 60, listOf(
        OwnedEdit(4, listOf(Opcode.IGET_OBJECT), listOf("Lcom/google/android/gms/measurement/internal/zzko;->zza:Ljava/net/URL;"), listOf("new-instance v2, Ljava/io/IOException;", "const-string v3, \"Measurement transport disabled\"", "invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V", "throw v2", "iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzko;->zza:Ljava/net/URL;")),
    )),
    OwnedMethod("Lcom/google/firebase/crashlytics/internal/send/ReportQueue;", "sendReport(Lcom/google/firebase/crashlytics/internal/common/CrashlyticsReportWithSessionId;Lcom/google/android/gms/tasks/TaskCompletionSource;)V", 2, 7, 30, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "new-instance v1, Ljava/io/IOException;", "const-string v2, \"Crash reporting disabled\"", "invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V", "invoke-virtual {p0, p2, v0, p1, v1}, Lcom/google/firebase/crashlytics/internal/send/ReportQueue;->lambda\$sendReport\$1\$com-google-firebase-crashlytics-internal-send-ReportQueue(Lcom/google/android/gms/tasks/TaskCompletionSource;ZLcom/google/firebase/crashlytics/internal/common/CrashlyticsReportWithSessionId;Ljava/lang/Exception;)V", "return-void")),
    )),
    OwnedMethod("Lcom/google/android/datatransport/cct/CctTransportBackend;", "send(Lcom/google/android/datatransport/runtime/backends/BackendRequest;)Lcom/google/android/datatransport/runtime/backends/BackendResponse;", 1, 6, 72, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("invoke-static {p1}, Lcom/google/android/datatransport/cct/CctTransportBackend;->morpheMeasurementRequest(Lcom/google/android/datatransport/runtime/backends/BackendRequest;)Lcom/google/android/datatransport/runtime/backends/BackendRequest;", "move-result-object p1", "if-nez p1, :policy_6", "invoke-static {}, Lcom/google/android/datatransport/runtime/backends/BackendResponse;->fatalError()Lcom/google/android/datatransport/runtime/backends/BackendResponse;", "move-result-object v0", "return-object v0", ":policy_6")),
    )),
)

package app.venus.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method

/** Native entry-point guards; interfaces, constructors, cleanup and operational network APIs stay intact. */
internal object NativePrivacy {
    enum class Result { VOID, TRUE, FALSE, NULL, SELF, EMPTY_STRING, PROMISE_NULL, PROMISE_TRUE, PROMISE_FALSE, AF_SUCCESS, EMPTY_MAP, PROFILE_START, AD_ID_MAP, CALLBACK_NULL, CALLBACK_FALSE, CALLBACK_EMPTY_STRING, BOXED_FALSE, THROWABLE_STRING }
    data class Target(val owner: String, val name: String, val parameters: List<String>, val returns: String, val result: Result) {
        fun matches(method: Method) = method.definingClass == owner && method.name == name &&
            method.parameterTypes.map { it.toString() } == parameters && method.returnType == returns
        fun prefix(method: Method): String {
            require(matches(method) && method.implementation != null) { "Native privacy ABI changed: $owner->$name" }
            val registers = method.implementation!!.registerCount
            require(result == Result.VOID || registers >= 1)
            val isStatic = method.accessFlags and 8 != 0
            fun lastParameter(): Int = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 } - if (isStatic) 1 else 0
            return when (result) {
                Result.VOID -> { require(returns == "V"); "return-void" }
                Result.TRUE, Result.FALSE -> {
                    require(returns == "Z" && registers >= 1)
                    "const/4 v0, ${if (result == Result.TRUE) "0x1" else "0x0"}\nreturn v0"
                }
                Result.NULL -> { require(returns.startsWith("L")); "const/4 v0, 0x0\nreturn-object v0" }
                Result.BOXED_FALSE -> {
                    require(returns == "Ljava/lang/Boolean;")
                    "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0"
                }
                Result.THROWABLE_STRING -> {
                    require(isStatic && parameters == listOf("Ljava/lang/Throwable;") && returns == "Ljava/lang/String;")
                    "invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;\nmove-result-object v0\nreturn-object v0"
                }
                Result.CALLBACK_NULL, Result.CALLBACK_FALSE, Result.CALLBACK_EMPTY_STRING -> {
                    require(returns == "V" && parameters.last() == "Lcom/facebook/react/bridge/Callback;" && registers >= 2)
                    val value = when (result) {
                        Result.CALLBACK_FALSE -> "sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
                        Result.CALLBACK_EMPTY_STRING -> "const-string v1, \"\""
                        else -> "const/4 v1, 0x0"
                    }
                    "move-object/from16 v0, p${lastParameter()}\n$value\n" +
                        "filled-new-array {v1}, [Ljava/lang/Object;\nmove-result-object v1\n" +
                        "invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V\nreturn-void"
                }
                Result.SELF -> { require(!isStatic && returns == "Lcom/appsflyer/AppsFlyerLib;"); "return-object p0" }
                Result.EMPTY_STRING -> { require(returns == "Ljava/lang/String;"); "const-string v0, \"\"\nreturn-object v0" }
                Result.PROMISE_NULL, Result.PROMISE_TRUE, Result.PROMISE_FALSE -> {
                    require(returns == "V" && parameters.last() == "Lcom/facebook/react/bridge/Promise;" && registers >= 2)
                    val value = when (result) {
                        Result.PROMISE_TRUE -> "sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
                        Result.PROMISE_FALSE -> "sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
                        else -> "const/4 v1, 0x0"
                    }
                    // Copy first, then borrow low registers: some bridges have no spare locals.
                    "move-object/from16 v0, p${lastParameter()}\n$value\n" +
                        "invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\nreturn-void"
                }
                Result.EMPTY_MAP, Result.PROFILE_START, Result.AD_ID_MAP -> {
                    require(returns == "Lcom/facebook/react/bridge/WritableMap;" ||
                        (result == Result.AD_ID_MAP && returns == "V" && parameters == listOf("Lcom/facebook/react/bridge/Promise;")))
                    val create = "invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;\nmove-result-object v0\n"
                    when (result) {
                        Result.EMPTY_MAP -> create + "return-object v0"
                        Result.PROFILE_START -> {
                            require(registers >= 3)
                            create + "const-string v1, \"started\"\nconst/4 v2, 0x0\n" +
                                "invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V\nreturn-object v0"
                        }
                        else -> {
                            require(registers >= 4 && !isStatic)
                            // Preserve the Ads bridge's limited-tracking response schema, not Promise.resolve(null).
                            "move-object/from16 v3, p1\n" + create +
                                "const-string v1, \"googleAdvertisingId\"\n" +
                                "invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putNull(Ljava/lang/String;)V\n" +
                                "const-string v1, \"isLimitAdTrackingEnabled\"\nconst/4 v2, 0x1\n" +
                                "invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V\n" +
                                "invoke-interface {v3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\nreturn-void"
                        }
                    }
                }
                Result.AF_SUCCESS -> {
                    require(returns == "V" && parameters.last() == "Lcom/appsflyer/attribution/AppsFlyerRequestListener;")
                    "move-object/from16 v0, p${lastParameter()}\nif-eqz v0, :venus_privacy_done\n" +
                        "invoke-interface {v0}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onSuccess()V\n" +
                        ":venus_privacy_done\nreturn-void"
                }
            }
        }
        fun install(method: MutableMethod) { method.addInstructions(0, prefix(method)) }
    }
    val crash = listOf(
        Target("Lcom/discord/crash_reporting/CrashReportingModule;", "initializeManager", listOf(), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReportingModule;", "getDidCrashDuringPreviousExecution", listOf("Lcom/facebook/react/bridge/Callback;"), "V", Result.CALLBACK_FALSE),
        Target("Lcom/discord/crash_reporting/CrashReportingModule;", "getLastCrashReport", listOf("Lcom/facebook/react/bridge/Callback;"), "V", Result.CALLBACK_NULL),
        Target("Lcom/discord/crash_reporting/CrashReportingModule;", "getSystemLog", listOf("Lcom/facebook/react/bridge/Callback;"), "V", Result.CALLBACK_EMPTY_STRING),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "isCrashedLastRun", listOf(), "Ljava/lang/Boolean;", Result.BOXED_FALSE),
        Target("Lcom/discord/crash_reporting/system_logs/SystemLogUtils;", "initSystemLogCapture", listOf("Landroid/content/Context;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/system_logs/SystemLogCapture;", "startThread", listOf("Landroid/content/Context;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashPersistence;", "getLastCrashInfo", listOf(), "Lcom/discord/crash_reporting/CrashPersistence\$LastCrashInfo;", Result.NULL),
        Target("Lcom/discord/crash_reporting/CrashPersistence;", "setLastCrashInfo", listOf("Lcom/discord/crash_reporting/CrashPersistence\$LastCrashInfo;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/WebrtcCrashReporting;", "reportWebrtcException", listOf("Ljava/lang/Throwable;"), "Ljava/lang/String;", Result.THROWABLE_STRING),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "addBreadcrumb", listOf("Ljava/lang/String;", "Ljava/util/Map;", "Ljava/lang/String;", "Lcom/discord/crash_reporting/CrashReporting\$BreadcrumbLevel;", "Z"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "addBreadcrumbBatchBinary", listOf("Ljava/nio/ByteBuffer;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "captureException", listOf("Ljava/lang/Throwable;", "Z"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "captureMessage", listOf("Ljava/lang/String;", "Ljava/lang/Exception;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "captureMessage", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lcom/discord/crash_reporting/CrashReporting\$ErrorLevel;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "libdiscoreAddBreadcrumb", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/CrashReporting;", "isDisabled", listOf(), "Z", Result.TRUE),
        Target("Lio/sentry/android/core/c1;", "b", listOf("Landroid/content/Context;", "Lio/sentry/android/core/l0;", "Lio/sentry/b4;"), "V", Result.VOID),
        Target("Lio/sentry/android/core/SentryInitProvider;", "onCreate", listOf(), "Z", Result.TRUE),
        Target("Lcom/discord/crash_reporting/NativeCrashReporting\$Companion;", "initNative", listOf("Z"), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "initNativeSdk", listOf("Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_FALSE),
        Target("Lio/sentry/react/RNSentryModule;", "captureEnvelope", listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_TRUE),
        Target("Lio/sentry/react/RNSentryModule;", "captureReplay", listOf("Z", "Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "captureScreenshot", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "fetchViewHierarchy", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "fetchNativeDeviceContexts", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "fetchNativeAppStart", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "fetchNativeFrames", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "fetchNativeLogAttributes", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "initNativeReactNavigationNewFrameTracking", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lio/sentry/react/RNSentryModule;", "addBreadcrumb", listOf("Lcom/facebook/react/bridge/ReadableMap;"), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "setContext", listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "setExtra", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "setTag", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "setUser", listOf("Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/ReadableMap;"), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "enableNativeFramesTracking", listOf(), "V", Result.VOID),
        Target("Lio/sentry/react/RNSentryModule;", "startProfiling", listOf("Z"), "Lcom/facebook/react/bridge/WritableMap;", Result.PROFILE_START),
        Target("Lio/sentry/react/RNSentryModule;", "stopProfiling", listOf(), "Lcom/facebook/react/bridge/WritableMap;", Result.EMPTY_MAP),
        Target("Lio/sentry/react/RNSentryModule;", "getCurrentReplayId", listOf(), "Ljava/lang/String;", Result.NULL),
        Target("Lio/sentry/react/RNSentryModule;", "setActiveSpanId", listOf("Ljava/lang/String;"), "Z", Result.FALSE),
        Target("Lcom/discord/crash_reporting/PerformanceTracing;", "start", listOf(), "V", Result.VOID),
    )
    val telemetry = listOf(
        Target("Lcom/discord/metric_monitor/MonitoringAgent;", "increment", listOf("Lcom/discord/metric_monitor/MetricEvent;"), "V", Result.VOID),
        Target("Lcom/discord/metric_monitor/MonitoringAgent;", "setMetricLogger\$metric_monitor_release", listOf("Lkotlin/jvm/functions/Function1;"), "V", Result.VOID),
        Target("Lcom/discord/analytics/touch/TouchEventAnalyticsModule;", "enableTouchLogging", listOf(), "V", Result.VOID),
        Target("Lcom/discord/analytics/touch/TouchEventAnalyticsModule;", "onEventRecognized", listOf("Lcom/discord/analytics/touch/TouchEventDetails;"), "V", Result.VOID),
        Target("Lcom/discord/analytics/touch/TouchLogger;", "enable", listOf("Landroid/app/Activity;"), "V", Result.VOID),
        Target("Lcom/discord/analytics/touch/TouchLogger;", "handleTouchEvent", listOf("Landroid/view/MotionEvent;", "Landroid/view/ViewGroup;", "Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/discord/analytics/touch/TouchLogger;", "registerListener", listOf("Lcom/discord/analytics/touch/OnEventRecognizedListener;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/TelemetryRing;", "init", listOf("Landroid/content/Context;", "Lcom/discord/crash_reporting/TelemetryRingTypes\$Budget;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/TelemetryRing;", "append", listOf("Ljava/lang/String;", "J", "Ljava/lang/String;", "Ljava/util/Map;", "Ljava/util/List;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/TelemetryRing;", "enqueueWrite", listOf("Lcom/discord/crash_reporting/TelemetryRingSqliteStore\$EntryPayload;"), "V", Result.VOID),
        Target("Lcom/discord/crash_reporting/TelemetryRingModule;", "append", listOf("Ljava/lang/String;", "D", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/ReadableArray;"), "V", Result.VOID),
    )
    val advertising = listOf(
        Target("Lcom/discord/ads/AdsModule;", "getGoogleAdvertisingId", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.AD_ID_MAP),
    )
    val attribution = listOf(
        Target("Lcom/discord/analytics/InstallReferrerModule;", "get", listOf("Lcom/facebook/react/bridge/Promise;"), "V", Result.PROMISE_NULL),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "init", listOf("Ljava/lang/String;", "Lcom/appsflyer/AppsFlyerConversionListener;", "Landroid/content/Context;"), "Lcom/appsflyer/AppsFlyerLib;", Result.SELF),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "isStopped", listOf(), "Z", Result.TRUE),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "start", listOf("Landroid/content/Context;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "start", listOf("Landroid/content/Context;", "Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "start", listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lcom/appsflyer/attribution/AppsFlyerRequestListener;"), "V", Result.AF_SUCCESS),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "logEvent", listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "logEvent", listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;", "Lcom/appsflyer/attribution/AppsFlyerRequestListener;"), "V", Result.AF_SUCCESS),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "logSession", listOf("Landroid/content/Context;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "logLocation", listOf("Landroid/content/Context;", "D", "D"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "logAdRevenue", listOf("Lcom/appsflyer/AFAdRevenueData;", "Ljava/util/Map;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setCustomerIdAndLogSession", listOf("Ljava/lang/String;", "Landroid/content/Context;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "updateServerUninstallToken", listOf("Landroid/content/Context;", "Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "performOnAppAttribution", listOf("Landroid/content/Context;", "Ljava/net/URI;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "performOnDeepLinking", listOf("Landroid/content/Intent;", "Landroid/content/Context;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setAdditionalData", listOf("Ljava/util/Map;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setAndroidIdData", listOf("Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setImeiData", listOf("Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setOaidData", listOf("Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setInstallId", listOf("Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setCustomerUserId", listOf("Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setPhoneNumber", listOf("Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setUserEmails", listOf("Lcom/appsflyer/AppsFlyerProperties\$EmailsCryptType;", "[Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setUserEmails", listOf("[Ljava/lang/String;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "setPartnerData", listOf("Ljava/lang/String;", "Ljava/util/Map;"), "V", Result.VOID),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "getAppsFlyerUID", listOf("Landroid/content/Context;"), "Ljava/lang/String;", Result.EMPTY_STRING),
        Target("Lcom/appsflyer/internal/AFa1uSDK;", "getAttributionId", listOf("Landroid/content/Context;"), "Ljava/lang/String;", Result.EMPTY_STRING),
    )
}

@Suppress("unused")
val disableAnalytics = rawResourcePatch(
    name = "Disable analytics",
    description = "Stops Discord's usage tracking and the analytics events it uploads. Always on once patched."
) {
    compatibleWith(discord)
    section(PRIVACY)
    dependsOn(packagedDiscordBundle)
    execute { HbcPrivacy.apply(get("assets/index.android.bundle"), HbcPrivacy.analytics) }
}

private val crashTransport = rawResourcePatch {
    dependsOn(packagedDiscordBundle)
    execute { HbcPrivacy.apply(get("assets/index.android.bundle"), HbcPrivacy.crash) }
}
private val telemetryProducers = rawResourcePatch {
    dependsOn(packagedDiscordBundle)
    execute { HbcPrivacy.apply(get("assets/index.android.bundle"), HbcPrivacy.telemetry) }
}

@Suppress("unused")
val disableCrashReporting = bytecodePatch(
    name = "Disable crash reporting",
    description = "Stops crash reports, screenshots and system logs from being sent to Sentry. Always on once patched."
) {
    compatibleWith(discord)
    section(PRIVACY)
    dependsOn(crashTransport)
    execute {
        for (target in NativePrivacy.crash) target.install(Fingerprint(
            definingClass = target.owner, name = target.name, parameters = target.parameters, returnType = target.returns
        ).method)
    }
}

@Suppress("unused")
val disableTelemetry = bytecodePatch(
    name = "Disable telemetry and touch logging",
    description = "Stops performance tracking and records of what you tap. Always on once patched."
) {
    compatibleWith(discord)
    section(PRIVACY)
    dependsOn(telemetryProducers)
    execute {
        for (target in NativePrivacy.telemetry) target.install(Fingerprint(
            definingClass = target.owner, name = target.name, parameters = target.parameters, returnType = target.returns
        ).method)
    }
}

@Suppress("unused")
val disableAttribution = bytecodePatch(
    name = "Disable install attribution",
    description = "Stops AppsFlyer from tracking how you installed the app. Some invite links that open before install may not work."
) {
    compatibleWith(discord)
    section(PRIVACY)
    dependsOn(discordBundleGuard)
    execute {
        for (target in NativePrivacy.attribution) target.install(Fingerprint(
            definingClass = target.owner, name = target.name, parameters = target.parameters, returnType = target.returns
        ).method)
    }
}

@Suppress("unused")
val disableAdvertisingIdentifiers = bytecodePatch(
    name = "Disable advertising identifiers",
    description = "Stops Discord from reading your Google advertising ID. Always on once patched."
) {
    compatibleWith(discord)
    section(PRIVACY)
    dependsOn(discordBundleGuard)
    execute {
        for (target in NativePrivacy.advertising) target.install(Fingerprint(
            definingClass = target.owner, name = target.name, parameters = target.parameters, returnType = target.returns
        ).method)
    }
}

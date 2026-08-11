package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference



private const val RETURN_VOID = "return-void"

private const val RETURN_EMPTY_STRING = """
    const-string v0, ""
    return-object v0
"""

private const val RETURN_NULL_OBJECT = """
    const/4 v0, 0x0
    return-object v0
"""

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private fun isConstructor(method: Method): Boolean =
    method.name == "<init>" || method.name == "<clinit>"

private const val FOX_STATS_DEFAULT_ENV = "Lcom/tantanapp/foxstatistics/DefaultEnvironment;"

@Suppress("unused")
@JvmField
val analyticsDisablePatch = bytecodePatch(
    name = "Analytics Disable",
    description = "Disables all analytics, telemetry, and device fingerprinting for privacy",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        val resolver = UnifiedClassResolver(this)
        resolver.resolve()

        classDefByOrNull("Lcom/appsflyer/AppsFlyerLib;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                val isPublicFinal = AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                                   AccessFlags.FINAL.isSet(method.accessFlags)
                when {
                    isPublicFinal &&
                    method.returnType == "Lcom/appsflyer/AppsFlyerLib;" &&
                    method.parameterTypes == listOf("Ljava/lang/String;", "Lcom/appsflyer/AppsFlyerConversionListener;", "Landroid/content/Context;") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)

                    isPublicFinal &&
                    method.returnType == "V" &&
                    method.parameterTypes == listOf("Landroid/content/Context;") ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/clevertap/android/sdk/CleverTapAPI;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                val isPublicStatic = AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                                    AccessFlags.STATIC.isSet(method.accessFlags)
                when {
                    isPublicStatic &&
                    method.returnType == "Lcom/clevertap/android/sdk/CleverTapAPI;" &&
                    method.parameterTypes == listOf("Landroid/content/Context;", "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)

                    isPublicStatic &&
                    method.returnType == "Lcom/clevertap/android/sdk/CleverTapAPI;" &&
                    method.parameterTypes == listOf("Landroid/content/Context;", "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;", "Ljava/lang/String;") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        classDefByOrNull("Lcom/facebook/appevents/AppEventsLogger;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                val isPublicStaticFinal = AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                                         AccessFlags.STATIC.isSet(method.accessFlags) &&
                                         AccessFlags.FINAL.isSet(method.accessFlags)
                when {
                    isPublicStaticFinal &&
                    method.returnType == "V" &&
                    method.parameterTypes == listOf("Landroid/app/Application;") ->
                        method.addInstructions(0, RETURN_VOID)

                    isPublicStaticFinal &&
                    method.returnType == "V" &&
                    method.parameterTypes == listOf("Landroid/app/Application;", "Ljava/lang/String;") ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/sina/deviceidjnisdk/DeviceId;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                    else -> if (method.returnType.startsWith("L")) {
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                    }
                }
            }
        }

        listOf(
            "Lcom/cosmos/photon/push/uniqueid/UniqueAndroidId;",
            "Lcom/cosmos/photon/push/uniqueid/UniqueIMEI;",
            "Lcom/cosmos/photon/push/uniqueid/UniqueDeviceId;",
            "Lcom/cosmos/photon/push/uniqueid/UniqueSerialNumber;"
        ).forEach { descriptor ->
            classDefByOrNull(descriptor)?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.implementation == null) return@forEach
                    if (isConstructor(method)) return@forEach
                    when (method.returnType) {
                        "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                        "V" -> method.addInstructions(0, RETURN_VOID)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/tencent/liteav/basic/datareport/TXCDRApi;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") method.addInstructions(0, RETURN_VOID)
            }
        }

        classDefByOrNull("Lcom/cosmos/mdlog/MDLog;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "V" -> method.addInstructions(0, RETURN_VOID)
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    else -> if (method.returnType.startsWith("L")) {
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/android/installreferrer/api/InstallReferrerClient;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.returnType == "V" -> method.addInstructions(0, RETURN_VOID)
                    method.returnType == "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    method.returnType.startsWith("L") -> method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        resolver.getAnalyticsClass("foxStats")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Landroid/content/Context;" &&
                    method.returnType == "V" -> method.addInstructions(0, RETURN_VOID)

                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Landroid/content/Context;" &&
                    method.returnType == "V" -> method.addInstructions(0, RETURN_VOID)

                    method.name.length == 1 && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("beatles")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "install", "start") && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("firebaseAnalytics")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (method.name in setOf("logEvent", "setAnalyticsCollectionEnabled", "setUserId",
                                        "setUserProperty", "resetAnalyticsData", "setCurrentScreen",
                                        "setDefaultEventParameters", "setSessionTimeoutDuration", "setConsent") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("googleAdId")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (method.name == "getAdvertisingIdInfo" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Landroid/content/Context;" &&
                    method.returnType.startsWith("L")) {
                    method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        resolver.getAnalyticsClass("pushStats")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "logPushEventInfo", "logRegCallback", "forceUpload") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("batteryMetrics")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name == "init" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("moLiveApm")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "start", "enable", "trace", "record", "report", "flush", "stop") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("dnsSla")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "flush", "setEnable", "log", "setOnFlushListener") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("moTracing")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "start", "stop", "flush", "trace", "span",
                                        "record", "report", "enable", "disable", "submit",
                                        "_getOrCreate", "_compressRecordFile", "_send",
                                        "_flush", "_record", "_trace") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
                if (method.name in setOf("isEnabled", "isReady", "isRunning", "_isEnabled") &&
                    method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        resolver.getAnalyticsClass("moLiveApm2")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "start", "enable", "submit", "collect",
                                        "report", "flush", "stop", "setSubmitAlternative",
                                        "getSubmitAlternative") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("deviceFingerprintCollector")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" -> method.addInstructions(0, RETURN_NULL_OBJECT)

                    method.returnType == "Ljava/lang/String;" &&
                    AccessFlags.STATIC.isSet(method.accessFlags) -> method.addInstructions(0, RETURN_EMPTY_STRING)
                }
            }
        }

        resolver.getAnalyticsClass("deviceFingerprintHash")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("deviceInfoCollector")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolver.getAnalyticsClass("oaid")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.returnType == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_EMPTY_STRING)

                    method.returnType == "V" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Landroid/content/Context;" -> method.addInstructions(0, RETURN_VOID)

                    method.returnType == "Z" &&
                    method.parameterTypes.isEmpty() -> method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        resolver.getAnalyticsClass("coreEventLogger")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/momo/xengine/mestatistics/MEStatisticsImpl;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "flush", "report", "realTimeReport",
                                        "setMMCVVersion", "setMagicEffectVersion",
                                        "setRecorderSDKVersion", "setUID", "setXEngineVersion") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (!AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/tantanapp/beatles/anrmonitor/a;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name == "run" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/tantan/library/svga/tracker/CacheTrackerManager;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "getCurrentPidMemorySize" && method.returnType == "I" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "getJavaAppMemoryUsage" && method.returnType == "I" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "getIfRoomsDevice" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name in setOf("getMemoryState", "getThermalState", "getThreadCount") &&
                    method.returnType == "I" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "setThermalState" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "init" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)

                    method.name == "getInstance" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)

                    method.name in setOf("recordException", "log", "sendUnsentReports", "deleteUnsentReports",
                        "setCrashlyticsCollectionEnabled", "setCustomKey", "setCustomKeys", "setUserId") &&
                    method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "isCrashlyticsCollectionEnabled" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "didCrashOnPreviousExecution" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/crashlytics/internal/common/CrashlyticsCore;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "onPreExecute" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name in setOf("log", "logException") && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "isCrashlyticsCollectionEnabled" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        classDefByOrNull("Lcom/apm/lite/nativecrash/NativeImpl;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "p" && method.returnType == "Z" && method.parameterTypes.isEmpty() ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "w" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "k" && method.returnType == "Z" && method.parameterTypes.isEmpty() ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name == "n" && method.returnType == "Z" && method.parameterTypes.isEmpty() ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags) ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/hellogroup/mk/core/log/MKCoreLogManager;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "j" && method.returnType == "V" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Lcom/hellogroup/mk/core/log/core/MKLogReporter;" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "d" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "k" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name in setOf("c", "g", "h") && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/hellogroup/mk/core/log/core/MKLogReporter;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "V" -> method.addInstructions(0, RETURN_VOID)
                    "Z" -> method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/abt/FirebaseABTesting;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name in setOf("replaceAllExperiments", "removeAllExperiments",
                        "reportActiveExperiment", "validateRunningExperiments") &&
                    method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "getAllExperiments" && method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/messaging/MessagingAnalytics;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name in setOf("logNotificationDismiss", "logNotificationForeground",
                        "logNotificationOpen", "logNotificationReceived", "logToScion",
                        "logToFirelog", "setDeliveryMetricsExportToBigQuery", "setUserPropertyIfRequired") &&
                    method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "deliveryMetricsExportToBigQueryEnabled" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name in setOf("shouldUploadFirelogAnalytics", "shouldUploadScionMetrics") &&
                    method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        classDefByOrNull("Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name in setOf("g", "j", "b", "h", "i") && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/tantanapp/common/network/NetReporter;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/sessions/api/FirebaseSessionsDependencies;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "register" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "addDependency" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name in setOf("i", "n", "r", "l", "o") && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "j" && method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/ui/jsbridge/implement/TrackBridgeImplementation;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                method.addInstructions(0, RETURN_VOID)
            }
        }

        val omsAdTrackingFingerprint = Fingerprint(
            filters = listOf(string("e_oms_show_event_report")),
        )
        omsAdTrackingFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        classDefByOrNull("Lcom/tantanapp/beatles/BeatlesProvider;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "query" && method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)

                    method.name == "onCreate" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/backtrace/backtrace/WarmUpService;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "onCreate" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "onBind" && method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        classDefByOrNull("Lcom/core/glcore/util/ErrorDotStatistics;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "addErrInfo" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)

                    method.name == "getInstance" && method.returnType.startsWith("L") ->
                        method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }
    }
}

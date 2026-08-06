package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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

private val foxStatsClassFingerprint = Fingerprint(
    filters = listOf(string("e_request_none_oaid")),
)

private val beatlesClassFingerprint = Fingerprint(
    filters = listOf(string("com.tantanapp.beatles")),
)

private val oaidClassFingerprint = Fingerprint(
    filters = listOf(string("miit_oaid")),
)

private val firebaseAnalyticsClassFingerprint = Fingerprint(
    filters = listOf(string("add_payment_info")),
)

private val googleAdIdClassFingerprint = Fingerprint(
    filters = listOf(string("com.google.android.gms.ads.identifier.service.START")),
)

private val pushStatsClassFingerprint = Fingerprint(
    filters = listOf(string("mmfile_push_statistic")),
)

private val batteryMetricsClassFingerprint = Fingerprint(
    filters = listOf(string("BatteryMetrics")),
)

private val moLiveApmClassFingerprint = Fingerprint(
    filters = listOf(string("live-PerfTracer")),
)

private val dnsSlaClassFingerprint = Fingerprint(
    filters = listOf(string("DNS_SLA")),
)

private val moTracingClassFingerprint = Fingerprint(
    filters = listOf(string("_getOrCreate"), string("_compressRecordFile")),
)

private val networkMetricsClassFingerprint = Fingerprint(
    filters = listOf(string("setMmcvVersion"), string("setMagicEffectVersion")),
)

private val moLiveApmClassFingerprint2 = Fingerprint(
    filters = listOf(string("getSubmitAlternative")),
)

private val deviceFingerprintCollectorClassFingerprint = Fingerprint(
    filters = listOf(string("ANDROIDID"), string("OAID"), string("LBS")),
)

private val deviceFingerprintHashClassFingerprint = Fingerprint(
    filters = listOf(string("androidid"), string("cid"), string("screen")),
)

private val deviceInfoCollectorClassFingerprint = Fingerprint(
    filters = listOf(string("android_id"), string("wlan0/address")),
)

private val coreEventLoggerClassFingerprint = Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Lcom/tantanapp/foxstatistics/DefaultEnvironment;"),
    ),
)

@Suppress("unused")
@JvmField
val analyticsDisablePatch = bytecodePatch(
    name = "Analytics Disable",
    description = "Disables all analytics, telemetry, and device fingerprinting for privacy",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
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

        classDefByOrNull("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (method.name == "getInstance" && method.returnType.startsWith("L")) {
                    method.addInstructions(0, RETURN_NULL_OBJECT)
                }
            }
        }

        foxStatsClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        beatlesClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "install", "start") && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        firebaseAnalyticsClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        googleAdIdClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        pushStatsClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "logPushEventInfo", "logRegCallback", "forceUpload") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        batteryMetricsClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name == "init" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        moLiveApmClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "start", "enable", "trace", "record", "report", "flush", "stop") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        dnsSlaClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "flush", "setEnable", "log", "setOnFlushListener") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // MoTracing - disable tracing methods
        moTracingClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        // Network Metrics - disable metrics methods
        networkMetricsClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        // MoLive APM - disable APM methods
        moLiveApmClassFingerprint2.matchOrNull()?.classDef?.let { classDef ->
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

        // Sina DeviceId JNI SDK - disable device fingerprinting
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

        // Cosmos Photon Push UniqueIDs - disable hardware ID collection
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

        // Tencent LiteAV Telemetry - disable performance tracking
        classDefByOrNull("Lcom/tencent/liteav/basic/datareport/TXCDRApi;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // Cosmos MDLog - disable core logging infrastructure
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

        // Install Referrer API - disable install attribution tracking
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

        // Central device fingerprint collector (dk50) - block URL template substitution and all identifier collection
        deviceFingerprintCollectorClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" -> method.addInstructions(0, """
                        const/4 v0, 0x0
                        return-object v0
                    """)

                    method.returnType == "Ljava/lang/String;" &&
                    AccessFlags.STATIC.isSet(method.accessFlags) -> method.addInstructions(0, RETURN_EMPTY_STRING)
                }
            }
        }

        // Device fingerprint hash collector (nuq0) - block device fingerprint generation
        deviceFingerprintHashClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // Device info collector (vrq0) - block ANDROIDID, IMEI, MAC collection at source
        deviceInfoCollectorClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // Enhanced OAID collection (hb00) - block OAID init and collection
        oaidClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
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

        // Core Event Logger (i4g0) - central analytics hub, ALL app analytics flow through this class
        coreEventLoggerClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // MEStatistics - live streaming performance analytics
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

        // AppOpenWayStats - app launch tracking
        classDefByOrNull("Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // FPS Monitor (Beatles SDK) - UI frame rate monitoring
        classDefByOrNull("Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (!AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ANR Monitor (Beatles SDK) - Application Not Responding detection
        classDefByOrNull("Lcom/tantanapp/beatles/anrmonitor/C13704a;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name == "run" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // SVGA Cache Tracker - animation cache metrics
        classDefByOrNull("Lcom/tantan/library/svga/tracker/CacheTrackerManager;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ByteDance Performance Monitor - device performance metrics
        classDefByOrNull("Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when {
                    method.name == "getCurrentPidMemorySize" && method.returnType == "I" ->
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return v0
                        """)

                    method.name == "getJavaAppMemoryUsage" && method.returnType == "I" ->
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return v0
                        """)

                    method.name == "getIfRoomsDevice" && method.returnType == "Z" ->
                        method.addInstructions(0, RETURN_FALSE)

                    method.name in setOf("getMemoryState", "getThermalState", "getThreadCount") &&
                    method.returnType == "I" ->
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return v0
                        """)

                    method.name == "setThermalState" && method.returnType == "V" ->
                        method.addInstructions(0, RETURN_VOID)
                }
            }
        }
    }
}

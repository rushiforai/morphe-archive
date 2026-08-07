package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
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

private val ANALYTICS_ANCHOR_STRINGS = setOf(
    "e_request_none_oaid", "com.tantanapp.beatles", "miit_oaid",
    "add_payment_info", "com.google.android.gms.ads.identifier.service.START",
    "mmfile_push_statistic", "BatteryMetrics", "live-PerfTracer",
    "DNS_SLA", "_getOrCreate", "_compressRecordFile",
    "getSubmitAlternative", "android_id", "wlan0/address",
    "[IMEI]", "[MAC]", "[OAID]", "device_fingerprint",
)

private const val FOX_STATS_DEFAULT_ENV = "Lcom/tantanapp/foxstatistics/DefaultEnvironment;"
private const val ANALYTICS_TOTAL_EXPECTED = 14

@Suppress("unused")
@JvmField
val analyticsDisablePatch = bytecodePatch(
    name = "Analytics Disable",
    description = "Disables all analytics, telemetry, and device fingerprinting for privacy",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        val analyticsClasses = mutableMapOf<String, ClassDef>()

        classDefForEach { classDef ->
            if (analyticsClasses.size == ANALYTICS_TOTAL_EXPECTED) return@classDefForEach

            val found = mutableSetOf<String>()

            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (instr in impl.instructions) {
                    if (instr is ReferenceInstruction) {
                        val ref = instr.reference
                        if (ref is StringReference) {
                            val s = ref.string
                            if (s in ANALYTICS_ANCHOR_STRINGS) found.add(s)
                        }
                    }
                }
            }

            if ("e_request_none_oaid" in found) analyticsClasses.putIfAbsent("foxStats", classDef)
            if ("com.tantanapp.beatles" in found) analyticsClasses.putIfAbsent("beatles", classDef)
            if ("miit_oaid" in found) analyticsClasses.putIfAbsent("oaid", classDef)
            if ("add_payment_info" in found) analyticsClasses.putIfAbsent("firebaseAnalytics", classDef)
            if ("com.google.android.gms.ads.identifier.service.START" in found) analyticsClasses.putIfAbsent("googleAdId", classDef)
            if ("mmfile_push_statistic" in found) analyticsClasses.putIfAbsent("pushStats", classDef)
            if ("BatteryMetrics" in found) analyticsClasses.putIfAbsent("batteryMetrics", classDef)
            if ("live-PerfTracer" in found) analyticsClasses.putIfAbsent("moLiveApm", classDef)
            if ("DNS_SLA" in found) analyticsClasses.putIfAbsent("dnsSla", classDef)
            if ("getSubmitAlternative" in found) analyticsClasses.putIfAbsent("moLiveApm2", classDef)
            if ("_getOrCreate" in found && "_compressRecordFile" in found) analyticsClasses.putIfAbsent("moTracing", classDef)
            if ("[IMEI]" in found && "[MAC]" in found && "[OAID]" in found) analyticsClasses.putIfAbsent("deviceFingerprintCollector", classDef)
            if ("device_fingerprint" in found) analyticsClasses.putIfAbsent("deviceFingerprintHash", classDef)
            if ("android_id" in found && "wlan0/address" in found) analyticsClasses.putIfAbsent("deviceInfoCollector", classDef)
        }

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

        analyticsClasses["foxStats"]?.let { classDef ->
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

        analyticsClasses["beatles"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "install", "start") && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["firebaseAnalytics"]?.let { classDef ->
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

        analyticsClasses["googleAdId"]?.let { classDef ->
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

        analyticsClasses["pushStats"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "logPushEventInfo", "logRegCallback", "forceUpload") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["batteryMetrics"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name == "init" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["moLiveApm"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "start", "enable", "trace", "record", "report", "flush", "stop") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["dnsSla"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.name in setOf("init", "flush", "setEnable", "log", "setOnFlushListener") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["moTracing"]?.let { classDef ->
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

        analyticsClasses["moLiveApm2"]?.let { classDef ->
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

        analyticsClasses["deviceFingerprintCollector"]?.let { classDef ->
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

        analyticsClasses["deviceFingerprintHash"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["deviceInfoCollector"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                when (method.returnType) {
                    "Ljava/lang/String;" -> method.addInstructions(0, RETURN_EMPTY_STRING)
                    "V" -> method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        analyticsClasses["oaid"]?.let { classDef ->
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

        classDefForEach { classDef ->
            if (analyticsClasses.containsKey("coreEventLogger")) return@classDefForEach
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (instr in impl.instructions) {
                    if (instr is ReferenceInstruction) {
                        val ref = instr.reference
                        if (ref is MethodReference && ref.definingClass == FOX_STATS_DEFAULT_ENV) {
                            analyticsClasses["coreEventLogger"] = classDef
                            return@classDefForEach
                        }
                    }
                }
            }
        }

        analyticsClasses["coreEventLogger"]?.let { classDef ->
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
    }
}

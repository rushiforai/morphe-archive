package app.aidan.patches.prometronome.tracking

import app.aidan.patches.prometronome.shared.COMPATIBILITY_PRO_METRONOME
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.returnOptionalBoolean
import app.aidan.patches.shared.returnOptionalNullObject
import app.aidan.patches.shared.returnOptionalString
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val ZEROED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

@Suppress("unused")
val removeTrackingPatch = bytecodePatch(
    name = "Remove Tracking",
    description = "Neutralizes Umeng Analytics, Facebook App Events, Advertising ID harvesting, device fingerprinting, Bolts measurement events, and Google DataTransport telemetry.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_PRO_METRONOME)

    val disableFacebookEvents = booleanOption(
        key = "disableFacebookEvents",
        default = true,
        title = "Disable Facebook App Events",
        description = "Neutralizes Facebook SDK session logging, purchase tracking, and attribution identifiers."
    )

    val zeroAdvertisingId = booleanOption(
        key = "zeroAdvertisingId",
        default = true,
        title = "Zero Advertising ID",
        description = "Spoofs the Google Play Advertising ID client to return an all-zero identifier and force limit-ad-tracking."
    )

    val disableTelemetry = booleanOption(
        key = "disableTelemetry",
        default = true,
        title = "Disable Background Telemetry",
        description = "Neutralizes Bolts measurement events and Google DataTransport runtime schedulers."
    )

    val disableUmengAnalytics = booleanOption(
        key = "disableUmengAnalytics",
        default = true,
        title = "Disable Umeng Analytics",
        description = "Neutralizes Umeng Analytics initialization, session/page lifecycle tracking, and error reporting."
    )

    val neutralizeDeviceFingerprint = booleanOption(
        key = "neutralizeDeviceFingerprint",
        default = true,
        title = "Neutralize Device Fingerprinting",
        description = "Replaces hardware-derived device and preset UUIDs with random identifiers and returns an empty device ID."
    )

    execute {
        if (disableFacebookEvents.value != false) {
            disableOptionalVoidMethods(
                "Lcom/facebook/appevents/AppEventsLogger;",
                "activateApp",
                "deactivateApp",
                "logEvent",
                "logPurchase",
                "logSdkEvent",
                "flush",
                "setFlushBehavior",
                "onContextStop"
            )
            disableOptionalVoidMethods(
                "Lcom/facebook/internal/Utility;",
                "loadAppSettingsAsync"
            )
            disableOptionalVoidMethods(
                "Lcom/facebook/internal/FetchedAppSettingsManager;",
                "loadAppSettingsAsync"
            )
            returnOptionalNullObject(
                "Lcom/facebook/internal/AttributionIdentifiers;",
                "getAttributionIdentifiers"
            )
        }

        if (zeroAdvertisingId.value != false) {
            spoofAdvertisingId()
        }

        if (disableTelemetry.value != false) {
            disableOptionalVoidMethods(
                "Lbolts/MeasurementEvent;",
                "sendBroadcastEvent"
            )
            disableOptionalVoidMethods(
                "Lcom/google/android/datatransport/runtime/TransportImpl;",
                "send",
                "schedule"
            )
            neutralizeUploader()
        }

        if (disableUmengAnalytics.value != false) {
            disableOptionalVoidMethods(
                "Lcom/umeng/commonsdk/UMConfigure;",
                "init",
                "preInit",
                "setLogEnabled"
            )
            disableOptionalVoidMethods(
                "Lcom/umeng/analytics/MobclickAgent;",
                "onResume",
                "onPause",
                "onEvent",
                "onEventObject",
                "onEventValue",
                "reportError",
                "clearPreProperties",
                "registerPreProperties"
            )
            disableOptionalVoidMethods(
                "Lcom/eumlab/prometronome/baselib/ProMetronomeApplication;",
                "initUM"
            )
        }

        if (neutralizeDeviceFingerprint.value != false) {
            neutralizeDeviceFingerprinting()
        }
    }
}

private fun BytecodePatchContext.spoofAdvertisingId() {
    val aaidClass = mutableClassDefByOrNull("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;")
    if (aaidClass != null) {
        for (method in aaidClass.methods) {
            if (method.name == "getAdvertisingIdInfo" && method.implementation != null) {
                method.addInstructions(
                    0,
                    """
                    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                    const-string v1, "$ZEROED_ADVERTISING_ID"
                    const/4 v2, 0x1
                    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                    return-object v0
                    """.trimIndent()
                )
            }
        }
    }
    returnOptionalString(
        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;",
        "getId",
        ZEROED_ADVERTISING_ID
    )
    returnOptionalBoolean(
        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;",
        "isLimitAdTrackingEnabled",
        true
    )
}

private fun BytecodePatchContext.neutralizeUploader() {
    val uploaderClass = mutableClassDefByOrNull("Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/Uploader;") ?: return
    for (method in uploaderClass.methods) {
        if (method.name == "upload" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                if-eqz p3, :done
                invoke-interface {p3}, Ljava/lang/Runnable;->run()V
                :done
                return-void
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeDeviceFingerprinting() {
    returnOptionalString("Lcom/eumlab/prometronome/baselib/util/CommonUtil;", "getDeviceId", "")

    val commonUtilClass = mutableClassDefByOrNull("Lcom/eumlab/prometronome/baselib/util/CommonUtil;") ?: return
    for (method in commonUtilClass.methods) {
        if (method.name == "getUuid" && method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() && method.implementation != null && method.implementation!!.registerCount >= 1) {
            method.addInstructions(
                0,
                """
                invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
                move-result-object v0
                invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
        }
    }
}

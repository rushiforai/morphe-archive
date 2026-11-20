package app.aidan.patches.creditkarma.tracking

import app.aidan.patches.creditkarma.shared.COMPATIBILITY_CREDIT_KARMA
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.disableRequiredVoidMethods
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
    description = "Neutralizes Google Play Advertising ID tracking, Firebase Analytics, Datadog telemetry, Kochava attribution, New Relic, Luciq, root/emulator checks, and integrity attestation.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_CREDIT_KARMA)

    val zeroAdvertisingId = booleanOption(
        key = "zeroAdvertisingId",
        default = true,
        title = "Zero Advertising ID",
        description = "Spoofs the Google Play Advertising ID and Kochava client to return an all-zero identifier and force limit-ad-tracking."
    )

    val disableFirebaseAnalytics = booleanOption(
        key = "disableFirebaseAnalytics",
        default = true,
        title = "Disable Firebase Analytics",
        description = "Blocks Firebase Analytics and Google Play AppMeasurement event and property logging."
    )

    val disableCrashlytics = booleanOption(
        key = "disableCrashlytics",
        default = true,
        title = "Disable Crashlytics",
        description = "Neutralizes Firebase Crashlytics crash reporting and diagnostic logging."
    )

    val disableDatadog = booleanOption(
        key = "disableDatadog",
        default = true,
        title = "Disable Datadog Telemetry",
        description = "Blocks Datadog initialization, SDK logger, and background upload workers."
    )

    val disableKochava = booleanOption(
        key = "disableKochava",
        default = true,
        title = "Disable Kochava Tracker",
        description = "Neutralizes Kochava attribution, event tracking, and background jobs."
    )

    val disableScribe = booleanOption(
        key = "disableScribe",
        default = true,
        title = "Disable Scribe & Diagnostic Uploads",
        description = "Neutralizes Intuit Scribe telemetry and diagnostic log upload tasks."
    )

    val disableNewRelic = booleanOption(
        key = "disableNewRelic",
        default = true,
        title = "Disable New Relic Telemetry",
        description = "Blocks Credit Karma New Relic event collection and background upload scheduling."
    )

    val disableLuciqTelemetry = booleanOption(
        key = "disableLuciqTelemetry",
        default = true,
        title = "Disable Luciq Telemetry & Session Recording",
        description = "Neutralizes Luciq APM session updates, auto screen recording, and diagnostic screenshot collection."
    )

    val neutralizeRootDetection = booleanOption(
        key = "neutralizeRootDetection",
        default = true,
        title = "Neutralize Root & Emulator Detection",
        description = "Forces local root, su binary, build tags, and emulator detection checks to report clean across Luciq, MiSnap IAD, ThreatMetrix, and diagnostic loggers."
    )

    val neutralizeIntegrityAttestation = booleanOption(
        key = "neutralizeIntegrityAttestation",
        default = true,
        title = "Neutralize Integrity & Attestation Checks",
        description = "Bypasses NokNok Play Integrity and JailBreak signals, Firebase App Check Play Integrity provider, and ThreatMetrix APK self-hash, tamper code, and malicious app profiling."
    )

    execute {
        if (zeroAdvertisingId.value != false) {
            spoofAdvertisingId()
        }

        if (disableFirebaseAnalytics.value != false) {
            disableOptionalVoidMethods(
                "Lcom/google/firebase/analytics/FirebaseAnalytics;",
                "logEvent",
                "setAnalyticsCollectionEnabled",
                "setUserId",
                "setUserProperty",
                "resetAnalyticsData",
                "setDefaultEventParameters",
                "setConsent"
            )
            disableOptionalVoidMethods(
                "Lcom/google/android/gms/measurement/AppMeasurement;",
                "logEventInternal",
                "setUserPropertyInternal"
            )
        }

        if (disableCrashlytics.value != false) {
            disableOptionalVoidMethods(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "log",
                "recordException",
                "setCrashlyticsCollectionEnabled",
                "setUserId",
                "setCustomKey",
                "setCustomKeys",
                "sendUnsentReports",
                "deleteUnsentReports"
            )
            disableOptionalVoidMethods("Lvld;", "b")
        }

        if (disableDatadog.value != false) {
            disableOptionalVoidMethods(
                "Lcom/datadog/android/Datadog;",
                "initialize",
                "setTrackingConsent",
                "setUserInfo",
                "addUserProperties",
                "clearAllData"
            )
            disableOptionalVoidMethods(
                "Lio/scribeup/scribeupsdk/util/DatadogBootstrap;",
                "initialize"
            )
            returnOptionalNullObject(
                "Lio/scribeup/scribeupsdk/util/DatadogBootstrap;",
                "logger"
            )
            disableOptionalVoidMethods(
                "Lio/scribeup/scribeupsdk/util/ScribeUpLog;",
                "a", "b", "c", "d", "e", "i", "w"
            )
            neutralizeDatadogUploadWorker()
        }

        if (disableKochava.value != false) {
            disableOptionalVoidMethods(
                "Lcom/kochava/tracker/Tracker;",
                "e",
                "f",
                "d",
                "g",
                "start",
                "sendEvent",
                "setAppLimitAdTracking"
            )
        }

        if (disableScribe.value != false) {
            disableOptionalVoidMethods(
                "Lcom/intuit/mobile/scribe/ScribeClient;",
                "sendEvent",
                "track"
            )
            disableOptionalVoidMethods(
                "Lio/scribeup/scribeupsdk/data/repository/LoggingRepository;",
                "uploadHtmlFile"
            )
        }

        if (disableNewRelic.value != false) {
            disableRequiredVoidMethods(
                "Lcom/creditkarma/mobile/tracking/newrelic/b${'$'}a;",
                "b"
            )
        }

        if (disableLuciqTelemetry.value != false) {
            disableOptionalVoidMethods(
                "Lai/luciq/apm/APMPlugin;",
                "endSession",
                "updateCurrentSession"
            )
            disableOptionalVoidMethods(
                "Lai/luciq/bug/BugReporting;",
                "setAutoScreenRecordingEnabled",
                "setScreenshotByMediaProjectionEnabled"
            )
        }

        if (neutralizeRootDetection.value != false) {
            returnOptionalBoolean("Lcmy;", "h", false)
            returnOptionalBoolean("Lfv9;", "t", false)
            returnOptionalBoolean("Lai/luciq/library/model/State;", "isDeviceRooted", false)

            returnOptionalBoolean("Lcom/miteksystems/misnap/controller/iad/checker/b;", "c", false)
            returnOptionalBoolean("Lcom/miteksystems/misnap/controller/iad/checker/b;", "a", false)
            returnOptionalBoolean("Lcom/miteksystems/misnap/controller/iad/checker/b;", "b", false)
            returnOptionalBoolean("Lyfz;", "a", false)

            disableOptionalVoidMethods("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbbwbw;", "xx0078x0078x0078")
            neutralizeThreatMetrixRootScan()

            returnOptionalBoolean("Lru6;", "g", false)
            returnOptionalBoolean("Lru6;", "f", false)
            neutralizeBatteryEnvironmentCheck()
        }

        if (neutralizeIntegrityAttestation.value != false) {
            neutralizeNokNokPlayIntegrity()
            neutralizeNokNokJailBreakSignal()
            neutralizeFirebaseAppCheckPlayIntegrity()
            neutralizeThreatMetrixTamperAndSELinux()
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
    returnOptionalString(
        "Lcom/kochava/core/util/AdvertisingIdClient;",
        "getId",
        ZEROED_ADVERTISING_ID
    )
}

private fun BytecodePatchContext.neutralizeDatadogUploadWorker() {
    val workerClass = mutableClassDefByOrNull("Lcom/datadog/android/core/UploadWorker;") ?: return
    for (method in workerClass.methods) {
        if (method.name == "doWork" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                new-instance v0, Landroidx/work/c${'$'}a${'$'}c;
                invoke-direct {v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>()V
                return-object v0
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeThreatMetrixRootScan() {
    val bClass = mutableClassDefByOrNull("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbbbb;") ?: return
    for (method in bClass.methods) {
        if (method.name == "uuu007500750075u" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeBatteryEnvironmentCheck() {
    val ks8Class = mutableClassDefByOrNull("Lks8;") ?: return
    for (method in ks8Class.methods) {
        if (method.name == "d" && method.returnType == "Lpxg;" && method.parameterTypes.isEmpty() && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x1
                invoke-static {v0}, Lpxg;->b(Z)Lpxg;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeNokNokPlayIntegrity() {
    val piClass = mutableClassDefByOrNull("Lcom/noknok/android/client/extension/PlayIntegrity;") ?: return
    for (method in piClass.methods) {
        if (method.name == "start" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                iput-boolean v0, p0, Lcom/noknok/android/client/extension/PlayIntegrity;->a:Z
                return-void
                """.trimIndent()
            )
        }
        if (method.name == "finishAsync" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p3, v1, v0}, Lcom/noknok/android/client/utils/ICompletionCallback;->onComplete(Ljava/lang/Object;Ljava/lang/Throwable;)V
                return-void
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeNokNokJailBreakSignal() {
    disableOptionalVoidMethods("Lcom/noknok/android/client/extension/JailBreakRiskSignal;", "start")
    val jbClass = mutableClassDefByOrNull("Lcom/noknok/android/client/extension/JailBreakRiskSignal;") ?: return
    for (method in jbClass.methods) {
        if (method.name == "finishAsync" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p3, v1, v0}, Lcom/noknok/android/client/utils/ICompletionCallback;->onComplete(Ljava/lang/Object;Ljava/lang/Throwable;)V
                return-void
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeFirebaseAppCheckPlayIntegrity() {
    val registrarClass =
        mutableClassDefByOrNull("Lcom/google/firebase/appcheck/playintegrity/FirebaseAppCheckPlayIntegrityRegistrar;")
            ?: return
    for (method in registrarClass.methods) {
        if (method.name == "getComponents" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.neutralizeThreatMetrixTamperAndSELinux() {
    disableOptionalVoidMethods("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbwbw;", "xx0078x0078x0078")
    disableOptionalVoidMethods("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/gnnnggg;", "xx0078x0078x0078")
    disableOptionalVoidMethods("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbbbwb;", "xx0078x0078x0078")

    val bClass = mutableClassDefByOrNull("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbbbb;") ?: return
    for (method in bClass.methods) {
        if (method.name == "n006En006Ennn" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                sget-object v0, Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbwwbw;->ENFORCING:Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbwwbw;
                return-object v0
                """.trimIndent()
            )
        }
    }
}

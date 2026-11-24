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
    description = "Neutralizes Google Play Advertising ID tracking, Firebase Analytics, Crashlytics, Datadog telemetry, Kochava attribution, New Relic, Segment, Qualtrics, root/emulator checks, and integrity attestation.",
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

    val disableSegmentAnalytics = booleanOption(
        key = "disableSegmentAnalytics",
        default = true,
        title = "Disable Segment Analytics",
        description = "Blocks Segment event, screen, identity, and lifecycle collection used by the Intuit UXFabric clickstream."
    )

    val disableQualtrics = booleanOption(
        key = "disableQualtrics",
        default = true,
        title = "Disable Qualtrics Feedback Tracking",
        description = "Blocks Qualtrics project initialization, intercept evaluation, and view-visit tracking."
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
                "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;",
                "logEvent"
            )
            disableOptionalVoidMethods(
                "Lcom/google/android/gms/measurement/AppMeasurement;",
                "logEventInternal"
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
            neutralizeCrashlyticsCollection()
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
                "log", "logException"
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

        if (disableSegmentAnalytics.value != false) {
            disableOptionalVoidMethods(
                "Lcom/segment/analytics/Analytics;",
                "track",
                "screen",
                "identify",
                "group",
                "alias",
                "flush",
                "run",
                "runOnMainThread",
                "performRun",
                "fillAndEnqueue",
                "recordScreenViews",
                "trackApplicationLifecycleEvents",
                "reset",
                "performInitializeIntegrations"
            )
            disableOptionalVoidMethods(
                "Lxpa;",
                "track",
                "trackEvent",
                "flush",
                "reset"
            )
        }

        if (disableQualtrics.value != false) {
            disableOptionalVoidMethods(
                "Lcom/qualtrics/digital/Qualtrics;",
                "initialize",
                "initializeProject",
                "registerViewVisit"
            )
            returnOptionalBoolean("Lcom/qualtrics/digital/Qualtrics;", "display", false)
            returnOptionalBoolean("Lcom/qualtrics/digital/Qualtrics;", "displayIntercept", false)
            returnOptionalBoolean("Lcom/qualtrics/digital/Qualtrics;", "displayTarget", false)
        }

        if (neutralizeRootDetection.value != false) {
            returnOptionalBoolean("Lcom/miteksystems/misnap/controller/iad/checker/b;", "c", false)
            returnOptionalBoolean("Lcom/miteksystems/misnap/controller/iad/checker/b;", "a", false)
            returnOptionalBoolean("Lcom/miteksystems/misnap/controller/iad/checker/b;", "b", false)
            returnOptionalBoolean("Lvu10;", "a", false)
            returnOptionalBoolean("Lop7;", "f", false)
            returnOptionalBoolean("Lop7;", "g", false)

            disableOptionalVoidMethods("Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbbwbw;", "xx0078x0078x0078")
            neutralizeThreatMetrixRootScan()
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
        val isDoWork = method.name == "doWork"
        val isMinifiedDoWork =
            method.name == "a" && method.returnType == "Landroidx/work/c${'$'}a${'$'}c;"
        if (!isDoWork && !isMinifiedDoWork) continue
        if (method.implementation == null) continue
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

private fun BytecodePatchContext.neutralizeCrashlyticsCollection() {
    // Minified Crashlytics API: b(Z) is setCrashlyticsCollectionEnabled.
    val apiClass = mutableClassDefByOrNull("Lxhf;")
    if (apiClass != null) {
        for (method in apiClass.methods) {
            if (method.name != "b" || method.returnType != "V") continue
            if (method.parameterTypes.size != 1 || method.parameterTypes[0] != "Z") continue
            if (method.implementation == null) continue
            method.addInstructions(0, "const/4 p1, 0x0")
        }
    }

    // Minified Crashlytics core: report assembly and upload entry points.
    disableOptionalVoidMethods("Ltt8;", "b", "c", "d", "g", "h")
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

package app.aidan.patches.adobereader.ads

import app.aidan.patches.adobereader.shared.COMPATIBILITY_ADOBE_READER
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.isEnabled
import app.aidan.patches.shared.returnOptionalBoolean
import app.aidan.patches.shared.returnOptionalNullObject
import app.aidan.patches.shared.returnOptionalString
import app.aidan.patches.shared.returnOptionalUnit
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val ZEROED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove Ads and Tracking",
    description = "Disables Adobe MobileCore, EventHub, Document Cloud Analytics (DCMAnalytics and ARDCMAnalytics), Adobe Growth Platform (DGP/MAU), Adobe Journey Optimizer (AJO), Branch deep-link attribution, Creative SDK, Next Best Action (NBA) tools profiling, Facebook App Events, Firebase Performance, Firebase Sessions, and Crashlytics telemetry; suppresses Google Mobile Ads (AdMob), interstitials, rewarded ads, banner pools, paywalls, and in-app reviews; removes telemetry preferences; and zeroes the Google Play Advertising ID.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_ADOBE_READER)
    extendWith("extensions/extension.mpe")

    val removeTracking = booleanOption(
        key = "removeTracking",
        default = true,
        title = "Disable Telemetry & Tracking",
        description = "Disables Adobe MobileCore, EventHub, Document Cloud Analytics (DCMAnalytics and ARDCMAnalytics), Adobe Growth Platform (DGP/MAU), Adobe Journey Optimizer (AJO), Branch attribution, Creative SDK, Next Best Action (NBA) tools profiling, Facebook App Events, Firebase Performance, Firebase Sessions, Crashlytics, and zeroes the Google Play Advertising ID."
    )

    val removeAds = booleanOption(
        key = "removeAds",
        default = true,
        title = "Disable In-App Ads & Paywalls",
        description = "Disables in-app ads (AdMob banners, native ads, document-close interstitials, rewarded edit interstitials, and prefetching), ad performance metrics, ad analytics, dynamic paywalls, and in-app review prompts."
    )
    val removeSettings = booleanOption(
        key = "removeSettings",
        default = true,
        title = "Remove Settings",
        description = "Removes the Send usage info and Send crash reports preferences from the Preferences menu, and suppresses crash reporting dialogs."
    )

    execute {
        if (removeTracking.isEnabled) {
            // Master telemetry switch: ARDCMAnalytics.trackAction guards on F.a0()Z
            returnOptionalBoolean("Lcom/adobe/reader/F;", "a0", false)

            // Adobe MobileCore & Experience Platform EventHub
            disableOptionalVoidMethods(
                "Lcom/adobe/marketing/mobile/internal/eventhub/EventHub;",
                "F",
                "H",
                "h0"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/marketing/mobile/S;",
                "a",
                "b",
                "c",
                "d",
                "e",
                "i",
                "j",
                "m",
                "p",
                "q",
                "r",
                "s"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/marketing/mobile/MobileCoreInitializer;",
                "c",
                "d"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/marketing/mobile/MobileCore;",
                "h",
                "i",
                "j"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/marketing/mobile/Target;",
                "a"
            )

            // Document Cloud Analytics (DCMAnalytics & ARDCMAnalytics)
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/analytics/ARDCMAnalytics;",
                "trackAction",
                "K2",
                "i3"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/dcmanalytics/DCMAnalytics;",
                "A1",
                "B1",
                "C1",
                "M0",
                "N0",
                "z1",
                "q1",
                "s1",
                "w1",
                "y1"
            )
            returnOptionalBoolean("Lcom/adobe/dcmanalytics/DCMAnalytics;", "e1", false)
            returnOptionalBoolean("Lcom/adobe/dcmanalytics/DCMAnalytics;", "g1", false)
            returnOptionalBoolean("Lcom/adobe/dcmanalytics/DCMAnalytics;", "S0", false)

            // In-App Analytics & App Launch Analytics
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/analytics/ARInAppAnalytics;",
                "d",
                "e",
                "f",
                "g"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/analytics/ARAppLaunchAnalytics;",
                "e"
            )

            // Adobe Growth Platform (DGP / MAU)
            disableOptionalVoidMethods(
                "Lcom/adobe/dgp/e;",
                "b",
                "onStart",
                "onStop",
                "onDestroy"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/dgp/DGPMau;",
                "dispatchMau",
                "dispatchMauInternal",
                "onBackground",
                "onForeground",
                "onEmbeddedMau"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/dgp/DGPAEPBridge;",
                "onRegistered",
                "onUnregistered"
            )
            returnOptionalBoolean("Lcom/adobe/dgp/DGPAEPBridge;", "readyForEvent", false)
            returnOptionalBoolean("Lcom/adobe/dgp/DGPAEPBridge;", "isExtensionRegistered", false)

            // Adobe Journey Optimizer (AJO) & Ingestion
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/ajo/ARAJOManager;",
                "F",
                "A",
                "E",
                "y",
                "z"
            )
            disableOptionalVoidMethods("Lcom/adobe/reader/ajo/f;", "l")
            disableOptionalVoidMethods("Lcom/adobe/dcmanalytics/ajo/AJOHelper;", "b", "onRegistered")
            returnOptionalBoolean("Lcom/adobe/dcmanalytics/ajo/AJOHelper;", "readyForEvent", false)

            // Next Best Action (NBA) Tools Usage Profiling
            returnOptionalUnit("Lcom/adobe/libs/nba/repos/ARNbaRepo;", "b")

            // Preferences change listeners for usage info and crash reports
            disableOptionalVoidMethods("Lcom/adobe/reader/settings/D0;", "M7", "b5")

            // Crash reporting and diagnostics client
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/utils/v;",
                "E0",
                "q0",
                "x0",
                "v0",
                "w0",
                "y0"
            )
            returnOptionalBoolean("Lcom/adobe/reader/utils/v;", "m0", false)
            disableOptionalVoidMethods("Lem/a;", "b", "c")
            disableOptionalVoidMethods("Lcom/adobe/reader/misc/l;", "onCreateDialog", "show")

            // Frame and UI Jank performance metrics
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/performance/ARActivityFrameMetrics;",
                "onActivityStarted",
                "onActivityStopped",
                "onActivityResumed",
                "onActivityPaused"
            )

            // Branch deep-link attribution & event tracker
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/utils/ARBranchEventTracker;",
                "c",
                "d",
                "e",
                "g",
                "h",
                "i"
            )
            returnOptionalBoolean("Lcom/adobe/reader/utils/ARBranchEventTracker;", "b", false)
            returnOptionalBoolean("Lcom/adobe/reader/utils/ARBranchEventTracker;", "f", false)
            setBranchTrackingDisabled()

            // Creative SDK Analytics & ETS ingestion
            disableOptionalVoidMethods(
                "Lcom/adobe/creativesdk/foundation/internal/analytics/b;",
                "b"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/creativesdk/foundation/internal/analytics/c;",
                "b"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/creativesdk/foundation/internal/analytics/n;",
                "a",
                "b",
                "c"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/creativesdk/foundation/internal/analytics/g;",
                "b"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsETSJob;",
                "onRun"
            )
            returnOptionalNullObject("Lcom/adobe/creativesdk/foundation/internal/analytics/e;", "g")

            // Facebook App Events & Privacy Sandbox attribution/topics
            returnOptionalBoolean("Lcom/facebook/internal/FacebookInitProvider;", "onCreate", false)
            disableOptionalVoidMethods(
                "Lcom/facebook/appevents/AppEventsLoggerImpl;",
                "d",
                "e",
                "g",
                "h"
            )
            disableOptionalVoidMethods(
                "Lcom/facebook/appevents/AppEventsLoggerImpl${'$'}Companion;",
                "a"
            )
            disableOptionalVoidMethods(
                "Lcom/facebook/appevents/AppEventsLogger;",
                "activateApp",
                "deactivateApp",
                "logEvent",
                "logPurchase",
                "flush",
                "setFlushBehavior"
            )
            disableOptionalVoidMethods("Lcom/facebook/appevents/gps/ara/GpsAraTriggersManager;", "a")
            disableOptionalVoidMethods("Lcom/facebook/appevents/gps/topics/GpsTopicsManager;", "a")

            // Firebase Performance & Sessions
            returnOptionalBoolean("Lcom/google/firebase/perf/provider/FirebasePerfProvider;", "onCreate", false)
            disableOptionalVoidMethods(
                "Lcom/google/firebase/perf/metrics/AppStartTrace;",
                "onActivityCreated",
                "onActivityStarted",
                "onActivityResumed"
            )
            returnOptionalBoolean("Lcom/google/firebase/sessions/SessionFirelogPublisherImpl;", "h", false)
            disableOptionalVoidMethods("Lcom/google/firebase/sessions/SessionFirelogPublisherImpl;", "a", "g")

            // Firebase Analytics, Scion / Measurement & Crashlytics
            disableOptionalVoidMethods(
                "Lcom/google/android/gms/internal/measurement/zzee;",
                "E",
                "D",
                "e",
                "f"
            )
            disableOptionalVoidMethods(
                "Lcom/google/android/gms/measurement/AppMeasurement;",
                "logEventInternal",
                "setUserPropertyInternal"
            )
            disableOptionalVoidMethods(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "setCrashlyticsCollectionEnabled",
                "deleteUnsentReports",
                "log",
                "recordException",
                "sendUnsentReports",
                "setCustomKey",
                "setCustomKeys",
                "setUserId"
            )
            returnOptionalBoolean(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "didCrashOnPreviousExecution",
                false
            )

            // Google Play Advertising ID client spoofing
            spoofAdvertisingId()

            // Install Referrer listeners
            disableOptionalVoidMethods(
                "Lcom/android/installreferrer/api/InstallReferrerClientImpl;",
                "startConnection"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/misc/ARInstallReferrerBroadcastReceiver;",
                "onMAMReceive"
            )
        }

        if (removeAds.isEnabled) {
            // In-App Ads Engine: disable ad display policy and device enablement
            returnOptionalBoolean("Lcom/adobe/reader/ads/utils/ARAdUtils;", "r0", false)
            returnOptionalBoolean("Lcom/adobe/reader/ads/utils/ARAdUtils;", "l0", false)
            returnOptionalBoolean("Lcom/adobe/reader/ads/utils/ARAdUtils;", "O", false)
            returnOptionalBoolean("Lcom/adobe/reader/ads/utils/ARAdUtils;", "W", false)
            returnOptionalBoolean("Lcom/adobe/reader/ads/utils/ARAdUtils;", "N", false)
            returnOptionalBoolean("Lcom/adobe/reader/ads/utils/ARAdUtils;", "C0", false)
            disableOptionalVoidMethods("Lcom/adobe/reader/ads/g;", "g", "e")
            disableOptionalVoidMethods("Lcom/adobe/reader/ads/ARBannerAdsPool;", "g", "n")
            returnOptionalBoolean("Lcom/adobe/reader/ads/l;", "c", false)
            returnOptionalBoolean("Lcom/adobe/reader/ads/l;", "d", false)

            // In-App Ad Analytics & Performance metrics
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/ads/analytics/ARAdAnalytics;",
                "l",
                "f",
                "g",
                "h",
                "i",
                "j",
                "k"
            )
            disableOptionalVoidMethods(
                "Lcom/adobe/reader/ads/performance/a;",
                "f",
                "g",
                "h",
                "i",
                "j",
                "k",
                "l"
            )

            // In-App Review prompts
            suppressInAppReview()

            // Dynamic Paywalls & Promotions
            returnOptionalBoolean(
                "Lcom/adobe/reader/marketingPages/dynamicPaywall/ARDynamicPaywallManager;",
                "P",
                false
            )
            returnOptionalBoolean(
                "Lcom/adobe/reader/marketingPages/dynamicPaywall/ARDynamicPaywallManager;",
                "S",
                false
            )
            returnOptionalBoolean(
                "Lcom/adobe/reader/marketingPages/dynamicPaywall/ARDynamicPaywallManager;",
                "T",
                false
            )
        }
        if (removeSettings.isEnabled) {
            hideTelemetrySettings()
            patchCrashReportsDialog()
        }
    }
}

private const val SETTINGS_BRIDGE = "Lapp/aidan/extension/adobereader/SettingsBridge;"

private fun BytecodePatchContext.hideTelemetrySettings() {
    val d0Class = mutableClassDefByOrNull("Lcom/adobe/reader/settings/D0;") ?: return

    for (method in d0Class.methods) {
        if (method.name == "onViewCreated" && method.implementation != null) {
            val instructions = method.implementation?.instructions ?: continue
            val lastIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (lastIndex >= 0) {
                method.addInstructions(
                    lastIndex,
                    "invoke-static/range {p0 .. p0}, $SETTINGS_BRIDGE->hideTelemetryPreferences(Ljava/lang/Object;)V"
                )
            }
        }
    }
}

private fun BytecodePatchContext.patchCrashReportsDialog() {
    disableOptionalVoidMethods("Lcom/adobe/reader/misc/l;", "onCreateDialog", "show")
    disableOptionalVoidMethods("Lcom/adobe/reader/utils/v;", "E0")
    val dialogClass = mutableClassDefByOrNull("Lcom/adobe/reader/misc/l;") ?: return
    for (method in dialogClass.methods) {
        if (method.name == "onStart" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                invoke-super {p0}, Landroidx/fragment/app/l;->onStart()V
                invoke-virtual {p0}, Landroidx/fragment/app/l;->dismiss()V
                return-void
                """.trimIndent()
            )
        }
    }
}

private fun BytecodePatchContext.setBranchTrackingDisabled() {
    val branchClass = mutableClassDefByOrNull("Lio/branch/referral/Branch;") ?: return
    for (method in branchClass.methods) {
        if (method.name == "C0" && method.parameterTypes == listOf("Z") && method.returnType == "V" && method.implementation != null) {
            val isStatic = (method.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.STATIC.value) != 0
            val paramReg = if (isStatic) "p0" else "p1"
            method.addInstructions(
                0,
                "const/4 $paramReg, 0x1"
            )
        }
    }
}

private fun BytecodePatchContext.suppressInAppReview() {
    val reviewClass = mutableClassDefByOrNull("Lcom/google/android/play/core/review/d;") ?: return
    for (method in reviewClass.methods) {
        if (method.name == "b" && method.returnType == "Lcom/google/android/gms/tasks/Task;" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                new-instance v0, Ljava/lang/Exception;
                invoke-direct {v0}, Ljava/lang/Exception;-><init>()V
                invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
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

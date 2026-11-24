package app.aidan.patches.geocaching.tracking

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.disableRequiredVoidMethodsByName
import app.aidan.patches.shared.returnOptionalNullObject
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

val removeTrackingAndAnalyticsPatch = bytecodePatch(
    name = "Remove Tracking and Analytics",
    description = "Neutralizes first-party analytics (AnalyticsRepo), Google Analytics / Firebase (Analytics, Crashlytics, Performance, In-App Messaging), Facebook App Events dispatch, Iterable marketing telemetry, Usercentrics consent collection, and zeros the Google Play Advertising ID (AAID).",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_GEOCACHING)

    val stripCrashlytics = booleanOption(
        key = "stripCrashlytics",
        default = true,
        title = "Disable Firebase Crashlytics",
        description = "Neutralizes Firebase Crashlytics diagnostic telemetry and crash reporting."
    )
    val stripFacebook = booleanOption(
        key = "stripFacebook",
        default = true,
        title = "Disable Facebook Telemetry",
        description = "Neutralizes Facebook App Events SDK logging and activation pings."
    )
    val stripIterable = booleanOption(
        key = "stripIterable",
        default = true,
        title = "Disable Iterable Marketing Telemetry",
        description = "Neutralizes Iterable marketing SDK event and push tracking."
    )
    val stripUsercentrics = booleanOption(
        key = "stripUsercentrics",
        default = true,
        title = "Disable Usercentrics Consent Telemetry",
        description = "Neutralizes Usercentrics consent management and tracking telemetry."
    )

    execute {
        // Layer 1: Google Play Advertising ID (AAID) Spoofing
        spoofAdvertisingId()

        // Layer 2: Centralized First-Party Analytics (AnalyticsRepo & web bridge)
        disableRequiredVoidMethodsByName(
            "Lcom/groundspeak/geocaching/intro/analytics/firebase/AnalyticsRepo;",
            "a", "b", "e", "f", "g", "h", "i", "j", "k", "l", "m"
        )
        disableRequiredVoidMethods(
            "Lcom/groundspeak/geocaching/intro/analytics/firebase/AnalyticsRepo\$a;",
            "a"
        )
        disableRequiredVoidMethods(
            "Lcom/groundspeak/geocaching/intro/analytics/firebase/AnalyticsWebInterface;",
            "logEvent"
        )

        // Layer 3: Firebase Analytics & Measurement Neutralization
        // All app call sites (analytic repo, billing, login, map, filter, details) funnel through
        // FirebaseAnalytics, including the 65 direct logEvent calls that bypass AnalyticsRepo.
        disableRequiredVoidMethodsByName(
            "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            "logEvent",
            "setAnalyticsCollectionEnabled",
            "setUserProperty",
            "setDefaultEventParameters",
            "setSessionTimeoutDuration",
            "setUserId"
        )
        returnOptionalNullObject(
            "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            "getAppInstanceId"
        )
        disableRequiredVoidMethods(
            "Lcom/google/firebase/perf/FirebasePerformance;",
            "setPerformanceCollectionEnabled"
        )
        disableRequiredVoidMethodsByName(
            "Lcom/google/firebase/inappmessaging/FirebaseInAppMessaging;",
            "setAutomaticDataCollectionEnabled",
            "setMessagesSuppressed"
        )

        // Layer 4: Firebase Crashlytics Neutralization
        if (stripCrashlytics.value != false) {
            disableRequiredVoidMethodsByName(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "log",
                "recordException",
                "setUserId",
                "setCustomKey",
                "setCrashlyticsCollectionEnabled"
            )
            disableRequiredVoidMethodsByName(
                "Lcom/groundspeak/geocaching/intro/analytics/crashlytics/a;",
                "a", "b", "c", "d", "e"
            )
        }

        // Layer 5: Facebook App Events Neutralization.
        // 10.24.0 no longer exposes AppEventsLogger to app code (R8 removed the public API; only
        // login/share remains reachable), so the remaining event dispatch and flush funnels in
        // com.facebook.appevents are neutralized instead.
        if (stripFacebook.value != false) {
            disableOptionalVoidMethods(
                "Lcom/facebook/appevents/b;",
                "d", "e"
            )
            disableOptionalVoidMethods(
                "Lcom/facebook/internal/FetchedAppSettingsManager;",
                "loadAppSettingsAsync"
            )
        }

        // Layer 6: Iterable Telemetry Neutralization.
        // p = events/track; r/u/q/s/t/h = in-app + push-open tracking; m/n/b/o/l = profile and
        // device registration updates (users/update, users/disableDevice).
        if (stripIterable.value != false) {
            disableRequiredVoidMethods(
                "Lcom/iterable/iterableapi/d;",
                "p"
            )
            disableOptionalVoidMethods(
                "Lcom/iterable/iterableapi/d;",
                "b", "h", "l", "m", "n", "o", "q", "r", "s", "t", "u"
            )
        }

        // Layer 7: Usercentrics Consent Telemetry Neutralization
        if (stripUsercentrics.value != false) {
            disableOptionalVoidMethods(
                "Lcom/groundspeak/geocaching/intro/permissions/usercentrics/a;",
                "j"
            )
        }
    }
}

private const val SPOOFED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

private fun BytecodePatchContext.spoofAdvertisingId(
    classDescriptor: String = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;"
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (
            method.name == "getAdvertisingIdInfo" &&
            method.returnType == "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;" &&
            method.implementation != null
        ) {
            val alreadySpoofed = method.implementation?.instructions?.any { inst ->
                (inst as? ReferenceInstruction)?.reference?.toString() == SPOOFED_ADVERTISING_ID
            } == true
            if (!alreadySpoofed) {
                method.addInstructions(
                    0,
                    """
                    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                    const-string v1, "$SPOOFED_ADVERTISING_ID"
                    const/4 v2, 0x1
                    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                    return-object v0
                    """.trimIndent()
                )
            }
        }
    }

    val infoClass = mutableClassDefByOrNull(
        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"
    ) ?: return
    val getId = infoClass.methods.firstOrNull {
        it.name == "getId" && it.returnType == "Ljava/lang/String;" && it.implementation != null
    }
    if (getId != null &&
        getId.implementation?.instructions?.none { inst ->
            (inst as? ReferenceInstruction)?.reference?.toString() == SPOOFED_ADVERTISING_ID
        } != false
    ) {
        getId.addInstructions(
            0,
            """
            const-string v0, "$SPOOFED_ADVERTISING_ID"
            return-object v0
            """.trimIndent()
        )
    }
    val limitAdTracking = infoClass.methods.firstOrNull {
        it.name == "isLimitAdTrackingEnabled" && it.returnType == "Z" && it.implementation != null
    }
    limitAdTracking?.addInstructions(
        0,
        """
        const/4 v0, 0x1
        return v0
        """.trimIndent()
    )
}

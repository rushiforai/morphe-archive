package app.template.patches.meesho.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Block analytics / marketing telemetry in Meesho (com.meesho.supply).
//
// εxodus report 766078 (Meesho 28.8, Google Play) finds 5 trackers:
//   AppsFlyer, Facebook Analytics, Facebook Share, Google Crashlytics,
//   Google Firebase Analytics.
// The manifest additionally carries Mixpanel MPConfig meta-data, Facebook
// SDK app id/client token, Truecaller SDK client id, and GMS
// AppMeasurement services.
//
// Approach: no-op the *call sites* into analytics SDKs rather than gutting
// the SDKs. Every targeted method returns void, so replacing the invoke with
// `nop` cannot leave a dangling move-result or change control flow.
//
// Deliberately NOT touched:
//   • FCM push (com.meesho.pushnotify.MyFcmService,
//     com.google.firebase.messaging.FirebaseMessagingService) — notifications
//     keep working.
//   • AppsFlyer install attribution itself (SingleInstallBroadcastReceiver /
//     INSTALL_REFERRER) — only in-app event logging is silenced.
//   • com.shield.android (anti-fraud) and payment/login SDKs (JusPay,
//     Truecaller, Otpless, Verloop) — breaking those breaks checkout/login.
//
// Fail-safe: if an SDK is absent or a method name changed, nothing matches and
// that SDK keeps stock behavior.

private data class AnalyticsSdk(
    val ownerPrefix: String,
    val methods: Set<String>,
)

private val ANALYTICS_SDKS = listOf(
    AnalyticsSdk(
        ownerPrefix = "Lcom/appsflyer/AppsFlyerLib;",
        methods = setOf("logEvent", "logPurchase", "logSession"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/mixpanel/android/mpmetrics/MixpanelAPI;",
        methods = setOf(
            "track",
            "identify",
            "alias",
            "registerSuperProperties",
            "unregisterSuperProperty",
            "reset",
        ),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/facebook/appevents/AppEventsLogger;",
        methods = setOf("logEvent", "logPurchase"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
        methods = setOf("logEvent", "setUserProperty", "setUserId", "setCurrentScreen"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/google/android/gms/measurement/AppMeasurement;",
        methods = setOf("logEvent", "setUserProperty", "setUserId", "setCurrentScreen"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
        methods = setOf("recordException", "setCustomKey", "setUserId", "log"),
    ),
)

@Suppress("unused")
val meeshoBlockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "No-ops AppsFlyer, Mixpanel, Facebook App Events, Firebase Analytics, " +
        "GMS AppMeasurement and Crashlytics logging in Meesho. Push notifications " +
        "and login/payments keep working.",
    default = true,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        classDefForEach { classDef ->
            classDef.methods.forEach methodLoop@ { method ->
                val implementation = method.implementation ?: return@methodLoop
                val callSites = mutableListOf<Int>()

                implementation.instructions.forEachIndexed instructionLoop@ { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@instructionLoop

                    if (reference.returnType != "V") return@instructionLoop

                    val isTarget = ANALYTICS_SDKS.any { sdk ->
                        reference.definingClass.startsWith(sdk.ownerPrefix) &&
                            reference.name in sdk.methods
                    }
                    if (!isTarget) return@instructionLoop

                    callSites += index
                }

                if (callSites.isEmpty()) return@methodLoop

                val mutableMethod = mutableClassDefByOrNull(classDef.type)?.findMutableMethodOf(method)
                    ?: return@methodLoop
                callSites
                    .sortedDescending()
                    .forEach { index -> mutableMethod.replaceInstruction(index, "nop") }
            }
        }
    }
}

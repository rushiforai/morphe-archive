package app.template.patches.mubi.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Block analytics / marketing telemetry in MUBI.
//
// Static analysis of a merged com.mubi build (Dec 2024, targetSdk 34) shows
// Braze (formerly Appboy) is embedded, including its Content Cards, in-app
// message, web-view and push-trampoline activities. MUBI also uses Google Play
// Billing and the Cast SDK; neither is touched here.
//
// Approach: no-op the *call sites* into analytics SDKs rather than gutting the
// SDKs themselves. Every targeted method returns void, so replacing the invoke
// with `nop` cannot leave a move-result or an uninitialized value behind, and
// it cannot change control flow. This is intentionally more conservative than
// clearing bodies inside third-party classes.
//
// Covered SDKs, matched by owner prefix so both public and internal variants of
// the same SDK are caught:
//
//   • Braze / Appboy  — custom events, purchases, Content Cards refresh, flushes
//   • Firebase Analytics / GMS AppMeasurement — events, user properties, screen views
//   • AppsFlyer       — in-app events (attribution start is deliberately kept)
//   • Adjust          — events and revenue
//   • Facebook App Events
//   • Segment         — track/screen/identify/group
//
// Push notifications (FCM) and Braze's push delivery are not touched: the patch
// only suppresses outbound event logging and card fetching. Account, login and
// playback APIs are untouched.
//
// Fail-safe: if an SDK is absent, or a future build changes the method names,
// nothing matches and the patch has no effect for that SDK.

private data class AnalyticsSdk(
    val ownerPrefix: String,
    val methods: Set<String>,
)

private val ANALYTICS_SDKS = listOf(
    AnalyticsSdk(
        ownerPrefix = "Lcom/braze/Braze;",
        methods = setOf(
            "logCustomEvent",
            "logPurchase",
            "requestContentCardsRefresh",
            "requestImmediateDataFlush",
        ),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/appboy/Appboy;",
        methods = setOf(
            "logCustomEvent",
            "logPurchase",
            "requestContentCardsRefresh",
            "requestImmediateDataFlush",
        ),
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
        ownerPrefix = "Lcom/appsflyer/AppsFlyerLib;",
        methods = setOf("logEvent", "logPurchase"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/adjust/sdk/Adjust;",
        methods = setOf("trackEvent", "trackRevenue"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/facebook/appevents/AppEventsLogger;",
        methods = setOf("logEvent", "logPurchase"),
    ),
    AnalyticsSdk(
        ownerPrefix = "Lcom/segment/analytics/Analytics;",
        methods = setOf("track", "screen", "identify", "group"),
    ),
)

@Suppress("unused")
val mubiBlockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "No-ops Braze, Firebase Analytics, AppsFlyer, Adjust, Facebook App Events " +
        "and Segment logging in MUBI. Push notifications and account features keep working.",
    default = true,
) {
    compatibleWith(MUBI_COMPATIBILITY)

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

package app.template.patches.pinterest

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PINTEREST_COMPATIBILITY

/**
 * Pinterest 14.41.0 bundles slim/old variants of two third-party
 * data-collection stacks, with these EXACT live entry points (all verified
 * against the real build, vc 14418020):
 *
 * - Firebase Analytics, legacy scion-shim flavor: the public class only
 *   exposes setCurrentScreen(Activity, String, String) for app-driven
 *   tracking (plus getFirebaseInstanceId/or the scion backend getter, both
 *   used by infra). Returning from setCurrentScreen removes every explicit
 *   Firebase screen/event logging call upstream of it.
 * - AppsFlyer: the public facade AppsFlyerLib is ABSTRACT in this build;
 *   the concrete engine is com.appsflyer.internal.AFa1tSDK. Its start(...)
 *   launches install/activation attribution and logEvent(...) forwards
 *   in-app events. Both become no-ops.
 *
 * Returning early from void SDK methods can never produce nulls downstream,
 * so this is the zero-risk tracker kill. Push notifications (Firebase
 * Messaging) and app identity (Installations) are untouched. Note: Firebase
 * auto-collection toggling (the manifest switch) is not part of this patch;
 * the kills above cover everything Pinterest code can explicitly trigger.
 */
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics and data collection",
    description = "No-ops Firebase screen/event tracking and AppsFlyer attribution + event logging " +
        "(concrete SDK entry points, verified in 14.41.0). Push notifications keep working; " +
        "Pinterest features are untouched.",
    default = true,
) {
    compatibleWith(PINTEREST_COMPATIBILITY)

    execute {
        // Firebase Analytics (legacy shim): the only outbound tracking entry.
        Fingerprint(
            definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            name = "setCurrentScreen",
            returnType = "V",
            parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;"),
        ).method.addInstructions(0, "return-void")

        // AppsFlyer concrete engine: both event loggers become no-ops.
        // NOTE: start(Context) on the concrete engine (AFa1tSDK) is deliberately NOT
        // no-op'd — device re-tests showed a patched app that kills start() refuses to
        // open (uninitialized SDK state consumed by Pinterest launch code). Attribution
        // start still runs, but every in-app event and all Firebase tracking stay dead.

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "logEvent",
            returnType = "V",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
        ).method.addInstructions(0, "return-void")

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "logEvent",
            returnType = "V",
            parameters = listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Ljava/util/Map;",
                "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
            ),
        ).method.addInstructions(0, "return-void")
    }
}

package app.template.patches.mydialog.trackers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mydialog.CleverTapLifecycleInit
import app.template.patches.mydialog.CleverTapPushTracking
import app.template.patches.mydialog.CleverTapRnInit
import app.template.patches.mydialog.CtApiDomainResolver
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import app.template.patches.shared.returnEarly

/**
 * CleverTap is initialized in three places, all in app-owned code:
 *
 *  - `MainApplication.onCreate` calls `ActivityLifecycleCallback.b(app)` (auto
 *    session/activity tracking) and `CleverTapRnAPI.a(app)` (RN bridge init).
 *  - `MainActivity.onCreate` / `onNewIntent` call
 *    `CleverTapAPI.H0(ctx).H2(extras)` — push-notification-click tracking.
 *
 * All three entry methods are replaced with no-ops. CleverTap's push receiver
 * (CTFirebaseMessagingReceiver) is left untouched, so FCM push notifications
 * themselves keep working; only the profile/session telemetry and click
 * attribution die. The CleverTap inbox UI stays intact for any cached content.
 */
@Suppress("unused")
val myDialogDisableCleverTapPatch = bytecodePatch(
    name = "Disable CleverTap",
    description = "Stops CleverTap session/activity tracking and push-click " +
        "attribution. Push notifications themselves keep working.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        CleverTapLifecycleInit.method.returnEarly()
        CleverTapRnInit.method.returnEarly()
        CleverTapPushTracking.method.returnEarly()

        // Residual /a1 beacons bypass all three (MITM-proven 18x on the patched
        // build). Every CT request URL is built from CtApi.h(boolean)'s domain
        // answer — resolve it to a dead loopback address instead. The SDK's own
        // failure handling (timer-based retry/backoff) stays intact; no bytes
        // ever leave the device and no nullability rules are broken.
        val h = CtApiDomainResolver.method
        h.clearBody()
        h.ensureRegisters(2)
        h.addInstructions(
            0,
            """
            const-string v0, "127.0.0.1"
            return-object v0
            """.trimIndent(),
        )
    }
}

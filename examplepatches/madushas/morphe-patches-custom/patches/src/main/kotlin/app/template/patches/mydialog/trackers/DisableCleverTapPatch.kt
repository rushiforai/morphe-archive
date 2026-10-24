package app.template.patches.mydialog.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mydialog.CleverTapLifecycleInit
import app.template.patches.mydialog.CleverTapPushTracking
import app.template.patches.mydialog.CleverTapRnInit
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
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
    }
}

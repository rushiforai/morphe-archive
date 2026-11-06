package app.xiondigital.patches.tandem.tracking

import app.morphe.patcher.patch.bytecodePatch
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APK
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APKM
import app.xiondigital.patches.tandem.shared.replaceBodyWithReturnVoid

/**
 * Stops Tandem's Adjust attribution SDK from initialising.
 *
 * Tandem starts Adjust once, with the app token `w9jqbcact05c`, and then calls `Adjust.enable()`
 * and `Adjust.onResume()`. `initSdk` is the call that creates and binds the session, so replacing
 * its body with `return-void` means no install, session, event or deep-link attribution is sent.
 *
 * The two follow-up calls are left in place on purpose: Adjust's instance guards them with
 * `checkActivityHandler(...)`, which logs and returns when no session was created, so they are
 * already no-ops at that point. Nothing else in Tandem depends on Adjust: the deep-link handler is
 * registered separately on the application object, and the app's own Firebase analytics path is a
 * different SDK that this patch does not touch.
 */
@Suppress("unused")
val disableAdjustTrackingPatch = bytecodePatch(
    name = "Disable Adjust tracking",
    description = "Stops the bundled Adjust attribution SDK from initialising, so no install, " +
        "session or event attribution is sent.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TANDEM_APK, COMPATIBILITY_TANDEM_APKM)

    execute {
        AdjustInitSdkFingerprint.method.replaceBodyWithReturnVoid()
    }
}

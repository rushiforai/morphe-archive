package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Removes interruptive in-house promos (not Google SDK ads).
 *
 * - `popupwindow/x.i(a)`: single funnel for all 4 in-house popup types —
 *   never shown.
 * - `dialog/k.onNext`: fullscreen startup carousel ("Pay with mobile
 *   line" / "Get offer") — never shown. k is only instantiated for
 *   fullscreen promos, so the generic dialog builder is untouched.
 * - `popupwindow/z.onAdLoaded`: flyer ad callback — no-op.
 */
@Suppress("unused")
val removePopupPromosPatch = bytecodePatch(
    name = "Remove popup promos",
    description = "No-ops the in-house popup funnel, the fullscreen startup dialog, and the flyer ad callback. Google SDK ads untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        PopupShowFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
        FullscreenDialogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
        FlyerOnAdLoadedFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}

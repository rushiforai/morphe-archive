package app.noam.patches.chesscom.upsell

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched

@Suppress("unused")
val limitToastsPatch = bytecodePatch(
    name = "Limits as toasts",
    description = "When a free limit is reached (Game Review, puzzles, lessons, drills, videos…) " +
        "a short toast says so instead of a full-screen Premium offer, and promotional pop-ups " +
        "are not shown. Nothing is unlocked: the limits stay exactly as they are.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("limitToastsPatched")

        // show(router, direction, fragmentManager): p1 = direction, p2 = fragmentManager.
        ShowDialogDirectionFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p1, p2 }, ${Constants.UPSELLS}->interceptDialog(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_show_dialog
                    return-void
                """,
                ExternalLabel("morphe_show_dialog", getInstruction(0)),
            )
        }

        // navigate(activity, directions): p1 = activity, p2 = directions.
        NavigateFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p1, p2 }, ${Constants.UPSELLS}->interceptScreen(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_navigate
                    return-void
                """,
                ExternalLabel("morphe_navigate", getInstruction(0)),
            )
        }
    }
}

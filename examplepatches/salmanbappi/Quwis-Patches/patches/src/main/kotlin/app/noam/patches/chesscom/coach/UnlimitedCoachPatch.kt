/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.patches.chesscom.coach

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched

private const val COACH = "${Constants.EXTENSION_PACKAGE}/coach/Coach;"

@Suppress("unused")
val unlimitedCoachPatch = bytecodePatch(
    name = "Unlimited Play Coach",
    description = "Removes the one-free-game-per-day limit on Play Coach, a bot-only practice mode.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("unlimitedCoachPatched")

        // canStartCoachedGame(): with the quota always open, the setup screen never shows the
        // upsell and no GetCoachQuota request is made. Returning the boxed value directly from
        // a suspend function is a normal (non-suspended) completion, so the caller
        // (CoachGameSetupViewModel.resolveQuota) resumes synchronously with the result.
        CoachQuotaCanStartFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $COACH->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // coachedGameReachedQuotaThreshold(): do not record the game locally and do not send
        // StartedGameAgainstCoach, so playing a coach game never uses up the daily free game.
        CoachQuotaConsumeFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $COACH->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}

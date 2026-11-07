package app.noam.patches.chesscom.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched

private const val PREMIUM_UNLOCK = "${Constants.EXTENSION_PACKAGE}/premium/PremiumUnlock;"
private const val PREMIUM_STATUS = "Lcom/chess/entities/PremiumStatus;"

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Unlock Premium content",
    description = "The app's own premium-tier check always answers with the top tier, so content " +
        "gated on it (lessons, drills, insights, themes, puzzle-rush extras and anything else " +
        "that reads the account's tier) treats the account as a member. The server still decides " +
        "what you may actually play online.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("premiumUnlockPatched")

        // SessionStore.K(): every tier-derived check (isPremium, isAtLeastGold...) reads the
        // account's PremiumStatus through here.
        SessionStoreGetPremiumStatusFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $PREMIUM_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    sget-object v0, $PREMIUM_STATUS->DIAMOND:$PREMIUM_STATUS
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}

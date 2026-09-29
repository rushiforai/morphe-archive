package app.plyrs1.patches.com_habitrpg_android_habitica

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_HABITICA

@Suppress("unused")
val instantArmoireRewardPatch = bytecodePatch(
    name = "Instant Armoire Reward",
    description = "Shows the Armoire ad button and instantly grants the reward without loading an ad. " +
            "The existing per-session single-use guard is preserved.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HABITICA)

    execute {
        // 1. Force AppConfigManager.enableArmoireAds() to return true
        // This ensures ArmoireActivity reveals the ad button instead of hiding it (View.GONE).
        EnableArmoireAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Replace AdHandler.show() with direct rewardAction callback invocation
        // Directly calls rewardAction.invoke(Boolean.TRUE) which triggers ArmoireActivity.giveUserArmoire().
        AdHandlerShowFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/habitrpg/android/habitica/helpers/AdHandler;->rewardAction:Lu7/l;
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {v0, v1}, Lu7/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """
        )

        // 3. Force AdHandler.Companion.nextAdAllowedDate() to return null
        // Clears any residual cooldown date to ensure the button never shows a countdown timer.
        NextAdAllowedDateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}

package app.plyrs1.patches.com_habitrpg_android_habitica

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_HABITICA

@Suppress("unused")
val instantArmoireRewardPatch = bytecodePatch(
    name = "Instant Armoire Reward",
    description = "Grants free daily Armoire rolls without viewing ads or requiring a paid subscription. " +
            "In versions with rewarded ads (<= 4.10.5), bypasses video playback. In 4.11.2+, unlocks the subscriber free roll.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HABITICA)

    execute {
        // ── 1. Universal / 4.11.2+: Unlock subscriber free Armoire roll ───────────
        // By forcing User.isSubscribed() to return true, ArmoireActivity reveals the
        // "Open again for free!" button (open_armoire_subscriber_wrapper) and allows
        // claiming the extra free Armoire roll per session/day.
        UserIsSubscribedFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // ── 2. <= 4.10.5 Rewarded Ads Handling ────────────────────────────────────
        // Force AppConfigManager.enableArmoireAds() to return true if present
        EnableArmoireAdsFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Replace AdHandler.show() with direct rewardAction callback invocation
        AdHandlerShowFingerprint.methodOrNull?.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/habitrpg/android/habitica/helpers/AdHandler;->rewardAction:Lu7/l;
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {v0, v1}, Lu7/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """
        )

        // Force AdHandler.Companion.nextAdAllowedDate() to return null
        NextAdAllowedDateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}

package app.morphe.patches.moviebox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.moviebox.Constants.COMPATIBILITY_MOVIEBOX

/**
 * MovieBox Premium Unlocked.
 *
 * Combines:
 * 1. Full VIP membership bypass (MembershipDetailType & HTTP headers)
 * 2. High-quality resolution unlock (1080p and 4K playback & download)
 * 3. Comprehensive ad removal (interstitials, banners, dialogs, startup splash)
 */
@Suppress("unused")
val movieBoxPremiumUnlockedPatch = bytecodePatch(
    name = "MovieBox Premium",
    description = "Unlocks full VIP access, 1080p/4K playback and downloads, and eliminates all in-app ads and splash screens.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOVIEBOX)

    execute {
        // ====================================================================
        // 1. VIP MEMBERSHIP UNLOCK
        // ====================================================================
        MembershipDetailTypeFingerprint.method.addInstructions(
            0,
            """
                sget-object p1, Lcom/transsion/memberapi/MembershipDetailType;->SUBSCRIPTION_MEMBER:Lcom/transsion/memberapi/MembershipDetailType;
                return-object p1
            """
        )

        PremiumProviderCallbackFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lyg/b;->a:Lyg/b${'$'}a;
                const-string v1, "X-PM-Level"
                const-string v2, "2"
                invoke-virtual {v0, v1, v2}, Lyg/b${'$'}a;->b(Ljava/lang/String;Ljava/lang/String;)V
                const-string v1, "X-PM-Active"
                const-string v2, "true"
                invoke-virtual {v0, v1, v2}, Lyg/b${'$'}a;->b(Ljava/lang/String;Ljava/lang/String;)V
            """
        )

        // ====================================================================
        // 2. UNLOCK 1080P / 4K RESOLUTION
        // ====================================================================
        LongVideoVipResolutionFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        DownloaderVipResolutionFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // ====================================================================
        // 3. REMOVE ADS
        // ====================================================================
        AdFreeToggleFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x1
            """
        )

        MainDialogAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}

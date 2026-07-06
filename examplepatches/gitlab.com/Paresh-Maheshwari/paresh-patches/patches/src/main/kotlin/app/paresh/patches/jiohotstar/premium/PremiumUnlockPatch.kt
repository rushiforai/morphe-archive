package app.paresh.patches.jiohotstar.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks premium UI features, removes subscription nudges, and enables downloads."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // MyPageData.getIsSubscribed() → true (subscribed UI state)
        IsSubscribedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // DownloadInfo.getIsPremium() → false (download button for all content)
        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Suppress subscription nudge during playback
        SubscriptionNudgeFingerprint.method.addInstructions(0, """
            return-void
        """)
    }
}

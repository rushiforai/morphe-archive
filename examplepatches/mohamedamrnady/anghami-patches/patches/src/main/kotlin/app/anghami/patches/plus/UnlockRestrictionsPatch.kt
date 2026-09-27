package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Second layer: playback/download/ad restrictions.
 *
 * Ports only the AnghamiPlus hooks verified LIVE in 8.0.28 smali:
 * - PlayQueue.skipLimitReached / queueRestrictionsEnabled -> false
 * - PlayQueue.getDisable* -> true (skip/queue/player/ads)
 * - DownloadManager.assertDownloadLimitReached / assertDownloadRestrictions -> no-op
 * - DownloadManager.isOnLimitedPlan -> false
 * - AdSettings.noAd (static) / getNoAd -> true
 * - ProtoAccount.getMaxOfflineSongs/Time -> 999999, getEnablePlayerRestrictions -> false,
 *   getCanGoLive -> true
 *
 * Deliberately NOT ported (see analysis/AnghamiPlus_hooks.md §4):
 * SessionHooks SID swap, okhttp null-build, Object-class universal hooks,
 * karaoke-false hooks, PlanType "7", stale popupwindow.A hook.
 * Same server-side caveat as UnlockLocalPlusPatch: local gates only.
 */
@Suppress("unused")
val unlockRestrictionsPatch = bytecodePatch(
    name = "Unlock playback/download restrictions",
    description = "Forces skip/queue limits off, download asserts no-op, limited-plan false, noAd true, max offline 999999. Local gates only.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        // --- PlayQueue: no skip/queue limits ---
        SkipLimitReachedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        QueueRestrictionsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GetDisableSkipLimitFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        GetDisableQueueRestrictionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        GetDisablePlayerRestrictionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        GetDisableAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // --- Downloads: no limit/restriction asserts, never "limited plan" ---
        AssertDownloadLimitReachedFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
        AssertDownloadRestrictionsFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
        IsOnLimitedPlanFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // --- Ads: treat every song as ad-free ---
        NoAdStaticFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        GetNoAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // --- Proto defaults: large offline caps, no player restrictions ---
        MaxOfflineSongsFingerprint.method.addInstructions(
            0,
            """
                const v0, 0xf423f
                return v0
            """
        )
        MaxOfflineTimeFingerprint.method.addInstructions(
            0,
            """
                const v0, 0xf423f
                return v0
            """
        )
        ProtoEnablePlayerRestrictionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GetCanGoLiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

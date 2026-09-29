package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Disables client-side playback limits.
 *
 * - PlayQueue.skipLimitReached / queueRestrictionsEnabled -> false
 * - PlayQueue.getDisableSkipLimit / getDisableQueueRestrictions /
 *   getDisablePlayerRestrictions -> true
 * - ProtoAccount.getEnablePlayerRestrictions -> false
 *
 * Local gates only; stream authorization stays server-side.
 */
@Suppress("unused")
val unlockPlaybackLimitsPatch = bytecodePatch(
    name = "Unlock playback limits",
    description = "Disables skip and queue limits (skipLimitReached/queueRestrictionsEnabled=false, disable-flags=true). Local gates only.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
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
        ProtoEnablePlayerRestrictionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}

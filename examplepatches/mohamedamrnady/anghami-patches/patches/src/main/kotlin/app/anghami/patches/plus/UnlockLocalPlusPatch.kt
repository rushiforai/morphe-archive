package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Proof-of-concept: force local Plus checks to true.
 *
 * - isPlus / isPlusUser -> return true (unlocks DownloadManager gate,
 *   settings UI, PlayQueue/PlayerService branches that check isPlusUser)
 * - enablePlayerRestrictions -> return false
 * - PlayQueue.canPlayOfflineAndFree -> return true
 *
 * Expected local effects: Plus UI badging, quality selector unlocked in UI,
 * download button path passes the client gate, fewer player restrictions.
 *
 * Will NOT bypass server: stream/download URLs, license checks,
 * ProtoAccount planType from /authenticate, and ERROR_CODE_PREMIUM_ACCOUNT_REQUIRED
 * playback errors remain server-enforced. Verify on device with logcat
 * (OdinPlayer, DUST, AudioQualitySettingsHelper tags).
 */
@Suppress("unused")
val unlockLocalPlusPatch = bytecodePatch(
    name = "Unlock local Plus",
    description = "Forces Account.isPlus/isPlusUser=true, enablePlayerRestrictions=false, canPlayOfflineAndFree=true. Local UI/gating only; server premium checks remain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        IsPlusFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        IsPlusUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        EnablePlayerRestrictionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // canPlayOfflineAndFree() is `const/4 v0, 0x0; return v0` — prepending
        // `return true` short-circuits it (same pattern as the template's ExamplePatch).
        CanPlayOfflineAndFreeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

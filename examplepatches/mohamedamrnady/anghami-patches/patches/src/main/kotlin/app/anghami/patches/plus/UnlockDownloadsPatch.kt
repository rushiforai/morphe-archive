package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Disables client-side download gates.
 *
 * - DownloadManager.assertDownloadLimitReached /
 *   assertDownloadRestrictions -> no-op (both throw on violation)
 * - DownloadManager.isOnLimitedPlan -> false
 * - ProtoAccount.getMaxOfflineSongs / getMaxOfflineTime -> 999999
 * - ProtoAccount.getCanGoLive -> true
 *
 * Local gates only; the server still authorizes download files.
 */
@Suppress("unused")
val unlockDownloadsPatch = bytecodePatch(
    name = "Unlock downloads",
    description = "No-ops download limit asserts, forces limited-plan=false and large offline caps (999999). Local gates only; the server still authorizes files.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
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
        GetCanGoLiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

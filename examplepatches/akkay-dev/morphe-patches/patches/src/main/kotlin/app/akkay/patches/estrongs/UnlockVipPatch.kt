package app.akkay.patches.estrongs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.akkay.patches.shared.Constants.COMPATIBILITY_ESTRONGS

@Suppress("unused")
val unlockVipPatch = patch(
    name = "Unlock VIP & Remove Ads",
    description = "Unlocks all VIP features (duplicate file cleaner, multi-window, cloud backup) and suppresses advertisements and purchase prompts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ESTRONGS)

    execute {
        // 1. Force the primary VIP coordinator gate to return true.
        // Downstream features (DuplicateFileListFragment, PopMultiWindowGrid, PlayerAdControl,
        // no2 ad gateway, HomeAdapter banner) evaluate this method and switch to VIP/ad-free mode.
        VipCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Force the AccountInfo model getter to report VIP status for profile views.
        AccountInfoVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

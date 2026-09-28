package app.tkiethuynh.patches.misa.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tkiethuynh.patches.shared.Constants.COMPATIBILITY_MISA

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium subscription features and removes advertisements.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MISA)

    execute {
        UserSettingIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        UserSettingIsRemovedAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        UserSettingIsShowUpgradePremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        UserInfoIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        UserInfoIsRemovedAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

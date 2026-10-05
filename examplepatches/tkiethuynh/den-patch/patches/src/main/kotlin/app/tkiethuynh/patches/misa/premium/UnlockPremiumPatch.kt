package app.tkiethuynh.patches.misa.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tkiethuynh.patches.shared.Constants.COMPATIBILITY_MISA
import app.tkiethuynh.patches.shared.RETURN_TRUE_BODY

private const val RETURN_FALSE_BODY = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium subscription features and removes advertisements.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MISA)

    execute {
        listOf(
            userSettingIsPremiumFingerprint,
            userSettingIsRemovedAdsFingerprint,
            userInfoIsPremiumFingerprint,
            userInfoIsRemovedAdsFingerprint
        ).forEach { it.method.addInstructions(0, RETURN_TRUE_BODY) }

        userSettingIsShowUpgradePremiumFingerprint.method.addInstructions(0, RETURN_FALSE_BODY)
    }
}

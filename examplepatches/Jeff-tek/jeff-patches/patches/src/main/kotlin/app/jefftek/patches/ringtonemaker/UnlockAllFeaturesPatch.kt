package app.jefftek.patches.ringtonemaker

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jefftek.patches.shared.Constants.COMPATIBILITY_RINGTONE_MAKER

@Suppress("unused")
val unlockAllFeaturesPatch = bytecodePatch(
    name = "Unlock all features",
    description = "Unlocks all premium features in MP3 Cutter and Ringtone Maker.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RINGTONE_MAKER)

    execute {
        PremiumGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

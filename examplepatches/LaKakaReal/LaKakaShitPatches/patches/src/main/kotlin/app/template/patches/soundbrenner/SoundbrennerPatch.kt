package app.template.patches.soundbrenner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SOUNDBRENNER_COMPATIBILITY

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Unlocks all Soundbrenner Plus features and Home Customization.",
    default = true
) {
    compatibleWith(SOUNDBRENNER_COMPATIBILITY)

    execute {
        // 1. RevenueCat entitlement check (Main app features)
        HasActiveSubscriptionPlanFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        HasPlusEntitlementFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // 2. Home Customization checks (Bypasses SharedPrefs cache)
        IsPlusUserForHomeV4Fingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        CanCustomizeHomeFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
    }
}
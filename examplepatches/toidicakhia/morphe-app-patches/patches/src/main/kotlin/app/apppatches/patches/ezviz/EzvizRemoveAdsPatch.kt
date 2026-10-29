package app.apppatches.patches.ezviz

import app.apppatches.patches.shared.Constants.EZVIZ_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val ezvizRemoveAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes banner, splash and hot open-screen ads.",
    default = true
) {
    compatibleWith(EZVIZ_COMPATIBILITY)
    dependsOn(ezvizSignatureCheckPatch)

    execute {
        EzvizAdsSwitchFingerprint.match().method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        EzvizHotSplashAdsFingerprint.match().method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
    }
}

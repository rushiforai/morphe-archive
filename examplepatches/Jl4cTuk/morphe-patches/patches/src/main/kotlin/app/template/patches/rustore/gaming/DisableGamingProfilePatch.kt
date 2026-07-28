package app.template.patches.rustore.gaming

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE

@Suppress("unused")
val disableGamingProfilePatch = bytecodePatch(
    name = "Disable gaming profile",
    description = "Removes the Game Profile section from the Mine screen, " +
        "including the button and the usage statistics screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        MineV2ViewModelOpenGameCenterFingerprint.method.addInstructions(0, "return-void")
        GameCenterV2ButtonComposableFingerprint.method.addInstructions(0, "return-void")
        GameCenterV1ButtonComposableFingerprint.method.addInstructions(0, "return-void")
    }
}

package app.template.patches.rustore.mine

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE

@Suppress("unused")
val disableMineRedesignPatch = bytecodePatch(
    name = "Disable Mine redesign",
    description = "Reverts the Mine screen to the classic layout, " +
        "disabling the redesigned V2/V3 interface.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        // MineDestination chooses MineV2Screen for true and MineScreen for false.
        MineDestinationClassicFlagFingerprint.method.addInstructions(
            0,
            "const/4 p1, 0x0",
        )
    }
}

package patapon888.morphe.patches.bejeweled.unlock

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

/**
 * Poker, Lightning and Butterflies each have a "purchased" bool in Bej3App
 * (+0x1140, +0x1150, +0x1160). When set, Board::NewGame skips the free play counter
 * and its recharge timer entirely, so the modes play like they did before the trials.
 */
@Suppress("unused")
val unlockGameModesPatch = resourcePatch(
    name = "Unlock game modes",
    description = "Unlocks Poker, Lightning and Butterflies, removing their limited free plays. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                // Bej3App::Bej3App(): store 1 (strh also clears the following byte as before).
                InstructionEdit(0xf201b8, 0x5282282c, 0x5280002d), // mov w12, #0x1141 -> mov w13, #1
                InstructionEdit(0xf201bc, 0x382c6928, 0x782c692d), // poker: strb w8 -> strh w13, [x9, x12]
                InstructionEdit(0xf201cc, 0x382c6928, 0x782c692d), // lightning: strb w8 -> strh w13, [x9, x12]
                InstructionEdit(0xf201e4, 0x382a6928, 0x782a692d), // butterflies: strb w8 -> strh w13, [x9, x10]
                // Profile::LoadProfileHelper: and w8, w8, #1 -> mov w8, #1 for each saved flag.
                InstructionEdit(0x1063a80, 0x12000108, 0x52800028), // lightning
                InstructionEdit(0x1063b7c, 0x12000108, 0x52800028), // butterflies
                InstructionEdit(0x1063c38, 0x12000108, 0x52800028), // poker
            )
        )
    }
}

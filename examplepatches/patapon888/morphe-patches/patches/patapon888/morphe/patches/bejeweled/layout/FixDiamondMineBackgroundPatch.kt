package patapon888.morphe.patches.bejeweled.layout

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

/**
 * DigBoard::DrawScoreWidget scales IMAGE_INGAMEUI_DIAMOND_MINE_BACKGROUND horizontally to
 * fill the space left of the board, but keeps a vertical scale of 1, so the wood is stretched
 * on wide screens. The vertical scale becomes max(horizontal scale, 1) so it keeps its aspect
 * while still covering the screen. The shadow tiles drawn afterwards keep their vertical scale of 1.
 */
@Suppress("unused")
val fixDiamondMineBackgroundPatch = resourcePatch(
    name = "Fix Diamond Mine background",
    description = "Stops the Diamond Mine wood background from being stretched on wide screens. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                InstructionEdit(0x11006f8, 0xbc1bc3a1.toInt(), 0x1e216801), // stur s1, [x29, #-68] -> fmaxnm s1, s0, s1
                InstructionEdit(0x1100868, 0xbc5bc3a1.toInt(), 0x1e2e1001), // ldur s1, [x29, #-68] -> fmov s1, #1.0
            )
        )
    }
}

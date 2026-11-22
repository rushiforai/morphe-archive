package patapon888.morphe.patches.bejeweled.boosters

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

private const val NOP = 0xd503201f.toInt()

/**
 * The boost (Tool) and super boost (SuperTool) buttons are invisible widgets that Board::DrawButtons
 * draws itself and that reach Board::ButtonDepress as ids 1 and 2. Every mode goes through both,
 * so skipping them hides the boosts everywhere. The hint button is drawn and handled separately.
 */
@Suppress("unused")
val removeBoostersPatch = resourcePatch(
    name = "Remove boosters",
    description = "Removes the paid boosts from every mode, the Diamond Mine \"use a time boost and continue\" offer " +
        "and the \"no more moves, use a mixer\" offer. The hint stays, centered in the tray. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                // Board::DrawButtons: always skip the boost and super boost buttons.
                InstructionEdit(0xfd2724, 0x36000320, 0x14000019), // tbz w0, #0 -> b
                InstructionEdit(0xfd27b4, 0x36000320, 0x14000019),
                // Board::ButtonDepress: ids 1 and 2 do nothing.
                InstructionEdit(0xfd79f4, 0x540003e0, NOP),
                InstructionEdit(0xfd7a04, 0x540043a0, NOP),
                // Board::CheckCountdownBar: Diamond Mine time up always ends the game, as when out of boosts.
                InstructionEdit(0xfbca9c, 0x5400102b, 0x14000081), // b.lt -> b
                // Board::UpdateGame: no more moves always ends the game instead of offering a mixer, as when out of boosts.
                InstructionEdit(0xfc0c44, 0x5400102b, 0x14000081), // b.lt -> b
                // BOARD_UI_HINT_BTN_X (.data): the hint moves from the right of the three slots (20, 120, 220)
                // to the middle one, centered in the tray above the menu button. scaleConstants scales it as before.
                // The invisible boost button, which is in front of it and would take its taps, gets the right slot.
                InstructionEdit(0x1ff1eec, 220, 120),
                InstructionEdit(0x1ff2d38, 120, 220), // BOARD_UI_TOOL_BTN_X
            )
        )
    }
}

package patapon888.morphe.patches.bejeweled.layout

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

/**
 * MainMenuScrollContainer::PopulatePositionMap places each mode button from the
 * MAIN_MENU_BUTTON_*_X/Y globals. Lightning, Butterflies and Poker are rotated so the
 * menu matches the original iPad layout: Butterflies top left, Lightning top right,
 * Poker bottom left.
 */
@Suppress("unused")
val classicModeLayoutPatch = resourcePatch(
    name = "Classic mode layout",
    description = "Arranges the game modes in the main menu like the original iPad version. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                InstructionEdit(0x11ed4c0, 0xf945f908.toInt(), 0xf9469108.toInt()), // Lightning X -> Poker X
                InstructionEdit(0x11ed4cc, 0xf9460108.toInt(), 0xf9469508.toInt()), // Lightning Y -> Poker Y
                InstructionEdit(0x11ed4f0, 0xf945f508.toInt(), 0xf945f908.toInt()), // Butterflies X -> Lightning X
                InstructionEdit(0x11ed4fc, 0xf945fd08.toInt(), 0xf9460108.toInt()), // Butterflies Y -> Lightning Y
                InstructionEdit(0x11ed520, 0xf9469108.toInt(), 0xf945f508.toInt()), // Poker X -> Butterflies X
                InstructionEdit(0x11ed52c, 0xf9469508.toInt(), 0xf945fd08.toInt()), // Poker Y -> Butterflies Y
            )
        )
    }
}

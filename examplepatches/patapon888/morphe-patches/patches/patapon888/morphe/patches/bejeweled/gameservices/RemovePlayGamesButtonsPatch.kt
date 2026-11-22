package patapon888.morphe.patches.bejeweled.gameservices

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

private const val NOP = 0xd503201f.toInt()
private const val ADD_WIDGET = 0xd63f0100.toInt() // blr x8 (Widget::AddWidget)

@Suppress("unused")
val removePlayGamesButtonsPatch = resourcePatch(
    name = "Remove Play Games buttons",
    description = "Hides the Google Play Games buttons from the menus. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                // The buttons are still created, just never added to their menu.
                InstructionEdit(0x11e590c, ADD_WIDGET, NOP), // MainMenuScrollContainer constructors
                InstructionEdit(0x11ea760, ADD_WIDGET, NOP),
                InstructionEdit(0x1192c44, ADD_WIDGET, NOP), // BadgeMenu constructors
                InstructionEdit(0x1194344, ADD_WIDGET, NOP),
                InstructionEdit(0x10249ac, ADD_WIDGET, NOP), // EndGameMenu::Init
                InstructionEdit(0x121471c, ADD_WIDGET, NOP), // ProfileMenu::Init: achievements
                InstructionEdit(0x12148b4, ADD_WIDGET, NOP), // ProfileMenu::Init: leaderboards
            )
        )
    }
}

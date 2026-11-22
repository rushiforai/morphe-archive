package patapon888.morphe.patches.bejeweled.profile

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

private const val NOP = 0xd503201f.toInt()

/**
 * ProfileMenu::LinkUpAssets titles the records screen with the profile name followed by
 * "(" + Bej3App::GetSynergyId() + ")", a debug leftover showing the EA account id.
 */
@Suppress("unused")
val hideProfileIdPatch = resourcePatch(
    name = "Hide profile id",
    description = "Removes the EA account number shown after the player name in the records. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                InstructionEdit(0x121511c, 0x942fccfd.toInt(), NOP), // bl basic_string<wchar_t>::append
            )
        )
    }
}

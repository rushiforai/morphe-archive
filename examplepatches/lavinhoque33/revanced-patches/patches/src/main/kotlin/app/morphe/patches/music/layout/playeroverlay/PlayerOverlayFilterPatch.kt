package app.morphe.patches.music.layout.playeroverlay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.music.utils.patch.PatchList.HIDE_PLAYER_OVERLAY_FILTER
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mapping.ResourceType.ID
import app.morphe.patches.shared.mapping.ResourceType.LAYOUT
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private object PlayerControlScreenFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        resourceLiteral(LAYOUT, "music_controls_overlay"),
        resourceLiteral(ID, "player_control_screen"),
        methodCall(
            name = "findViewById",
            parameters = listOf("I"),
            returnType = "Landroid/view/View;",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val playerOverlayFilterPatch = bytecodePatch(
    HIDE_PLAYER_OVERLAY_FILTER.title,
    HIDE_PLAYER_OVERLAY_FILTER.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(settingsPatch, resourceMappingPatch)

    execute {
        val match = PlayerControlScreenFingerprint.matchOrNull()
        if (match == null) {
            printWarn("Hide player overlay filter: player_control_screen lookup unavailable.")
            return@execute
        }

        val index = match.instructionMatches.last().index
        val register = match.method.getInstruction<OneRegisterInstruction>(index).registerA
        match.method.addInstruction(
            index + 1,
            "invoke-static/range {v$register .. v$register}, " +
                    "$GENERAL_PATH/OverlayFilterPatch;->trackPlayerScrim(Landroid/view/View;)V"
        )

        addSwitchPreference(CategoryType.PLAYER, "revanced_hide_player_overlay_filter", "false")
        updatePatchStatus(HIDE_PLAYER_OVERLAY_FILTER)
    }
}

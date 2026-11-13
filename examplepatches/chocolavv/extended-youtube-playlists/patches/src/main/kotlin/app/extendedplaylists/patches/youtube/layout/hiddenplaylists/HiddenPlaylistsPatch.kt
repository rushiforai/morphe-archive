package app.extendedplaylists.patches.youtube.layout.hiddenplaylists

import app.extendedplaylists.patches.youtube.misc.settings.settingsPatch
import app.extendedplaylists.patches.youtube.shared.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findFreeRegister
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION = "Lapp/extendedplaylists/extension/HiddenPlaylists;"

@Suppress("unused")
val hiddenPlaylistsPatch = patch(
    name = "Hidden playlists",
    description = "Adds an option to show the playlists YouTube builds for every channel in the Playlists " +
            "tab of the channel. Settings are in Morphe settings > Feed > Channel page. Requires Morphe Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(settingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // The browse response class: the type of the message field the Parcelable writes.
        val browse = BrowseResponsePayloadFingerprint.instructionMatches.first().fieldReference!!.type

        // Right after the parse, a browse response is replaced by what the extension returns for it.
        ResponseParserFingerprint.method.apply {
            val index = ResponseParserFingerprint.instructionMatches.last().index
            val message = getInstruction<OneRegisterInstruction>(index).registerA
            val free = findFreeRegister(index + 1, message)
            addInstructionsWithLabels(
                index + 1,
                """
                    instance-of v$free, v$message, $browse
                    if-eqz v$free, :other
                    invoke-static/range { v$message .. v$message }, $EXTENSION->onBrowseResponse(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$message
                    :other
                    nop
                """
            )
        }
    }
}

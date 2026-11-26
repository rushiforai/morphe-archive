package app.pomee4.patches.myspoti.carqueue

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.pomee4.patches.myspoti.shared.Constants.COMPATIBILITY_MYSPOTI
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Position of the `songs` parameter of `SongPlayer.playSong(song, context, contextUri, order,
 * positionMs, songs, askExtensions, alone)`, which is also its bit in the default-arguments mask.
 */
private const val SONGS_PARAMETER = 5

@Suppress("unused")
val carPlaylistQueuePatch = bytecodePatch(
    name = "Keep the playlist in car playback",
    description = "A playlist or album started from Waze, Android Auto or another media browser keeps " +
        "playing that list when an audio-source extension plays it, instead of playing only the picked " +
        "song and going on with its song radio.",
) {
    compatibleWith(COMPATIBILITY_MYSPOTI)

    execute {
        AutoBrowserPlayTrackFingerprint.method.apply {
            val updateQueueIndex = AutoBrowserPlayTrackFingerprint.instructionMatches[0].index
            val playSongIndex = AutoBrowserPlayTrackFingerprint.instructionMatches[1].index

            // The page: the receiver of the getTracks() call whose result goes to updateQueue().
            val getTracksIndex = (updateQueueIndex downTo 0).firstOrNull { index ->
                val instruction = getInstruction(index)
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == CONTEXT_PAGE_CLASS && it.name == "getTracks"
                    }
            } ?: throw PatchException("Could not find the page of the queue")
            val pageRegister = getInstruction<FiveRegisterInstruction>(getTracksIndex).registerC

            // playSong$default(SongPlayer, song, context, contextUri, order, positionMs, songs,
            // askExtensions, alone, mask, marker): the receiver comes first, then the parameters.
            val call = getInstruction<RegisterRangeInstruction>(playSongIndex)
            val songsRegister = call.startRegister + 1 + SONGS_PARAMETER
            val maskRegister = call.startRegister + call.registerCount - 2

            // The page register must still hold the page at the call: it is not written after the
            // updateQueue() block (the page variable is kept for the rest of the method).
            if (pageRegister in call.startRegister until call.startRegister + call.registerCount) {
                throw PatchException("The page register is overwritten by the playSong call arguments")
            }

            addInstructionsWithLabels(
                playSongIndex,
                """
                    if-eqz v$pageRegister, :play
                    invoke-virtual { v$pageRegister }, $CONTEXT_PAGE_CLASS->getTracks()Ljava/util/List;
                    move-result-object v$songsRegister
                    and-int/lit16 v$maskRegister, v$maskRegister, ${(1 shl SONGS_PARAMETER).inv()}
                """,
                ExternalLabel("play", getInstruction(playSongIndex)),
            )
        }
    }
}

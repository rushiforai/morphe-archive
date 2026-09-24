package app.enigma.patches.music.maloja

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

internal object MediaSessionSetMetadataFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setMetadata",
            parameters = listOf("Landroid/media/MediaMetadata;")
        )
    )
)

internal object MediaSessionSetPlaybackStateFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setPlaybackState",
            parameters = listOf("Landroid/media/session/PlaybackState;")
        )
    )
)

/**
 * Passes the argument of the matched `MediaSession` call to an extension method,
 * before the call itself runs.
 *
 * The official Scrobbling and Lyrics patches hook the same instruction, and each
 * insertion shifts the index of the following ones, so the match is resolved again here.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.hookMediaSessionArgument(extensionMethod: String) {
    clearMatch()

    method.apply {
        val index = instructionMatches.first().index
        val register = getInstruction<FiveRegisterInstruction>(index).registerD
        addInstruction(index, "invoke-static { v$register }, $extensionMethod")
    }
}

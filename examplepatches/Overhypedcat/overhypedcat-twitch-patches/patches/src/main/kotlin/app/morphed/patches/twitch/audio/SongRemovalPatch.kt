package app.morphed.patches.twitch.audio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphed.patches.twitch.settings.patchSettingsPatch
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import app.morphed.patches.twitch.shared.markIncluded
import app.morphed.patches.twitch.shared.playerHttpHookPatch

private const val SONG_REMOVAL = "Lapp/morphed/extension/twitch/musicfilter/SongRemoval;"
private const val RENDERER = "Lcom/amazonaws/ivs/player/AudioTrackRenderer;"

/** Writes the player's decoded 16-bit sound to the speaker (AudioTrack), a buffer at a time. */
object AudioRenderFingerprint : Fingerprint(
    definingClass = RENDERER,
    name = "render",
    returnType = "V",
    parameters = listOf("Ljava/nio/ByteBuffer;", "I", "J"),
)

/** Drops what the renderer queued (a seek, a new stream). */
object AudioFlushFingerprint : Fingerprint(
    definingClass = RENDERER,
    name = "flush",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val songRemovalPatch = bytecodePatch(
    name = "Song removal",
    description = "Takes the songs a streamer plays out of the stream's sound (Shazam names the song, its clean " +
        "copy comes from YouTube, and it is subtracted live). Switched on and off in the video player's Options.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(playerHttpHookPatch, patchSettingsPatch)
    extendWith("extensions/twitch.mpe")

    execute {
        markIncluded("songRemoval")

        // The sound passes through the filter right before it's written: the buffer written is the filter's
        // (the decoder's own is read-only), and the time it plays at moves by the filter's fixed delay, so the
        // picture stays in step.
        // What the extension reads of the renderer: checked here, so a changed app fails while patching, not later.
        val renderer = AudioRenderFingerprint.classDef
        check(renderer.fields.any { it.name == "format" && it.type == "Landroid/media/MediaFormat;" }) {
            "$RENDERER has no MediaFormat field 'format'; the patch needs an update"
        }
        check(renderer.fields.any { it.name == "volume" && it.type == "F" }) {
            "$RENDERER has no float field 'volume'; the patch needs an update"
        }

        AudioRenderFingerprint.method.apply {
            check(!AccessFlags.STATIC.isSet(accessFlags)) { "$RENDERER.render is static; the patch needs an update" }
            val thisRegister = implementation!!.registerCount - 5 // this, buffer, size, presentation time (wide)
            addInstructions(
                0,
                """
                    invoke-static/range { v$thisRegister .. v${thisRegister + 4} }, $SONG_REMOVAL->render(Ljava/lang/Object;Ljava/nio/ByteBuffer;IJ)Ljava/nio/ByteBuffer;
                    move-result-object v${thisRegister + 1}
                    invoke-static/range { v$thisRegister .. v${thisRegister + 4} }, $SONG_REMOVAL->presentation(Ljava/lang/Object;Ljava/nio/ByteBuffer;IJ)J
                    move-result-wide v${thisRegister + 3}
                """
            )
        }

        AudioFlushFingerprint.method.apply {
            val thisRegister = implementation!!.registerCount - 1
            addInstruction(0, "invoke-static/range { v$thisRegister .. v$thisRegister }, $SONG_REMOVAL->flush(Ljava/lang/Object;)V")
        }
    }
}

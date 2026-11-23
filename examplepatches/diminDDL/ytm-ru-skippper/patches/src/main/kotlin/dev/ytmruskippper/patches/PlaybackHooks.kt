package dev.ytmruskippper.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

/**
 * Calls the track callbacks of [extensionClass]:
 * - `onPlayerResponse(String videoId)` when a track is loaded,
 * - `onSessionMetadata(MediaSession, MediaMetadata)` when the media session metadata changes,
 * - `onNotificationTrack(Object model, CharSequence title, CharSequence credit)` when the notification updates.
 */
internal fun addPlaybackHooks(extensionClass: String) {
    PlayerResponseFingerprint.matchAll(1..1).single().let { match ->
        val readVideoId = match.instructionMatches.last()
        val videoId = readVideoId.getInstruction<OneRegisterInstruction>().registerA
        match.method.addInstruction(
            readVideoId.index + 1,
            "invoke-static/range {v$videoId .. v$videoId}, $extensionClass->onPlayerResponse(Ljava/lang/String;)V",
        )
    }

    MediaSessionMetadataFingerprint.matchAll(1..1).single().let { match ->
        val setMetadata = match.instructionMatches.single()
        val callback = "$extensionClass->onSessionMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V"
        // Pass the same session and metadata registers as the original call.
        val hook = when (val call = setMetadata.instruction) {
            is FiveRegisterInstruction -> "invoke-static {v${call.registerC}, v${call.registerD}}, $callback"
            is RegisterRangeInstruction ->
                "invoke-static/range {v${call.startRegister} .. v${call.startRegister + 1}}, $callback"
            else -> throw PatchException("Unexpected MediaSession.setMetadata call format")
        }
        match.method.addInstruction(setMetadata.index + 1, hook)
    }

    NotificationTrackFingerprint.matchAll(1..1).single().let { match ->
        val model = match.instructionMatches.first().getInstruction<FiveRegisterInstruction>().registerC
        val publish = match.instructionMatches.last()
        val texts = publish.getInstruction<FiveRegisterInstruction>()
        match.method.addInstruction(
            publish.index + 1,
            "invoke-static {v$model, v${texts.registerD}, v${texts.registerE}}, " +
                "$extensionClass->onNotificationTrack(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V",
        )
    }
}

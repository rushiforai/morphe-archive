/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3332
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.misc.medianotification

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.media.MediaSessionSetPlaybackStateFingerprint
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.Constants.PATCHES_PATH
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.MEDIA_NOTIFICATION_CONTROLS
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val EXTENSION_CLASS = "$PATCHES_PATH/MediaNotificationControlsPatch;"

@Suppress("unused")
val mediaNotificationControlsPatch = bytecodePatch(
    name = MEDIA_NOTIFICATION_CONTROLS.title,
    description = MEDIA_NOTIFICATION_CONTROLS.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: PLAYER",
                "SETTINGS: MEDIA_NOTIFICATION_CONTROLS"
            ),
            MEDIA_NOTIFICATION_CONTROLS
        )

        hookPlaybackState()

        // Android 12 and lower show the notification actions as the media buttons.
        // Don't add the previous/next actions, otherwise the buttons remain visible but do nothing.
        PlaybackNotificationAddActionFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p3 }, $EXTENSION_CLASS->hideNotificationAction(I)Z
                move-result v0
                if-eqz v0, :add_action
                return-void
                :add_action
                nop
            """
        )

        // Previous and Next can rewind and fast forward instead,
        // using the same seek as the media session rewind and fast forward actions.
        seekInsteadOfSkip(MediaSessionSkipToNextFingerprint, MediaSessionFastForwardFingerprint)
        seekInsteadOfSkip(MediaSessionSkipToPreviousFingerprint, MediaSessionRewindFingerprint)
    }
}

/**
 * Filters the available actions of the playback state before the media session receives it.
 */
context(_: BytecodePatchContext)
private fun hookPlaybackState() = MediaSessionSetPlaybackStateFingerprint.let {
    // Other patches can hook the same call, which shifts its index.
    it.clearMatch()

    it.method.apply {
        val index = it.instructionMatches.first().index
        val register = getInstruction<FiveRegisterInstruction>(index).registerD

        addInstructions(
            index,
            """
                invoke-static { v$register }, $EXTENSION_CLASS->changePlaybackState(Landroid/media/session/PlaybackState;)Landroid/media/session/PlaybackState;
                move-result-object v$register
            """
        )
    }
}

context(_: BytecodePatchContext)
private fun seekInsteadOfSkip(
    skipFingerprint: Fingerprint,
    seekFingerprint: Fingerprint,
) {
    val skipMethod = skipFingerprint.method
    val seekMethod = seekFingerprint.match(skipFingerprint.classDef).originalMethod

    // The player callback seeks a fixed amount. Use the seek length setting instead.
    MediaSessionSeekRelativeFingerprint(
        skipFingerprint.classDef.superclass!!,
        seekMethod.name
    ).method.apply {
        val index = indexOfFirstInstructionOrThrow { this is WideLiteralInstruction }
        val register = getInstruction<OneRegisterInstruction>(index).registerA

        addInstructions(
            index + 1,
            """
                invoke-static { v$register, v${register + 1} }, $EXTENSION_CLASS->getSeekLength(J)J
                move-result-wide v$register
            """
        )
    }

    skipMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $EXTENSION_CLASS->seekInsteadOfSkip()Z
            move-result v0
            if-eqz v0, :skip
            invoke-virtual { p0 }, $seekMethod
            return-void
            :skip
            nop
        """
    )
}

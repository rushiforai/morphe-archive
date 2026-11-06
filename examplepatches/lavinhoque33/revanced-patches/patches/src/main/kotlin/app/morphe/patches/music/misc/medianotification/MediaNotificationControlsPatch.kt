/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1322
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-16.
 */

package app.morphe.patches.music.misc.medianotification

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.MISC_PATH
import app.morphe.patches.music.utils.patch.PatchList.MEDIA_NOTIFICATION_CONTROLS
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.misc.media.MediaSessionSetPlaybackStateFingerprint
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR =
    "$MISC_PATH/MediaNotificationControlsPatch;"

@Suppress("unused")
val mediaNotificationControlsPatch = bytecodePatch(
    MEDIA_NOTIFICATION_CONTROLS.title,
    MEDIA_NOTIFICATION_CONTROLS.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(settingsPatch)

    execute {
        addSwitchPreference(
            CategoryType.PLAYER,
            "revanced_hide_notification_media_prev_next",
            "false"
        )
        addSwitchPreference(
            CategoryType.PLAYER,
            "revanced_disable_notification_media_seekbar",
            "false"
        )

        // The third-party lyrics patch hooks the same setPlaybackState call. Every insertion
        // shifts the call index, so the match is resolved again instead of reusing a stale one.
        MediaSessionSetPlaybackStateFingerprint.let {
            it.clearMatch()

            it.method.apply {
                val index = it.instructionMatches.first().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerD

                // Inserted directly before the call, so the filtered state is what the session
                // receives and a hook added earlier or later still runs before the call.
                addInstructions(
                    index,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS_DESCRIPTOR->changePlaybackState(Landroid/media/session/PlaybackState;)Landroid/media/session/PlaybackState;
                        move-result-object v$register
                    """
                )
            }
        }

        updatePatchStatus(MEDIA_NOTIFICATION_CONTROLS)
    }
}

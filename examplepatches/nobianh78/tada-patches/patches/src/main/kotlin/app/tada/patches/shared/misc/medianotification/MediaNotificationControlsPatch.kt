/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/1322
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.shared.misc.medianotification

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.MediaSessionSetPlaybackStateFingerprint
import app.tada.patches.shared.misc.settings.preference.BasePreferenceScreen
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

internal const val EXTENSION_CLASS =
    "Lapp/morphe/extension/shared/patches/MediaNotificationControlsPatch;"

internal fun mediaNotificationControlsPatch(
    block: BytecodePatchBuilder.() -> Unit,
    preferenceScreen: BasePreferenceScreen.Screen,
    executeBlock: BytecodePatchContext.() -> Unit = {},
) = bytecodePatch(
    name = "Media notification controls",
    description = "Adds options to disable the seekbar and previous/next buttons in the " +
            "media notification and headphone controls.",
) {
    block()

    execute {
        preferenceScreen.addPreferences(
            PreferenceScreenPreference(
                key = "tada_notification_media_screen",
                preferences = setOf(
                    SwitchPreference("tada_hide_notification_media_prev_next", summary = true),
                    SwitchPreference("tada_disable_notification_media_seekbar", summary = true),
                )
            )
        )

        MediaSessionSetPlaybackStateFingerprint.let {
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

        executeBlock()
    }
}

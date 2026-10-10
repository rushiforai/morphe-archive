/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.music.interaction.remember.repeatstate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_32_or_greater
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/RememberRepeatStatePatch;"

@Suppress("unused")
val rememberRepeatStatePatch = bytecodePatch(
    name = "Remember repeat state",
    description = "Adds an option to remember the repeat state when playing a new track or playlist."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            SwitchPreference("tada_music_remember_repeat_state"),
        )

        val fingerprint = if (is_9_32_or_greater) {
            RepeatTrackFingerprint
        } else {
            RepeatTrackLegacyFingerprint
        }

        val startIndex = fingerprint.instructionMatches.last().index
        val moveResultIndex = fingerprint.instructionMatches[4].index

        fingerprint.method.apply {
            // Start index is at a branch, but the same
            // register is clobbered in both branch paths.
            val targetRegister = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            addInstructionsWithLabels(
                startIndex,
                """
                    if-nez v$targetRegister, :skip_override
                    invoke-static { }, $EXTENSION_CLASS->rememberRepeatState()Z
                    move-result v$targetRegister
                    :skip_override
                    nop
                """
            )
        }
    }
}

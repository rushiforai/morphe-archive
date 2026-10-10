/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.interaction.seekbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.layout.seekbar.seekbarColorPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playservice.is_20_28_or_greater
import app.tada.patches.youtube.misc.playservice.is_21_36_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.SeekbarOnDrawFingerprint
import app.morphe.util.insertLiteralOverride

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/HideSeekbarPatch;"

val hideSeekbarPatch = bytecodePatch(
    description = "Adds an option to hide the seekbar.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        seekbarColorPatch,
        versionCheckPatch
    )

    execute {
        PreferenceScreen.SEEKBAR.addPreferences(
            SwitchPreference("tada_hide_seekbar"),
            SwitchPreference("tada_hide_seekbar_thumbnail", summary = true)
        )

        if (is_20_28_or_greater && !is_21_36_or_greater) {
            PreferenceScreen.SEEKBAR.addPreferences(
                SwitchPreference("tada_fullscreen_large_seekbar")
            )

            FullscreenLargeSeekbarFeatureFlagFingerprint.matchAll().forEach {
                it.method.insertLiteralOverride(
                    it.instructionMatches.first().index,
                    "$EXTENSION_CLASS->useFullscreenLargeSeekbar(Z)Z"
                )
            }
        }

        SeekbarOnDrawFingerprint.method.addInstructionsWithLabels(
            0,
            """
                const/4 v0, 0x0
                invoke-static { }, $EXTENSION_CLASS->hideSeekbar()Z
                move-result v0
                if-eqz v0, :hide_seekbar
                return-void
                :hide_seekbar
                nop
            """
        )
    }
}

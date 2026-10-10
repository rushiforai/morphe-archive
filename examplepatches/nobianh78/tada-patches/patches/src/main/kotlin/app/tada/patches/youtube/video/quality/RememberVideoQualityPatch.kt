/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.video.quality

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.VideoQualityChangedFingerprint
import app.tada.patches.youtube.video.information.onCreateHook
import app.tada.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.findFieldFromToString
import app.morphe.util.insertLiteralOverride
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/playback/quality/RememberVideoQualityPatch;"

val rememberVideoQualityPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch,
        videoInformationPatch,
        playerTypeHookPatch,
        settingsPatch,
        versionCheckPatch,
    )

    execute {
        settingsMenuVideoQualityGroup.addAll(listOf(
            ListPreference(
                key = "tada_video_quality_default_mobile",
                entriesKey = "tada_video_quality_default_entries",
                entryValuesKey = "tada_video_quality_default_entry_values"
            ),
            ListPreference(
                key = "tada_video_quality_default_wifi",
                entriesKey = "tada_video_quality_default_entries",
                entryValuesKey = "tada_video_quality_default_entry_values"
            ),
            SwitchPreference("tada_remember_video_quality_last_selected", summary = true),

            ListPreference(
                key = "tada_shorts_quality_default_mobile",
                entriesKey = "tada_shorts_quality_default_entries",
                entryValuesKey = "tada_shorts_quality_default_entry_values",
            ),
            ListPreference(
                key = "tada_shorts_quality_default_wifi",
                entriesKey = "tada_shorts_quality_default_entries",
                entryValuesKey = "tada_shorts_quality_default_entry_values"
            ),
            SwitchPreference("tada_remember_shorts_quality_last_selected", summary = true),
            SwitchPreference("tada_remember_video_quality_last_selected_toast", summary = true)
        ))

        onCreateHook(EXTENSION_CLASS, "newVideoStarted")

        val initialResolutionField = PlaybackStartParametersToStringFingerprint.method
                .findFieldFromToString(FIXED_RESOLUTION_STRING)

        // Inject a call to override initial video quality.
        getPlaybackStartParametersConstructorFingerprint(initialResolutionField).let {
            it.method.apply {
                val index = it.instructionMatches.last().index
                val register = getInstruction<TwoRegisterInstruction>(index).registerA

                addInstructions(
                    index,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->getInitialVideoQuality(Lj$/util/Optional;)Lj$/util/Optional;
                        move-result-object v$register
                    """
                )
            }
        }

        // Inject a call to remember the selected quality for Shorts.
        VideoQualityItemOnClickFingerprint.method.addInstruction(
            0,
            "invoke-static { p3 }, $EXTENSION_CLASS->userChangedShortsQuality(I)V"
        )

        // Inject a call to remember the user selected quality for regular videos.
        VideoQualityChangedFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.last().index
                val register = getInstruction<TwoRegisterInstruction>(index).registerA

                addInstruction(
                    index + 1,
                    "invoke-static { v$register }, $EXTENSION_CLASS->userChangedQuality(I)V",
                )
            }
        }

        // If this flag is enabled, Shorts restart whenever the quality changes.
        listOf(
            ShortsQualityChangeObserverPrimaryFeatureFlagFingerprint,
            ShortsQualityChangeObserverSecondaryFeatureFlagFingerprint
        ).forEach { fingerprint ->
            fingerprint.matchAll().forEach {
                it.method.insertLiteralOverride(
                    it.instructionMatches.first().index, false
                )
            }
        }
    }
}

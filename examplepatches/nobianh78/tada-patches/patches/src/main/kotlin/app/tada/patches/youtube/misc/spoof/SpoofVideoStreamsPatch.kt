/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.misc.spoof

import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.spoof.spoofVideoStreamsPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playservice.is_20_31_or_greater
import app.tada.patches.youtube.misc.playservice.is_20_35_or_greater
import app.tada.patches.youtube.misc.playservice.is_20_39_or_greater
import app.tada.patches.youtube.misc.playservice.is_21_02_or_greater
import app.tada.patches.youtube.misc.playservice.is_21_13_or_greater
import app.tada.patches.youtube.misc.playservice.is_21_20_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.YouTubeActivityOnCreateFingerprint

val spoofVideoStreamsPatch = spoofVideoStreamsPatch(
    extensionClass = "Lapp/morphe/extension/youtube/patches/spoof/SpoofVideoStreamsPatch;",
    mainActivityOnCreateFingerprint = YouTubeActivityOnCreateFingerprint,
    fixMediaFetchHotConfigAlternative = {
        // In 20.14 the flag was merged with 20.03 start playback flag.
        false
    },
    fixParsePlaybackResponseFeatureFlag = {
        true
    },
    fixMediaSessionFeatureFlag = {
        is_20_39_or_greater
    },
    fixReelItemWatchResponseFeatureFlag = {
        // Flag has existed since at least 20.05,
        // but only recently has been causing issues.
        is_20_31_or_greater
    },
    restoreMissingCuepointMethod = { is_20_35_or_greater && !is_21_13_or_greater },
    patchProtoRequest = { is_21_02_or_greater },
    patchProtoRequestLegacy = { !is_21_20_or_greater },

    block = {
        compatibleWith(COMPATIBILITY_YOUTUBE)

        dependsOn(
            sharedExtensionPatch,
            userAgentClientSpoofPatch,
            settingsPatch,
            versionCheckPatch
        )
    },

    executeBlock = {

        PreferenceScreen.MISC.addPreferences(
            PreferenceScreenPreference(
                key = "tada_spoof_video_streams_screen",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference(
                        key = "tada_spoof_video_streams",
                        titleKey = "tada_spoof_video_streams_screen_title",
                        summary = true
                    ),
                    ListPreference("tada_spoof_video_streams_client_type"),
                    NonInteractivePreference(
                        // Requires a key and title but the actual text is chosen at runtime.
                        key = "tada_spoof_video_streams_about",
                        summaryKey = null,
                        tag = "app.morphe.extension.youtube.settings.preference.SpoofVideoStreamsSideEffectsPreference"
                    ),
                    NonInteractivePreference(
                        key = "tada_spoof_video_streams_sign_in_android_vr_about",
                        tag = "app.morphe.extension.youtube.settings.preference.SpoofVideoStreamsSignInPreference",
                        selectable = true,
                    ),
                    SwitchPreference("tada_spoof_video_streams_av1", summary = true),
                    ListPreference("tada_spoof_video_streams_player_js_variant"),
                    SwitchPreference("tada_spoof_video_streams_stats_for_nerds"),
                )
            )
        )
    }
)

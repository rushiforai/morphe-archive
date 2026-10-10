/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.music.misc.spoof

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_20_or_greater
import app.tada.patches.music.misc.playservice.is_9_24_or_greater
import app.tada.patches.music.misc.playservice.versionCheckPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.shared.MusicActivityOnCreateFingerprint
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.spoof.spoofVideoStreamsPatch

val spoofVideoStreamsPatch = spoofVideoStreamsPatch(
    extensionClass = "Lapp/morphe/extension/music/patches/spoof/SpoofVideoStreamsPatch;",
    mainActivityOnCreateFingerprint = MusicActivityOnCreateFingerprint,
    // Only 8.11 to 8.14 needed this, and those versions are no longer supported.
    fixMediaFetchHotConfigAlternative = { false },
    fixParsePlaybackResponseFeatureFlag = { !is_9_24_or_greater },
    fixMediaSessionFeatureFlag = { true },
    fixReelItemWatchResponseFeatureFlag = { false },
    // Only 8.35 to 9.11 needed this, and those versions are no longer supported.
    restoreMissingCuepointMethod = { false },
    patchProtoRequest = { true },
    patchProtoRequestLegacy = { !is_9_20_or_greater },

    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            versionCheckPatch,
            userAgentClientSpoofPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
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
                        key = "tada_spoof_video_streams_sign_in_android_vr_about",
                        tag = "app.morphe.extension.music.settings.preference.SpoofVideoStreamsSignInPreference",
                        selectable = true,
                    ),
                )
            )
        )
    }
)

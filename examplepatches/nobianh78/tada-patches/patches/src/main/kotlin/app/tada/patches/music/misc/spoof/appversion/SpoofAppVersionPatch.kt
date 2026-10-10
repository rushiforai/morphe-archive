/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/1948
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.music.misc.spoof.appversion

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.spoof.appversion.baseSpoofAppVersionPatch

@Suppress("unused")
val spoofAppVersionPatch = baseSpoofAppVersionPatch(
    defaultTargetString = { "8.23.51" },
    preferenceScreen = PreferenceScreen.GENERAL,
    listPreference = {
        ListPreference(
            key = "tada_spoof_app_version_target",
            entriesKey = "tada_music_spoof_app_version_target_entries",
            entryValuesKey = "tada_music_spoof_app_version_target_entry_values"
        )
    },
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    }
)

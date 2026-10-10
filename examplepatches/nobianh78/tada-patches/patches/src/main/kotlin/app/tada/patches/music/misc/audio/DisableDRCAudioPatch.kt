/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.audio

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_19_or_greater
import app.tada.patches.music.misc.playservice.is_9_20_or_greater
import app.tada.patches.music.misc.playservice.versionCheckPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.audio.drc.disableDRCAudioPatch

@Suppress("unused")
val disableDRCAudioPatch = disableDRCAudioPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            versionCheckPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },
    preferenceScreen = PreferenceScreen.MISC,
    useLegacyNormalizationFlag = { !is_9_19_or_greater },
    // Ignore 9.19 because it's missing a flag and requires version specific changes to support.
    useNormalizationFlag = { is_9_20_or_greater }
)

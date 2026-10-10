/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2695
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.refreshrate

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.refreshrate.baseAppRefreshRatePatch

@Suppress("unused")
val appRefreshRatePatch = baseAppRefreshRatePatch(
    preferenceScreen = PreferenceScreen.MISC,
    useRefreshRateType = false,
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    }
)


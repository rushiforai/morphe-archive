/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3288
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.medianotification

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.medianotification.mediaNotificationControlsPatch

@Suppress("unused")
val mediaNotificationControlsPatchMusic = mediaNotificationControlsPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },
    preferenceScreen = PreferenceScreen.PLAYER
)

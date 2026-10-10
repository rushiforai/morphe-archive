/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.quic

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.quic.disableQUICProtocolPatch

@Suppress("unused")
val disableQUICProtocolPatchMusic = disableQUICProtocolPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },
    preferenceScreen = PreferenceScreen.MISC
)

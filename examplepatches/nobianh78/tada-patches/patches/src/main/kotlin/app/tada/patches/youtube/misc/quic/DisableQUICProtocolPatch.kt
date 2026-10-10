/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.misc.quic

import app.tada.patches.shared.misc.quic.disableQUICProtocolPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

@Suppress("unused")
val disableQUICProtocolPatchYouTube = disableQUICProtocolPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE)
    },
    preferenceScreen = PreferenceScreen.MISC
)

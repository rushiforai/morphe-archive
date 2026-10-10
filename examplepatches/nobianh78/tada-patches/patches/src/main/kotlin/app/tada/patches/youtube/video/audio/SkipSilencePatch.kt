/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3467
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.video.audio

import app.tada.patches.shared.misc.audio.silence.skipSilencePatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playservice.is_20_49_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

@Suppress("unused")
val skipSilencePatch = skipSilencePatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            versionCheckPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE)
    },
    targetCompatible = { is_20_49_or_greater },
    preferenceScreen = PreferenceScreen.VIDEO,
)

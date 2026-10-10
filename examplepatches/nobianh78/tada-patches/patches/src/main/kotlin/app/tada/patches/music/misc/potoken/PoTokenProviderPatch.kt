/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2618
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.potoken

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.potoken.poTokenProviderPatch

@Suppress("unused")
val poTokenProviderPatch = poTokenProviderPatch(
    originalAppPackageName = COMPATIBILITY_YOUTUBE_MUSIC.packageName!!,
    preferenceScreen = PreferenceScreen.MISC,
    block = {
        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

        dependsOn(sharedExtensionPatch)
    }
)

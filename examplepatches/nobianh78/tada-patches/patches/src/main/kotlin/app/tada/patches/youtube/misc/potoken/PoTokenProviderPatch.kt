/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2618
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.misc.potoken

import app.tada.patches.shared.misc.potoken.poTokenProviderPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

@Suppress("unused")
val poTokenProviderPatch = poTokenProviderPatch(
    originalAppPackageName = COMPATIBILITY_YOUTUBE.packageName!!,
    preferenceScreen = PreferenceScreen.MISC,
    block = {
        compatibleWith(COMPATIBILITY_YOUTUBE)

        dependsOn(sharedExtensionPatch)
    }
)

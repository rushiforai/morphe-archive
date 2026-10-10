/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.layout.buttons.overlay

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.BasePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch

// Use initially null field so an exception is thrown if this patch was not included.
private var playerOverlayPreferences : MutableSet<BasePreference>? = null

internal fun addPlayerOverlayPreferences(vararg preference: BasePreference) {
    playerOverlayPreferences!!.addAll(preference)
}

internal val playerOverlayButtonsSettingsPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    execute {
        playerOverlayPreferences = mutableSetOf()
    }

    finalize {
        if (playerOverlayPreferences!!.isNotEmpty()) {
            PreferenceScreen.PLAYER.addPreferences(
                PreferenceScreenPreference(
                    key = "tada_overlay_buttons_screen",
                    preferences = playerOverlayPreferences!!
                )
            )
        }

        playerOverlayPreferences = null
    }
}

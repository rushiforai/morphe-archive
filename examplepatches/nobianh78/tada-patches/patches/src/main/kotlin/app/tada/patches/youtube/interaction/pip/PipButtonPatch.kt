/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3397
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.interaction.pip

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.hide.player.flyoutmenu.addPlayerFlyoutMenuPreferences
import app.tada.patches.youtube.layout.hide.player.flyoutmenu.playerFlyoutPreferences
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.layout.player.icons.playerIconStylePatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addTopControl
import app.tada.patches.youtube.misc.playercontrols.initializeTopControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

private val pipButtonResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        legacyPlayerControlsPatch,
        playerIconStylePatch,
    )

    execute {
        copyPlayerButtonIcons("pipbutton", "tada_pip_button")
    }
}

private const val EXTENSION_BUTTON = "Lapp/morphe/extension/youtube/videoplayer/PipButton;"

@Suppress("unused")
val pipButtonPatch = bytecodePatch(
    name = "Picture-in-picture button",
    description = "Adds an option to display a picture-in-picture button in the video player."
) {
    dependsOn(
        pipButtonResourcePatch,
        sharedExtensionPatch,
        settingsPatch,
        legacyPlayerControlsPatch,
        playerOverlayButtonsSettingsPatch,
        playerFlyoutPreferences,
        bytecodePatch {
            finalize {
                addTopControl(
                    "pipbutton",
                    "@+id/tada_pip_button",
                    "@+id/tada_pip_button",
                )
            }
        }
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPlayerOverlayPreferences(
            SwitchPreference("tada_pip_button_overlay")
        )
        addPlayerFlyoutMenuPreferences(
            SwitchPreference("tada_pip_button_flyout")
        )

        initializeTopControl(EXTENSION_BUTTON)
    }
}

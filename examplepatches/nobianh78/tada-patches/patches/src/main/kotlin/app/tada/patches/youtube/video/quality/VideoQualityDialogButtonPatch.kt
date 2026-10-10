/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.video.quality

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.noTitleUnsortedPreferenceCategory
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.tada.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.settings.settingsPatch

private val videoQualityButtonResourcePatch = resourcePatch {
    dependsOn(legacyPlayerControlsPatch)

    execute {
        addLegacyBottomControl("qualitybutton")
    }
}

private const val EXTENSION_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/VideoQualityDialogButton;"

val videoQualityDialogButtonPatch = bytecodePatch(
    description = "Adds the option to display video quality dialog button in the video player.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        playerOverlayButtonsSettingsPatch,
        rememberVideoQualityPatch,
        videoQualityButtonResourcePatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
    )

    execute {
        addPlayerOverlayPreferences(
            noTitleUnsortedPreferenceCategory(
                SwitchPreference("tada_video_quality_dialog_button", summary = true),
                SwitchPreference("tada_video_quality_dialog_button_resolution", summary = true)
            )
        )

        addPlayerBottomButton(EXTENSION_BUTTON)

        initializeLegacyBottomControl(EXTENSION_BUTTON)
    }
}

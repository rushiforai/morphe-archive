@file:Suppress("SpellCheckingInspection")

package app.tada.patches.youtube.interaction.playall

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.noTitleUnsortedPreferenceCategory
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addTopControl
import app.tada.patches.youtube.misc.playercontrols.initializeTopControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.information.videoInformationPatch

private val playAllButtonResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        legacyPlayerControlsPatch
    )

    execute {

        copyPlayerButtonIcons("playallbutton", "tada_play_all_button")
    }

    finalize {
        addTopControl("playallbutton",
            "@+id/tada_play_all_button",
            "@+id/tada_play_all_button")
    }
}

private const val EXTENSION_BUTTON = "Lapp/morphe/extension/youtube/videoplayer/PlayAllButton;"

@Suppress("unused")
val playAllButtonPatch = bytecodePatch(
    name = "Play all",
    description = "Adds an option to play all the videos from a channel and to display play all button in the video player.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        playAllButtonResourcePatch,
        playerOverlayButtonsSettingsPatch,
        videoInformationPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPlayerOverlayPreferences(
            noTitleUnsortedPreferenceCategory(
                SwitchPreference("tada_play_all_button", summary = true),
                ListPreference("tada_play_all_button_type")
            )
        )

        initializeTopControl(EXTENSION_BUTTON)
    }
}

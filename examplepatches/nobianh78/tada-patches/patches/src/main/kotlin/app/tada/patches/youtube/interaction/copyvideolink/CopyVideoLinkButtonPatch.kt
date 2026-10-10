package app.tada.patches.youtube.interaction.copyvideolink

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.noTitleUnsortedPreferenceCategory
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.tada.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.information.videoInformationPatch

private const val EXTENSION_BUTTON = "Lapp/morphe/extension/youtube/videoplayer/CopyVideoLinkButton;"

private val copyVideoLinkButtonResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        legacyPlayerControlsPatch
    )

    execute {
        copyPlayerButtonIcons("copyvideolinkbutton", "tada_yt_copy", "tada_yt_copy_timestamp")

        addLegacyBottomControl("copyvideolinkbutton")
    }
}

@Suppress("unused")
val copyVideoLinkButtonPatch = bytecodePatch(
    name = "Copy video link",
    description = "Adds options to display buttons in the video player to copy video links.",
) {
    dependsOn(
        copyVideoLinkButtonResourcePatch,
        playerOverlayButtonsSettingsPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
        videoInformationPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPlayerOverlayPreferences(
            noTitleUnsortedPreferenceCategory(
                SwitchPreference("tada_copy_video_link_button", summary = true),
                SwitchPreference("tada_copy_video_link_with_timestamp_button", summary = true)
            )
        )

        addPlayerBottomButton(EXTENSION_BUTTON)

        initializeLegacyBottomControl(EXTENSION_BUTTON)
    }
}

package app.tada.patches.youtube.layout.player.fullscreen

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.information.onCreateHook
import app.tada.patches.youtube.video.information.playerStatusHook
import app.tada.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.setExtensionIsPatchIncluded

@Suppress("unused")
val openVideosFullscreenPatch = bytecodePatch(
    name = "Open videos fullscreen",
    description = "Adds options to automatically open videos in fullscreen portrait or landscape mode."
) {
    dependsOn(
        openVideosFullscreenHookPatch,
        settingsPatch,
        videoInformationPatch,
        playerTypeHookPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            ListPreference("tada_open_videos_fullscreen")
        )

        setExtensionIsPatchIncluded(EXTENSION_CLASS)
        onCreateHook(EXTENSION_CLASS, "initialize")

        playerStatusHook(EXTENSION_CLASS, "playerStatusChanged")
    }
}

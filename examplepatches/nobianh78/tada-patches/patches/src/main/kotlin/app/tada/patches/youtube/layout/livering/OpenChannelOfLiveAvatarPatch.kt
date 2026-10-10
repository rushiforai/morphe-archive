package app.tada.patches.youtube.layout.livering

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.all.misc.resources.addResourcesPatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.hookVideoIntent
import app.tada.patches.youtube.shared.openVideoIntentPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/OpenChannelOfLiveAvatarPatch;"

@Suppress("unused")
val openChannelOfLiveAvatarPatch = bytecodePatch(
    name = "Open channel of live avatar",
    description = "Adds an option to prevent a channel's current live video from opening when tapping its avatar."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        addResourcesPatch,
        settingsPatch,
        versionCheckPatch,
        openVideoIntentPatch
    )

    execute {
        PreferenceScreen.FEED.addPreferences(
            SwitchPreference("tada_open_channel_of_live_avatar", summary = true)
        )

        hookVideoIntent(EXTENSION_CLASS, detectVideo = true, detectShorts = true)
    }
}

/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2334
 */

package app.tada.patches.youtube.misc.whitelist

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.ad.hideAdsPatch
import app.tada.patches.youtube.layout.flyout.flyoutPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.speed.remember.rememberPlaybackSpeedPatch
import app.tada.patches.youtube.video.speed.settingsMenuVideoSpeedGroup

private const val PREFERENCE_CLASS = "app.morphe.extension.youtube.settings.preference.ChannelWhitelistPreference"

@Suppress("unused")
val channelWhitelistPatch = bytecodePatch(
    name = "Channel whitelist",
    description = "Adds options to allow whitelisting specific channels to show ads or override playback speeds."
) {
    dependsOn(
        settingsPatch,
        flyoutPatch,
        hideAdsPatch,
        rememberPlaybackSpeedPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.ADS.addPreferences(
            NonInteractivePreference(
                key = "tada_ads_channel_whitelist",
                tag = PREFERENCE_CLASS,
                selectable = true
            )
        )

        settingsMenuVideoSpeedGroup.add(
            NonInteractivePreference(
                key = "tada_playback_speed_channel_whitelist",
                tag = PREFERENCE_CLASS,
                selectable = true
            )
        )

        PreferenceScreen.FEED.addPreferences(
            SwitchPreference("tada_ads_channel_whitelist_flyout_menu", summary = true),
            SwitchPreference("tada_playback_speed_channel_whitelist_flyout_menu", summary = true)
        )
    }
}

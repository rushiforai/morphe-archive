package io.github.jordanwoodson.patches.twitch.icon

import app.morphe.patcher.patch.resourcePatch
import io.github.jordanwoodson.patches.shared.apps.TWITCH
import io.github.jordanwoodson.patches.shared.apps.lurkIcon
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch

@Suppress("unused")
val lurkIconPatch = resourcePatch(
    name = "Lurk icon",
    description = "Replaces Twitch's launcher icon with Lurk artwork, including Android's themed icon. Lurk " +
        "settings > Interface > App icon switches back to Twitch's own icon without patching again (not on a " +
        "root mount install).",
) {
    lurkIcon(TWITCH, twitchSettingsPatch)
}

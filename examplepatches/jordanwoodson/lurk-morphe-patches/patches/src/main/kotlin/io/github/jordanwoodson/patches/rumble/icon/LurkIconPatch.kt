package io.github.jordanwoodson.patches.rumble.icon

import app.morphe.patcher.patch.resourcePatch
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.shared.apps.RUMBLE
import io.github.jordanwoodson.patches.shared.apps.lurkIcon

@Suppress("unused")
val lurkIconPatch = resourcePatch(
    name = "Lurk icon",
    description = "Replaces Rumble's launcher icon with the Lurk icon, including the themed icon on Android 13+. " +
        "Lurk settings > Interface > App icon switches back to Rumble's own icon without patching again (not on " +
        "a root mount install).",
) {
    lurkIcon(RUMBLE, settingsPatch)
}

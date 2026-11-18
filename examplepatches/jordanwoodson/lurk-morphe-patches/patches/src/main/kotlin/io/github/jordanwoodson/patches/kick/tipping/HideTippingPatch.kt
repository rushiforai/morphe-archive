package io.github.jordanwoodson.patches.kick.tipping

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "hide_kicks"

@Suppress("unused")
val hideTippingPatch = bytecodePatch(
    name = "Hide KICKs tipping",
    description = "Hides the chat gift-shop button, KICKs purchase button and leaderboard tipping prompt. Received " +
        "gifts still show. Starts off. Turn it on in Lurk settings > Interface." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch)

    execute {
        // These are leaf UI components. Their parents use ordinary React children without a fixed
        // placeholder, so null removes the entry point without an empty button or modal. Each returns before its
        // prologue, whichever environment and parameter loads it starts with.
        for (component in listOf("KicksShopButton", "GetKicksButton", "LeaderboardKicksFooter")) {
            kickHermes.returnAtEntry(component, KEY, defaultEnabled = false)
        }
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Hide KICKs tipping",
                "Hide gift-shop, purchase and leaderboard tipping prompts. Received gifts still show.",
                Section.INTERFACE,
                default = false,
                restart = true,
            ),
        )
    }
}

package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.bytecodePatch
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.TwitchTarget
import dev.twitchpatches.patches.twitch.shared.resolveIvsHttp
import dev.twitchpatches.patches.twitch.shared.applyIvsHttp
import dev.twitchpatches.patches.twitch.shared.IVS_NET

@Suppress("unused")
val blockStitchedAdsPatch = bytecodePatch(
    name = "Block stream ads",
    description = "Replaces detected preroll and midroll ads with direct Twitch playback.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, reactNativeStreamAdsPatch)
    execute {
        val http = resolveIvsHttp()
        val tokens = resolveNativeTokens()
        applyNativeTokens(tokens)
        applyIvsHttp(http, "$AD_RUNTIME->wrap(${IVS_NET}HttpClient;)${IVS_NET}HttpClient;")
        initializeAdFeature(2)
    }
}

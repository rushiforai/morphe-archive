package app.morphed.patches.twitch.unlock

import app.morphe.patcher.patch.bytecodePatch
import app.morphed.patches.twitch.settings.patchSettingsPatch
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import app.morphed.patches.twitch.shared.markIncluded
import app.morphed.patches.twitch.shared.playerHttpHookPatch

@Suppress("unused")
val qualityUnlockPatch = bytecodePatch(
    name = "Quality unlock",
    description = "Unlocks the higher qualities (1440p) Twitch offers only in some countries: a stream's playlist " +
        "is also asked for through your WireGuard VPN server, and when it offers more, that stream plays through " +
        "the VPN. Nothing else in the app uses it. Servers are added in Settings, Patch settings.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(playerHttpHookPatch, patchSettingsPatch)
    extendWith("extensions/twitch.mpe")

    execute {
        markIncluded("qualityUnlock")
    }
}

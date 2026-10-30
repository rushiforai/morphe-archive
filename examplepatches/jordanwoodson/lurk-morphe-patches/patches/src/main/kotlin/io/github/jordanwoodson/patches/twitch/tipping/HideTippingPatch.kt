package io.github.jordanwoodson.patches.twitch.tipping

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.twitch.clips.hideBitsInterface
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch

@Suppress("unused")
val hideTippingPatch = bytecodePatch(
    name = "Hide Bits tipping",
    description = "Hides chat Bits buttons, Bits purchase cards, the cheering tray and one-tap Bits controls. " +
        "Keeps normal chat and Bits messages sent by other viewers.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        twitchHermes.hideBitsInterface()
        filterBitsFlag(ChatToolbarStateFingerprint, ", isBitsButtonVisible=")
        filterBitsFlag(ChatToolbarStateFingerprint, ", isBitsSpendingTrayVisibleBasedOnInput=")
        filterBitsFlag(OneChatStateFingerprint, ", isBitsButtonVisible=")
        filterBitsFlag(OneChatStateFingerprint, ", isOneTapEnabled=")
        filterBitsFlag(MessageInputConfigFingerprint, ", isBitsPickerVisible=")
        filterBitsFlag(ChatHeaderButtonsStateFingerprint, ", isBitsButtonEnabled=")
        twitchSettings.add(SwitchSetting("hide_tipping", "Hide Bits tipping", "Bits purchase buttons and cheering prompts. Received cheers still appear.", Section.INTERFACE, restart = true))
    }
}

package io.github.bakwudo.uyu.patches.twitch.enhancement

import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.ads.blockAdsPatch
import io.github.bakwudo.uyu.patches.twitch.appearance.hidePromotionsPatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmoteAutocompletePatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerPatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerUrlPatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotesPatch
import io.github.bakwudo.uyu.patches.twitch.login.fixLoginPatch
import io.github.bakwudo.uyu.patches.twitch.notifications.fixNotificationsPatch
import io.github.bakwudo.uyu.patches.twitch.privacy.privacyPatch
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH

@Suppress("unused")
val twitchEnhancementPatch = bytecodePatch(
    name = "Twitch Enhancement",
    description = "Kizu 0.3: live ad proxy, third-party emotes, privacy controls, Bits-button control, " +
        "and patched-app login/notification compatibility.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(
        settingsPatch,
        fixLoginPatch,
        fixNotificationsPatch,
        blockAdsPatch,
        hidePromotionsPatch,
        thirdPartyEmotesPatch,
        thirdPartyEmotePickerPatch,
        thirdPartyEmotePickerUrlPatch,
        thirdPartyEmoteAutocompletePatch,
        privacyPatch,
    )
}

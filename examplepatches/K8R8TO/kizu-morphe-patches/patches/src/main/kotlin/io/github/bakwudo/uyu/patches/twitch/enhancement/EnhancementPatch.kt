package io.github.bakwudo.uyu.patches.twitch.enhancement

import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.ads.blockAdsPatch
import io.github.bakwudo.uyu.patches.twitch.channelpoints.autoClaimChannelPointsPatch
import io.github.bakwudo.uyu.patches.twitch.appearance.hidePromotionsPatch
import io.github.bakwudo.uyu.patches.twitch.chat.showDeletedMessagesPatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotesPatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerPatch
import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerUrlPatch
import io.github.bakwudo.uyu.patches.twitch.login.fixLoginPatch
import io.github.bakwudo.uyu.patches.twitch.navigation.defaultHomeTabPatch
import io.github.bakwudo.uyu.patches.twitch.notifications.fixNotificationsPatch
import io.github.bakwudo.uyu.patches.twitch.privacy.privacyPatch
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH

@Suppress("unused")
val twitchEnhancementPatch = bytecodePatch(
    name = "Twitch Enhancement",
    description = "Kizu Twitch enhancements: third-party emotes, live ad blocking, appearance controls, deleted-message display, privacy controls, Hide Stories, Go Ad-Free hiding, and patched-app compatibility.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(
        settingsPatch,
        defaultHomeTabPatch,
        fixLoginPatch,
        fixNotificationsPatch,
        blockAdsPatch,
        autoClaimChannelPointsPatch,
        hidePromotionsPatch,
        showDeletedMessagesPatch,
        thirdPartyEmotesPatch,
        thirdPartyEmotePickerPatch,
        thirdPartyEmotePickerUrlPatch,
        privacyPatch,
    )
}

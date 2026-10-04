package io.github.bakwudo.uyu.patches.twitch.channelpoints

import io.github.bakwudo.uyu.patches.twitch.settings.setPatchIncluded
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * Enables the extension-side channel-points watcher.
 *
 * Auto-claim itself is intentionally kept out of Twitch's CommunityPointsModel/provider bytecode:
 * touching that lifecycle path caused the chat/UI regressions seen in the previous builds.
 */
internal val autoClaimChannelPointsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(settingsPatch, sharedExtensionPatch)

    execute {
        setPatchIncluded("autoClaimChannelPoints")
    }
}

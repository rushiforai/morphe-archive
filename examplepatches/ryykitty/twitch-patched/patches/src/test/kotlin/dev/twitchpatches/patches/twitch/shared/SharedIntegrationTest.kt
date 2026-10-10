package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.Patch
import dev.twitchpatches.patches.twitch.ads.blockClientAdsPatch
import dev.twitchpatches.patches.twitch.ads.blockStitchedAdsPatch
import dev.twitchpatches.patches.twitch.ads.hideDisplayAdsPatch
import dev.twitchpatches.patches.twitch.channelpoints.autoClaimChannelPointsPatch
import dev.twitchpatches.patches.twitch.diagnostics.inspectBaselinePatch
import dev.twitchpatches.patches.twitch.diagnostics.inspectPlaybackPatch
import dev.twitchpatches.patches.twitch.emotes.thirdPartyEmotesPatch
import dev.twitchpatches.patches.twitch.notifications.notificationRegistrationPatch
import dev.twitchpatches.patches.twitch.promotions.hideSubscriptionBannersPatch
import dev.twitchpatches.patches.twitch.promotions.hideTurboPromotionsPatch
import dev.twitchpatches.patches.twitch.reload.reloadStreamPatch
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import org.junit.Assert.assertTrue
import org.junit.Test

class SharedIntegrationTest {
    @Test fun everyModifyingSelectionIncludesSharedSettingsAndPlayback() {
        val selections = listOf(blockClientAdsPatch, blockStitchedAdsPatch, hideDisplayAdsPatch,
            autoClaimChannelPointsPatch, inspectPlaybackPatch, thirdPartyEmotesPatch,
            hideSubscriptionBannersPatch, hideTurboPromotionsPatch, reloadStreamPatch)
        val required = setOf(settingsPatch, reactNativeBridgePatch, reactNativeAssetsPatch,
            notificationRegistrationPatch)
        selections.forEach { patch ->
            assertTrue("${patch.name} omits shared integration", dependencies(patch).containsAll(required))
        }
    }

    @Test fun inspectionHasNoModifyingDependencies() {
        assertTrue(dependencies(inspectBaselinePatch).isEmpty())
    }

    private fun dependencies(patch: Patch<*>): Set<Patch<*>> {
        val result = mutableSetOf<Patch<*>>()
        fun visit(current: Patch<*>) {
            current.dependencies.forEach { if (result.add(it)) visit(it) }
        }
        visit(patch)
        return result
    }
}

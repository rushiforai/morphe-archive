package dev.twitchpatches.patches.twitch.channelpoints

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.appendReactAdapter
import dev.twitchpatches.patches.twitch.shared.reactNativeAssetsPatch

internal val reactNativePointsPatch = resourcePatch {
    dependsOn(reactNativeAssetsPatch)
    execute {
        appendReactAdapter("useClaimableBonus", setOf("availableClaimID", "channelId", "hasChannel",
            "currentUserID", "useMutation", "CLAIM_COMMUNITY_POINTS_MUTATION"), null)
    }
}

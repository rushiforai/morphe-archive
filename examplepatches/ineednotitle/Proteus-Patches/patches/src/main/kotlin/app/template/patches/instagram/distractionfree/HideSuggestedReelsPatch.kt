/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.template.patches.instagram.shared.replaceJsonFieldWithBogus

private val FEED_ITEM_KEYS_TO_BE_HIDDEN = arrayOf(
    "clips_netego",
    "stories_netego",
    "in_feed_survey",
    "bloks_netego",
    "suggested_igd_channels",
    "suggested_top_accounts",
    "suggested_users",
    "suggested_businesses",
    "suggested_hashtags",
    "suggested_producers_v2",
    "suggested_producers",
    "suggested_close_friends",
    "suggested_shops",
)

private object FeedItemParseFromJsonFingerprint : Fingerprint(
    strings = listOf(*FEED_ITEM_KEYS_TO_BE_HIDDEN),
    name = "unsafeParseFromJson",
)

context(patchContext: BytecodePatchContext)
internal fun hideSuggestedReelsPatch() = FeedItemParseFromJsonFingerprint.method.apply {
    FEED_ITEM_KEYS_TO_BE_HIDDEN.forEach { key ->
        replaceJsonFieldWithBogus(key)
    }
}

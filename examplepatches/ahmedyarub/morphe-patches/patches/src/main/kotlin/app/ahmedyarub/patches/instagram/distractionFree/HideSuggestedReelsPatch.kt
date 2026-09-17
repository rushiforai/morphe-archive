/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * Compatibility widened to Instagram 446.0.0.49.77; patch logic unchanged.
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.morphe.library.instagram.utility.replaceJsonFieldWithBogus
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext

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
    "suggested_shops"
)

// The feed-item-type keys used to sit as literals inside the feed's unsafeParseFromJson. On
// 447 R8 pooled them into the <clinit> of the obfuscated feed-item-type enum, so match on the
// full key set alone: only that pool carries all of them together. replaceJsonFieldWithBogus
// then overwrites each wire name in place, which is safe — the enum's valueOf keys off the enum
// name, not the wire name, so an unrecognised wire name falls through to the skip path.
private object FeedItemParseFromJsonFingerprint : Fingerprint(
    strings = listOf(*FEED_ITEM_KEYS_TO_BE_HIDDEN),
)

context(_: BytecodePatchContext)
fun hideSuggestedReelsPatch() = FeedItemParseFromJsonFingerprint.method.apply {
    FEED_ITEM_KEYS_TO_BE_HIDDEN.forEach { key ->
        replaceJsonFieldWithBogus(key)
    }
}

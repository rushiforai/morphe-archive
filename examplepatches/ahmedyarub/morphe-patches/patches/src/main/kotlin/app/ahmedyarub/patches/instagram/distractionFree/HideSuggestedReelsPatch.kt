/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.loadedStrings
import app.ahmedyarub.patches.shared.replaceKeyWithBogus
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

/**
 * The feed item parser, which compares each JSON field name against these keys. Renaming a key
 * here means the parser never recognises that field, so the item is left without the content it
 * would show.
 *
 * The key set alone is not enough: on 448 it also matches the item's JSON serializer (A00, which
 * writes the same keys back out) and the feed-item-type enum's initialiser. The serializer comes
 * first in the dex, so an unnamed fingerprint rewrote it and the patch changed nothing a user sees.
 *
 * On 449 some keys are pooled (in_feed_survey, suggested_businesses and suggested_hashtags),
 * so they are looked for among the strings the method loads, not its const-strings. The
 * calling patch must depend on stringPoolsPatch.
 */
private object FeedItemParseFromJsonFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    custom = { method, _ -> method.loadedStrings.containsAll(FEED_ITEM_KEYS_TO_BE_HIDDEN.asList()) },
)

context(_: BytecodePatchContext)
fun hideSuggestedReelsPatch() = FeedItemParseFromJsonFingerprint.method.apply {
    FEED_ITEM_KEYS_TO_BE_HIDDEN.forEach { key ->
        replaceKeyWithBogus(key)
    }
}

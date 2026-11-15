/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.replaceJsonFieldWithBogus
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

private const val FEED_ITEMS_KEY = "feed_items"

private object FeedContentJsonParserFingerprint : Fingerprint(
    strings = listOf(FEED_ITEMS_KEY, "auto_load_more_enabled"),
    name = "unsafeParseFromJson",
)

@Suppress("unused")
val instagramHideFeedContentPatch = bytecodePatch(
    name = "Hide feed content",
    description = "Hide the feed content, leaving only stories in the home page.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        FeedContentJsonParserFingerprint.method.replaceJsonFieldWithBogus(FEED_ITEMS_KEY)
    }
}

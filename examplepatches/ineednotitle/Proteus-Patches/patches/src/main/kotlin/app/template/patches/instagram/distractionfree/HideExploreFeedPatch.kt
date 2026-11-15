/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.JsonParserFingerprint
import app.template.patches.instagram.shared.replaceJsonFieldWithBogus
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

private object ExploreResponseJsonParserFingerprint : JsonParserFingerprint(
    "sectional_items",
    "clusters",
)

@Suppress("unused")
val instagramHideExploreFeedPatch = bytecodePatch(
    name = "Hide explore feed",
    description = "Hides posts and reels from the explore/search page.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        ExploreResponseJsonParserFingerprint.match().replaceJsonFieldWithBogus()
    }
}

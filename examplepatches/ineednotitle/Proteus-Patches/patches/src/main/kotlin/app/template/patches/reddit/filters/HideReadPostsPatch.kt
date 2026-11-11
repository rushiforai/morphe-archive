package app.template.patches.reddit.filters

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import app.template.patches.reddit.shared.injectListingChildrenFilter

/**
 * Hide read posts — Reddit (com.reddit.frontpage)
 *
 * Drops post rows that Reddit has marked as read/visited (`Link.isRead()`).
 * The client still receives the post, so the feed can show gaps until the next
 * refresh; this is a render-time filter, not a server-side query change.
 *
 * The helper resolves the model reflectively, so renamed R8 model classes do
 * not break the patch. If the read getter cannot be resolved the row is kept
 * (fail-safe). Off by default because hiding rows changes the reading flow.
 */
@Suppress("unused")
val redditHideReadPostsPatch = bytecodePatch(
    name = "Hide read posts",
    description = "Hides posts Reddit has marked as read/visited in feeds and listings. " +
        "Client-side only; off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        injectListingChildrenFilter(
            helperMethod = "hideReadPosts",
            logTag = "Hide read posts",
        )
    }
}

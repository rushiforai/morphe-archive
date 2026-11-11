package app.template.patches.reddit.filters

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import app.template.patches.reddit.shared.injectListingChildrenFilter

/**
 * Hide crossposts — Reddit (com.reddit.frontpage)
 *
 * Drops crosspost rows by checking the model's crosspost parent list and
 * crosspost count. Ordinary posts, ads and comments are kept. Off by default.
 */
@Suppress("unused")
val redditHideCrosspostsPatch = bytecodePatch(
    name = "Hide crossposts",
    description = "Hides crossposts in feeds and listings, keeping ordinary posts and comments. " +
        "Client-side only; off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        injectListingChildrenFilter(
            helperMethod = "hideCrossposts",
            logTag = "Hide crossposts",
        )
    }
}

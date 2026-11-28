package semicoloncolonel.mobilestream.patches.foxnews.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants
import semicoloncolonel.mobilestream.patches.foxnews.shared.filterArticleComponents

// ─────────────────────────────────────────────────────────────────────────────
// Fox News 5.51.0 — Hide comments and reactions (OPT-IN, default OFF).
//
// Articles end with a comments section (CommentsComponent, Hedgehog's
// comments SDK) and carry a reactions bar of emoji counts with a "Share Your
// View" button (ReactionsComponent). Both are left out of the article's
// components, so neither row is built and the floating comments button, which
// appears only when the article has a comments section, stays hidden.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideCommentsAndReactionsPatch = bytecodePatch(
    name = "Hide comments and reactions",
    description = "Removes the comments section, the floating comments button, and the emoji reactions from articles.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        filterArticleComponents("withoutCommentsAndReactions")
    }
}

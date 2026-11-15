package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.cards

import app.morphe.patcher.Fingerprint

internal const val CARD_LINK_HOLDER =
    "Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/card/CardLinkHolder;"

/**
 * Where a link post's card comes to exist.
 *
 * <p>The holder is handed the card that has just been inflated, so this is the one moment the
 * whole of it is to hand with nothing bound to it yet — which is what makes it the place to
 * write layout rules rather than any of the methods that run per post. There is exactly one
 * constructor, and the class is one of the few whose name the build keeps, so nothing more than
 * the name is needed to find it. Matching the parameters as well would pin {@code Lya/a;}, a
 * minified name with nothing to recommend it.
 */
internal val cardLinkHolderFingerprint = Fingerprint(
    definingClass = CARD_LINK_HOLDER,
    name = "<init>",
)

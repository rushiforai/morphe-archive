package app.template.patches.redditsync.fixpostbodyimages.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/PostCommentHolder;->h(Lxa/d;I)V
 * ("PostCommentHolder.java", v23.06.30-13:39) — the RecyclerView view holder that binds a
 * post's own header item, including its selftext body. Builds an Lnc/a; ("Options.java")
 * for that body's HTML→Spanned conversion but, unlike CommentsHtmlTextView.J() (which binds
 * a comment's body the same way), never sets its available-width field — see
 * FixPostBodyImagesPatch.kt for why that leaves every inline image in a post body unable to
 * render.
 */
val postCommentHolderBindFingerprint = fingerprint {
    returns("V")
    parameters("Lxa/d;", "I")
    custom { method, classDef ->
        classDef.type == "Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/PostCommentHolder;" &&
            method.name == "h"
    }
}

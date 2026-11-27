package app.template.patches.redditsync.centerpostmedia.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lcom/laurencedawson/reddit_sync/ui/views/comments/CommentsHtmlTextView;
 * ->J(Lxa/d;Ljava/lang/String;)V ("CommentsHtmlTextView.java", v23.06.30-13:39) — builds the
 * Lnc/a; ("Options") object for a comment's own body render, then calls HtmlTextView's H() or
 * I() (depending on whether a search term needs highlighting). This is the one and only place
 * that constructs an Lnc/a; for a comment — marking it here, right after construction, is used
 * to tell HtmlTextView.H() this render is a comment's (see CenterPostMediaPatch.kt).
 */
val commentsHtmlTextViewRenderFingerprint = fingerprint {
    returns("V")
    parameters("Lxa/d;", "Ljava/lang/String;")
    custom { method, classDef ->
        classDef.type == "Lcom/laurencedawson/reddit_sync/ui/views/comments/CommentsHtmlTextView;" &&
            method.name == "J"
    }
}

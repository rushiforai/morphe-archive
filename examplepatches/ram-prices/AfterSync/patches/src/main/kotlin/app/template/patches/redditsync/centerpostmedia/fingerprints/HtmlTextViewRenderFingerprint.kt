package app.template.patches.redditsync.centerpostmedia.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/HtmlTextView;
 * ->H(Lnc/a;Ljava/lang/String;)V ("HtmlTextView.java", v23.06.30-13:39) — the shared render
 * entry point both PostCommentHolder (a post's own body) and CommentsHtmlTextView (a comment
 * body, when not highlighting a search term) call once their Lnc/a; "Options" object is built.
 * Parses the HTML into the pending span queue (Lnc/c;->a(...)), then finalizes it
 * (Loc/b;->F()V, which applies every queued span and sets the TextView's text) — the gap
 * between those two calls is where CenterPostMediaPatch.kt adds centering for post media.
 */
val htmlTextViewRenderFingerprint = fingerprint {
    returns("V")
    parameters("Lnc/a;", "Ljava/lang/String;")
    custom { method, classDef ->
        classDef.type == "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/HtmlTextView;" &&
            method.name == "H"
    }
}

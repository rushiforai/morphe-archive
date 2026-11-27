package app.template.patches.redditsync.fixcommentimagesizing.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lnc/d;->e(Loc/c;Lnc/a;Lnc/b;)V ("SyncHtmlToSpannedConverter" per its source-file
 * annotation, v23.06.30-13:39) — the ~4500-line method that turns a parsed comment/post
 * HTML body into a Spanned string, including deciding whether a URL in the text becomes
 * an inline embedded image, a plain link, or a website-preview card. Shared by both post
 * and comment rendering (confirmed by hand: HtmlTextView, which wraps this, is used by
 * both CommentsFragment and post-body callers).
 *
 * Matched by exact defining class + method name plus the unique "preview.redd.it" string
 * this method contains exactly once (confirmed by hand via apktool) — safe for a
 * version-pinned patch even though the method itself is far too large/generic to match
 * structurally any other way.
 */
val syncHtmlToSpannedConverterFingerprint = fingerprint {
    returns("V")
    parameters("Loc/c;", "Lnc/a;", "Lnc/b;")
    strings("preview.redd.it")
    custom { method, classDef -> classDef.type == "Lnc/d;" && method.name == "e" }
}

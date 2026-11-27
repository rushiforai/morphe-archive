package app.template.patches.redditsync.fixcommentimagesizing.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lnc/d;->y(Loc/c;Lorg/xml/sax/Attributes;)V ("SyncHtmlToSpannedConverter" per its
 * source-file annotation, v23.06.30-13:39) — the &lt;img&gt; HTML-tag handler, used for
 * subreddit "emote" images embedded directly as &lt;img src="..."&gt; (gated by the
 * "comments_emotes"/"Show emotes pictures" setting). Builds a fixed 42dp-square
 * EmoteImageSpan (Lnb/c;) for every such image, regardless of its real size or aspect ratio.
 */
val syncHtmlToSpannedImageTagFingerprint = fingerprint {
    returns("V")
    parameters("Loc/c;", "Lorg/xml/sax/Attributes;")
    custom { method, classDef -> classDef.type == "Lnc/d;" && method.name == "y" }
}

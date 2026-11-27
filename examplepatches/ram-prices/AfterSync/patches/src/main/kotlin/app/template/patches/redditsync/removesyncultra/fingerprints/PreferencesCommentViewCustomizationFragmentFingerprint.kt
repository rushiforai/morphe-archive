package app.template.patches.redditsync.removesyncultra.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/v;->C3(Landroid/os/Bundle;Ljava/lang/String;)V
 * ("PreferencesCommentViewCustomizationFragment" per its source-file annotation,
 * v23.06.30-13:39) — the fragment behind the "Comments" settings screen (res/xml/
 * cat_comment_view_customization.xml, under the root menu's "Appearance" category).
 *
 * Not to be confused with PreferencesCommentsFragment (Lpa/w;, res/xml/cat_comments.xml),
 * which backs the separately-named "Comment options" entry under "Content" — the two are
 * easy to mix up by name alone; this one is the actual target for relocating Ultra's
 * paint/tag/translate/removed-comments perks, since it already has "View tweaks" and
 * "Highlighting" categories of its own.
 */
val preferencesCommentViewCustomizationFragmentFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/os/Bundle;", "Ljava/lang/String;")
    custom { method, classDef -> classDef.type == "Lpa/v;" && method.name == "C3" }
}

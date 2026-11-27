package app.template.patches.redditsync.rebrandabout.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/w0$b;->a(Landroidx/preference/Preference;)Z (v23.06.30-13:39) — the click
 * listener for "about_preference" (the AfterSync/app-name row), confirmed by hand to
 * open an old dev release-notes Reddit thread ("/r/redditsync/comments/11529s5") via
 * Ly7/b;->b(Landroid/content/Context;Ljava/lang/String;)Z, Sync's general link-opening
 * helper. Swapped for this repo's GitHub releases page.
 */
val aboutListenerFingerprint = fingerprint {
    returns("Z")
    parameters("Landroidx/preference/Preference;")
    strings("/r/redditsync/comments/11529s5")
    custom { method, classDef -> classDef.type == "Lpa/w0\$b;" && method.name == "a" }
}

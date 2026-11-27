package app.template.patches.redditsync.rebrandabout.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/w0;->C3(Landroid/os/Bundle;Ljava/lang/String;)V ("PreferencesOtherFragment"
 * per its source-file annotation, v23.06.30-13:39) — the fragment behind the About
 * screen (res/xml/cat_other.xml). Confirmed by hand via apktool: wires up click
 * listeners for "backers", "about_preference" (also sets its title/summary text here,
 * in code, not XML), "licenses_preference", "feedback_preference", "rate_preference",
 * and "credit_dev" by key, then builds and shuffles a 7-entry username list and loops
 * over it building "mod_0".."mod_6" preference keys to set their summary/click listener.
 */
val preferencesOtherFragmentFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/os/Bundle;", "Ljava/lang/String;")
    custom { method, classDef -> classDef.type == "Lpa/w0;" && method.name == "C3" }
}

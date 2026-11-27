package app.template.patches.redditsync.rebrandabout.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/w0$f;->a(Landroidx/preference/Preference;)Z (v23.06.30-13:39) — the click
 * listener for the "credit_dev" Credits row, confirmed by hand to open "/u/ljdawson" via
 * Ly7/b;->b(Landroid/content/Context;Ljava/lang/String;)Z, Sync's general link-opening
 * helper (used throughout the app for both Reddit-relative paths and full URLs).
 */
val creditDevListenerFingerprint = fingerprint {
    returns("Z")
    parameters("Landroidx/preference/Preference;")
    strings("/u/ljdawson")
    custom { method, classDef -> classDef.type == "Lpa/w0\$f;" && method.name == "a" }
}

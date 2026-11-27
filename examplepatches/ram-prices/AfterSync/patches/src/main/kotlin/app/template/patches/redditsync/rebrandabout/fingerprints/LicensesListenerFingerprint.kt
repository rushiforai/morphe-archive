package app.template.patches.redditsync.rebrandabout.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/w0$c;->a(Landroidx/preference/Preference;)Z (v23.06.30-13:39) — the click
 * listener for "licenses_preference", confirmed by hand to open
 * "https://todo.syncforreddit.com/licenses.html" (a dead/staging-looking domain, not an
 * actual open-source license list — no bundled licenses file exists in the app to point
 * it at instead) via Ly7/b;->b(Landroid/content/Context;Ljava/lang/String;)Z. Swapped
 * for this repo's own LICENSE file on GitHub, per explicit request.
 */
val licensesListenerFingerprint = fingerprint {
    returns("Z")
    parameters("Landroidx/preference/Preference;")
    strings("https://todo.syncforreddit.com/licenses.html")
    custom { method, classDef -> classDef.type == "Lpa/w0\$c;" && method.name == "a" }
}

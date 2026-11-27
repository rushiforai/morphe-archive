package app.template.patches.redditsync.rebrandabout.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/w0$a;->a(Landroidx/preference/Preference;)Z (v23.06.30-13:39) — the click
 * listener for the "backers" Credits row, confirmed by hand to open a Patreon-backers
 * list dialog (Lt9/j) via Ls9/g;->f(Class, FragmentManager). Repurposed as a plain,
 * non-clickable "AfterSync patch / Developed using Claude" credit, so this listener is
 * neutered to a no-op rather than deleted (the row itself stays, just its former
 * behavior doesn't fire).
 */
val backersListenerFingerprint = fingerprint {
    returns("Z")
    parameters("Landroidx/preference/Preference;")
    custom { method, classDef -> classDef.type == "Lpa/w0\$a;" && method.name == "a" }
}

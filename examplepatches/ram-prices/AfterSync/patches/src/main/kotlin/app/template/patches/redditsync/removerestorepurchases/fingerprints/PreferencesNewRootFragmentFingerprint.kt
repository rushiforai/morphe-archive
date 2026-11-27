package app.template.patches.redditsync.removerestorepurchases.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/u0;->C3(Landroid/os/Bundle;Ljava/lang/String;)V ("PreferencesNewRootFragment"
 * per its source-file annotation, v23.06.30-13:39) — the fragment that inflates
 * res/xml/cat_root.xml, the app's main Settings screen.
 *
 * Confirmed by hand from a real on-device crash log and the actual smali (via apktool):
 * after inflating the XML, this method looks up several preferences by a key derived
 * from an @integer resource value (via RedditApplication.g(I) -> Integer.toString) and
 * force-sets their visibility, with no null check. One of those lookups is for the
 * PURCHASES integer (@integer/PURCHASES, id 0x7f0a0016) — the "Restore purchases" entry
 * — which crashed with a NullPointerException the moment that entry was deleted from
 * cat_root.xml by removeRestorePurchasesResourcesPatch. See
 * removeRestorePurchasesSetupPatch.kt for the fix.
 */
val preferencesNewRootFragmentFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/os/Bundle;", "Ljava/lang/String;")
    custom { method, classDef -> classDef.type == "Lpa/u0;" && method.name == "C3" }
}

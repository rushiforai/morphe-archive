package app.template.patches.redditsync.removerestorepurchases.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lpa/l1;->s4()V ("PreferencesUltraFragment" per its source-file annotation,
 * v23.06.30-13:39) — the private setup method the Sync Ultra screen's
 * onCreatePreferences-equivalent (C3) calls right after inflating cat_ultra.xml.
 *
 * Confirmed by hand from a real on-device crash log and the actual smali (via
 * apktool): it looks up UltraResetPreference and UltraRestorePreference by their own
 * class-simple-name static field (used as their implicit preference key) and
 * force-sets their visibility with no null check, immediately crashing once those two
 * were deleted from cat_ultra.xml by removeRestorePurchasesResourcesPatch. See
 * removeRestorePurchasesSetupPatch.kt for the fix — everything else this method does
 * (paint/tag/cloud-backup listeners, the Ultra signup/manage view switch, a
 * legacy-purchase-token check) is untouched.
 */
val preferencesUltraFragmentFingerprint = fingerprint {
    returns("V")
    parameters()
    custom { method, classDef -> classDef.type == "Lpa/l1;" && method.name == "s4" }
}

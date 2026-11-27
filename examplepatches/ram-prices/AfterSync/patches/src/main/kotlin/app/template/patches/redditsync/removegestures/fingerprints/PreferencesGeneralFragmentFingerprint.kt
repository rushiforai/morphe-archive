package app.template.patches.redditsync.removegestures.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Sync for Reddit's General-settings fragment's onCreatePreferences
 * override (obfuscated as "C3" in v23.06.30-13:39, class "pa.l0"). Rather than
 * matching by the obfuscated class/method name — which will change on every
 * build — this matches structurally: a void method taking (Bundle, String)
 * that references both "icon_preference" and "swipe_sens" as string
 * constants. That combination is very unlikely to appear anywhere else and
 * should survive re-obfuscation across most future Sync builds.
 *
 * Confirmed by hand from real smali (obtained via apktool) for this exact
 * version:
 *   .method public C3(Landroid/os/Bundle;Ljava/lang/String;)V
 * containing (among other setup) a block that finds the "swipe_sens"
 * preference, casts it to ListPreference, and passes it to a private helper
 * (obfuscated "h4") which crashes if the preference is null — see
 * removeSwipeSensSetupPatch.kt for what gets removed and why.
 */
val preferencesGeneralFragmentFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/os/Bundle;", "Ljava/lang/String;")
    strings("icon_preference", "swipe_sens")
}

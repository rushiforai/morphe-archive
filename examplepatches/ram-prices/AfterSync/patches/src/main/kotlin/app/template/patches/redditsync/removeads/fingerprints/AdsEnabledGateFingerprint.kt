package app.template.patches.redditsync.removeads.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Ll9/a;->b(Landroid/content/Context;)Z ("SyncIapHelper.adsEnabled" per its
 * "SyncIapHelper.java" source annotation, v23.06.30-13:39) — the single "should ads
 * show" gate used by AdWrapper (which reserves banner ad space / creates ad views
 * based on its result) and several other screens. Confirmed by hand from real smali
 * (via apktool): it's a static method returning Z that checks whether a hashed
 * "remove_ads" key exists in the "SyncIapHelper" SharedPreferences file, then
 * inverts the result — so it returns true when the key is ABSENT (ads enabled) and
 * false when present (ads removed, i.e. the user bought "Remove Ads"). This is the
 * exact same code path already used for real "Remove Ads" purchasers today.
 *
 * Matched by exact defining class + method name (no distinguishing strings to anchor
 * on structurally). Safe because this bundle is pinned to this exact app version.
 */
val adsEnabledGateFingerprint = fingerprint {
    returns("Z")
    parameters("Landroid/content/Context;")
    custom { method, classDef -> classDef.type == "Ll9/a;" && method.name == "b" }
}

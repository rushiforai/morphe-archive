package app.template.patches.redditsync.unlockultra.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Luc/b;->j()Z ("UltraHelper.isUltraUnlocked" per its "UltraHelper.java"
 * source annotation, v23.06.30-13:39) — the single choke point 30+ call sites across
 * the app (HomeActivity, BaseActivity, the Ultra preferences/jobs, etc.) use to
 * decide whether Ultra is unlocked. Confirmed by hand from real smali (via apktool):
 * it's a static, no-arg method returning Z that delegates to Luc/b;->l()Z, which
 * checks whether a device-bound, hashed purchase-token key exists in the
 * "UltraHelper" SharedPreferences file — no server-side validation of the token's
 * value happens client-side, it's presence-only.
 *
 * Crucially, a push notification of type "expired" or "lifetime-cancelled" (handled
 * in MyFirebaseMessagingService) can call Luc/b;->a()V at any time to clear that same
 * key and silently re-lock the app — confirmed by hand from real smali. That's why
 * this patch targets the gate function itself rather than just seeding the
 * SharedPreferences flag: only patching the gate is immune to a live server push.
 *
 * Matched by exact defining class + method name (no distinguishing strings to anchor
 * on structurally). Safe because this bundle is pinned to this exact app version.
 */
val ultraUnlockedGateFingerprint = fingerprint {
    returns("Z")
    parameters()
    custom { method, classDef -> classDef.type == "Luc/b;" && method.name == "j" }
}

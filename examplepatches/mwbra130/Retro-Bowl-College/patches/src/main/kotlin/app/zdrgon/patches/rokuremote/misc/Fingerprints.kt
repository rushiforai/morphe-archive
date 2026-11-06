package app.zdrgon.patches.rokuremote.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Premium state reader — Roku Remote 1.3.2 ───────────────────────────
//
// Every "is this user premium?" question in the app funnels through one
// static reader (verified 2026-11-02 across the single base dex:
// 25 call sites — both ad slots, the paywall activity, UI helpers and
// the billing wrapper itself):
//
//   helpers/q.d()Z
//     -> prefs.getBoolean("X_PREMIUM_ENABLED", false)
//
// The preference is written by the billing sync (Lkb/q;->s) from the
// real purchase state for products "remote_pro" (subscription) and
// "remote_pro_lifetime" (one-time). The key string is referenced in
// exactly those two places — reader and sync — so no consumer reads
// the preference directly.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the method is declared "public static".

/** The single premium-state reader. Pinning it pins the whole app. */
object PremiumEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/swiftsofts/rokuremote/helpers/q;",
    name = "d"
)

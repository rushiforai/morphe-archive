package app.zdrgon.patches.isslivenow.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Premium state reader — ISS Live Now 8.7.3 ──────────────────────────
//
// Every "is this user Pro?" question in the app funnels through one
// static reader in the app's SharedPreferencesManager (verified
// 2026-11-02 across all 5 dexes: 49 call sites in 31 classes —
// MainActivity, PaywallActivity, the TV activities, the billing helper
// itself, the FCM service and the ad paths):
//
//   Ls2;->d0(Landroid/content/Context;)Z
//     -> Ls2;->t(context, "pro_version", false)   (a plain prefs read)
//
// The preference is written by one writer, Ls2;->P0 (setProVersion),
// fed by the purchase sync for the app's single one-time product
// "isshdlive.proversion.purchased" (Play Billing 8.0.0, no RevenueCat).
// New purchases are additionally validated on the developer's backend
// before the grant is written, and the Russian-market T-Bank rail
// claims through their server — but the read path is purely local:
// nothing re-checks a server when the app asks whether Pro is on, and
// the key string "pro_version" is referenced only inside Ls2, so no
// consumer reads the preference directly.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the method is declared "public static".

/** The single premium-state reader. Pinning it pins the whole app. */
object ProVersionFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Ls2;",
    name = "d0"
)

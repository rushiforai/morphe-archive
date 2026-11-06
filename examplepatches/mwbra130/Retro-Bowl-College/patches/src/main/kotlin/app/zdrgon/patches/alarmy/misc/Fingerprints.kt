package app.zdrgon.patches.alarmy.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Premium entitlement gates — Alarmy 26.42.0 ────────────────────────
//
// Every "is this user premium?" question in the app is answered by one
// immutable state object (verified 2026-11-02 across all 19 base dexes):
//
//   Lym/e;   (Kotlin: PremiumState, in classes8.dex)
//     fields: a:J expirationTimeMillis, b:Z willRenew,
//             c:J lastSyncTimeMillis, d:Lym/g; premiumType,
//             e:Lym/f; premiumStateType, f/g:String offerType/productId
//
//   Lym/g;   (PremiumType enum): GOOGLE_SUBSCRIPTION,
//            DELIGHTROOM_SUBSCRIPTION, REMOVE_AD_SUBSCRIPTION, LIFETIME,
//            PLAYPASS, NONE, MANUAL
//
// The state is produced from the backend sync DTO (PremiumStateDto) and
// the local cache; purchases are validated server-side before a grant is
// ever written. But at READ time nothing asks a server: features call
// the state's own boolean gates —
//
//   Lym/e;->d()Z   isPremium()        ~59 call sites across 14 dexes
//   Lym/e;->e()Z   isRemoveAdPremium() ~25 call sites across 11 dexes
//
// Direct reads of the state's raw fields outside its own dex are a
// handful (13 total) and live in sync/display code, not feature gates.
//
// NOTE: this is NOT the class fluffy-patches pinned. Their patch targets
// Lbi/c;->r/s from v26.32.1; in 26.42.0 the name Lbi/c; was reused by R8
// for an unrelated data class with no r()/s() methods, which is why
// their patch throws NoSuchElementException on this version.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// both gate methods are declared "public final" (0x0011).

/** The premium entitlement gate. Pinning it pins every premium feature. */
object IsPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lym/e;",
    name = "d"
)

/** The remove-ads entitlement gate; the app gates ad init on it. */
object IsRemoveAdPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lym/e;",
    name = "e"
)

package app.zdrgon.patches.businessx.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Enable Premium entitlement readers — BusinessX 6.5.2 ─────────────
//
// Billing is direct Play Billing for ONE subscription product,
// "businessx_premium" (base plans: monthly $4.99, 6-month $27.99,
// yearly $44.99). No RevenueCat, no Adapty. The entitlement pipeline
// (verified 2026-11-03, jadx + androguard census of classes.dex):
//
//   1. The app records each Play purchase locally in the
//      SharedPreferences file "demo" (premium_store_uid /
//      premium_store_token / premium_store_bought_ms /
//      premium_store_seen_ms, answer starts "UNKNOWN").
//   2. It sends the purchase token to the developer's Firebase Cloud
//      Function "confirm_purchase" {platform, purchaseToken,
//      productId: "businessx_premium"} (yc.y4.v). The server verifies
//      the token with Google, stores its verdict back as
//      premium_store_answer, and sets a Firebase Auth custom claim
//      named "premium" on the account. That claim is Google-signed;
//      no local edit can mint it.
//   3. The client mirrors the claim out of ID-token results
//      (id.f0.b) into the same prefs (sync_claim_premium,
//      claim_premium_uid, claim_premium_at_ms).
//
// The verdict is computed by ONE method:
//
//   Lyc/y4;->Z(Landroid/content/Context;)Z   PUBLIC STATIC, 0x9
//     premium iff [store record seen < 7 days ago and its answer is
//     a premium state (yc.y4.B)] OR [claim cached < 7 days ago and
//     true] OR a legacy grace case. Z then persists the verdict via
//     yc.a2.c into "demo" as isSubs + subsUid.
//
// And every feature gate reads ONE reader on top of that verdict:
//
//   Lcom/shrey/businessx/MainActivity;->p0(Landroid/content/Context;)Z
//     PUBLIC STATIC, 0x9
//     = current Firebase uid -> q0(context, uid)
//       = isSubs && (subsUid is empty || subsUid == uid)
//
// p0 call-site census (androguard xrefs): 39 sites, including
//   SalesHistoryActivity.A / .onCreate-adjacent flows  full history
//   TrendsActivity.A, TrendsActivity.onCreate          trends range
//     (R0 = p0 ? 2 : 1 — premium selects the full mode)
//   ShopSharingActivity.v                              staff sharing
//   yc.e5 (settings / premium screens), ad.c2, ad.p1,
//   yc.b5/b7/c2/r2/w2/z1, ld.* click flows             backup, shops
//   MainActivity.b1                                    ADS MASTER
//     GATE: wraps the native-ad bind/load path (zc.v) and returns
//     no-ads for premium; MainActivity.D is the matching
//     verify-then-run executor for premium actions.
//   MainActivity.K0                                    per-shop
//     backup state (ad.j0: NEEDS_PREMIUM / CAN_BACK_UP / ...)
//
// Ad stack: AdMob only (publisher ca-app-pub-8417136758836252;
// interstitials /7999824265 and /2650618646, native /1695763657).
// The yc.y4.I() check visible at the three load sites is only a
// heap-headroom guard, NOT the premium gate — every load is reached
// through p0-gated flows (b1 / screen state). No rewarded ads.
//
// IMPORTANT SPLIT: the gates above are local, but two paywall
// features are not purely local. BusinessX Cloud backup/sync live
// in the developer's Firebase project (Firestore "workspaces/<id>",
// Cloud Functions confirm_purchase / update_workspace_access /
// replace_cloud_backup, and the server-set "premium" claim; sync
// can also be paused server-side via the "syncPaused" claim).
// Pinning these readers unlocks the app's UI and attempts, but the
// server authorizes cloud data with the signed claim, so cloud
// sync/backup are NOT guaranteed by this patch. Google Drive
// backup is different: it writes the shop database into the
// USER'S OWN Drive appDataFolder ("Connect Google Drive",
// driveAccountEmail/driveAccountUid) behind the same local p0
// gate, so that path genuinely works once the gate is pinned.
//
// Both readers are pinned (the Alarmy two-pin pattern): p0 alone
// would leave the direct Z() callers (startup n1, billing-observer
// flows in yc.f4 / ad.z1) reading the unpinned verdict; Z alone
// would leave p0 reading the isSubs pref that Z's own body writes.
// Together every decision path returns the subscriber's answer.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the dex records for both methods are PUBLIC | STATIC (0x9).

/** The central Premium reader every feature and ad gate consults. */
object IsPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/shrey/businessx/MainActivity;",
    name = "p0"
)

/** The verdict producer behind the reader; pinned so direct callers agree. */
object PremiumVerdictFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lyc/y4;",
    name = "Z"
)

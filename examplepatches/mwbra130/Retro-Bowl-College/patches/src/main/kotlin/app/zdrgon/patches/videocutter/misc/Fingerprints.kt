package app.zdrgon.patches.videocutter.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Remove Ads entitlement reader — Video Cutter 4.4.6 ───────────────
//
// The app's only purchase is the one-time "Remove Ads" product
// (Play Billing SKU "remove_ads", $2.49, direct BillingClient — no
// RevenueCat). All of its state lives in one Kotlin object:
//
//   Lcom/losslessvideocutter/utils/PurchaseManager;   (classes.dex)
//     SKU_REMOVE_ADS = "remove_ads", PRICE = "$2.49"
//     persisted: SharedPreferences "purchase_prefs", key
//       "is_pro_purchased", HMAC-signed (pro_signature_hash over the
//       purchase token) and loaded by loadPurchaseStatus().
//     Billing reconciliation in checkExistingPurchases() can clear the
//     field again (2 consecutive empty queries -> status reset).
//
// Every consumer asks ONE public reader (verified 2026-11-03, jadx
// census of all 3 dexes):
//
//   PurchaseManager.isProVersion()Z   (PUBLIC FINAL, 0x11)
//     31 read sites outside PurchaseManager, in 7 files:
//       utils/AdManager           8 sites (every native-ad load/preload/
//                                 get + initialize() gate on it at entry)
//       activities/MainActivity  11 sites (interstitial load X(),
//                                 rewarded-interstitial load + q1() show
//                                 path, native containers)
//       activities/StartActivity  5 sites
//       activities/CuttingActivity 4 sites
//       application/App           1 site  (App.onCreate: if pro, returns
//                                 BEFORE MobileAds.initialize — ads are
//                                 never even initialised for buyers)
//       utils/AppDialogHelper     1 site  (overflow menu: if pro, the
//                                 "Remove Ads" item is HIDDEN and the
//                                 "No Ads verified" item is shown — the
//                                 menu reads this same reader, so the pin
//                                 reproduces the bought menu exactly)
//       E3/D4                     ad-flow helper
//
// Nothing outside PurchaseManager can read the raw field (it is a
// private static), and inside the class it is used only for state
// bookkeeping (HMAC load, billing reconciliation). Pinning the reader
// therefore reproduces the purchased state for every decision the app
// makes, whatever the stored prefs or billing sync say.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the dex record for isProVersion is PUBLIC | FINAL (0x11).

/** The single Remove Ads entitlement reader. Pinning it removes every ad. */
object IsProVersionFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/losslessvideocutter/utils/PurchaseManager;",
    name = "isProVersion"
)

package app.zdrgon.patches.rocketplayer.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Enable Premium entitlement reader — Rocket Player 6.3.4 ──────────
//
// Premium and ads are not run by the JRT app code. They are run by the
// ZipoApps PremiumHelper SDK 5.2.1 layered on top of the app
// (com.zipoapps.premiumhelper, configured by AMPApp.onCreate).
//
// Billing is direct Play Billing 7.0.0 via the SDK's BillingManager
// Ldn/u;. Products (from AMPApp's configuration resources):
//   main_sku          = "s1_v1t0_10000_trial_7d_yearly" (subscription;
//                       the displayed offer — e.g. the $14.99/week,
//                       3-day-trial plan — is varied server-side by the
//                       SDK's Toto offer service; Toto serves the
//                       paywall's content, never the entitlement answer)
//   premium_packages  = "com.jrtstudio.AnotherMusicPlayer.Unlocker"
//                       (owning the legacy Unlocker app also counts)
//   onetime_offer_sku / playpass_sku = "" in this build
//
// Whatever the source, the result lands in ONE local value in the
// SharedPreferences file "premium_helper_data", owned by:
//
//   Lcom/zipoapps/premiumhelper/c;   ("Preferences", classes3.dex)
//     h()Z   PUBLIC FINAL, 0x11
//       = getBoolean("has_active_purchase", false)
//     f()    returns the stored ActivePurchaseInfo JSON — read only
//            by analytics / FCM / support bookkeeping (5 sites), never
//            by a feature or ad gate.
//
// The flag is written locally by the billing layer (Ldn/u;, Ldn/i;)
// from Play query results and the Unlocker-package check. No developer
// server verifies entitlement at read time; every read is the local
// pref (Roku/ISS class).
//
// Every consumer asks h() (verified 2026-11-03, instruction census of
// all 4 dexes): 22 call sites across 19 methods, including
//   Lcom/zipoapps/ads/banner/a;->a   BannerManager.loadBanner — h() is
//                                    its FIRST check: "User is premium."
//                                    aborts the load before any provider
//                                    (AdMob Lem/c;, AppLovin MAX Lfm/c;)
//   Lhm/g;->a()Z and Lhm/g;->l      InterstitialManager eligibility and
//                                    showInterstitialAd: "User is
//                                    Premium. Don't show ad"
//   premiumhelper/e$c                auto-interstitial setup skips when
//                                    purchased
//   premiumhelper/f;->onStart (2x)   lifecycle / relaunch-offering logic
//   premiumhelper/d;->i()Z           onboarding-offering suppression
//   PHSplashActivity;->E (2x)        splash skips its interstitial wait
//   Lam/o;->getMinHeightInternal     banner placeholder collapses to 0
//   Ljn/h;->a, Lij/i;->a, Lvn/b;->b, Lyn/j;->c/g   SDK state wrappers
//   ContactSupportActivity, PremiumSupportPreference   VIP-support gate
//
// Direct reads of the raw "has_active_purchase" key outside c.h()
// exist only inside the billing layer itself (writers/bookkeeping).
// Zero com.jrtstudio classes read the flag directly. Pinning the
// reader therefore reproduces the purchased state for every decision,
// whatever billing reconciliation later writes into the stored pref.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the dex record for h() is PUBLIC | FINAL (0x11).

/** The single Premium entitlement reader. Pinning it removes every ad. */
object HasActivePurchaseFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/zipoapps/premiumhelper/c;",
    name = "h"
)

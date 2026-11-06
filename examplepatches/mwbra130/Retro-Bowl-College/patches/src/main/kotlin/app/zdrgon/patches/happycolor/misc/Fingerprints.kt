package app.zdrgon.patches.happycolor.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── AppLovin MAX ad loads — Happy Color 2.24.1 ──────────────────────────
//
// The game is a Flutter title whose ads run through AppLovin MAX (Dart
// strings in libapp.so: "applovin_max_sdk"; the shell has its own
// ads_block_cubit on top). The MAX SDK's public classes keep their
// names under R8 (verified across the 2.24.1 base dexes on 2026-11-02):
//
//   MaxAdView.loadAd()V          classes14.dex, public
//   MaxInterstitialAd.loadAd()V  classes5.dex,  public
//   MaxAppOpenAd.loadAd()V       classes6.dex,  public
//   MaxRewardedAd.loadAd()V      classes7.dex,  public — NOT patched:
//                                rewarded ads are the opt-in hint
//                                economy and stay functional.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// all four loadAd methods are declared "public" only.

/** Banner load. No-oping it leaves the banner slot permanently empty. */
object MaxAdViewLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/applovin/mediation/ads/MaxAdView;",
    name = "loadAd"
)

/** Interstitial load. Never loaded means never ready, never shown. */
object MaxInterstitialLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/applovin/mediation/ads/MaxInterstitialAd;",
    name = "loadAd"
)

/** App-open ad load. */
object MaxAppOpenLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/applovin/mediation/ads/MaxAppOpenAd;",
    name = "loadAd"
)

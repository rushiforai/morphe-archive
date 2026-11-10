package app.zdrgon.patches.vehico.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Google Mobile Ads loads — Vehico 1.2.31 ────────────────────────────
//
// Vehico is a Flutter title; its ads run through the google_mobile_ads
// plugin into the Google Mobile Ads SDK (GMS classes keep their names).
// The app's own privacy copy in libapp.so states it shows "banner and
// periodic interstitial advertisements via Google AdMob", and exactly
// two AdMob ad-unit IDs are embedded — banner + interstitial are the
// only formats in use. Mediation is AdMob-only (the sole adapter class
// in dex is com.google.ads.mediation.admob.AdMobAdapter; no AppLovin /
// Unity / ironSource / Meta adapters), and adapters are only ever
// reached through a GMS load, so no-oping the GMS loads below blocks
// every placement.
//
// Verified against the 1.2.31 dexes on 2026-11-03:
//
//   BaseAdView.loadAd(AdRequest)V — classes.dex, public. AdView does
//     NOT declare loadAd; it inherits this one, and the plugin's
//     FlutterBannerAd.load() invokes this exact method ref.
//   InterstitialAd.load(Context, String, AdRequest,
//     InterstitialAdLoadCallback)V — classes.dex, public static; the
//     single AdRequest overload, invoked by the plugin's
//     FlutterAdLoader.loadInterstitial.
//
// Deliberately NOT patched (no evidence the app uses them — no ad
// units, no Dart load paths, only plugin-generic class shells):
//   AppOpenAd.load, AdLoader (native ads).
// Deliberately NOT patched (opt-in class, per the Happy Color
// precedent of leaving rewarded alone): RewardedAd.load and
// RewardedInterstitialAd.load. No rewarded ad unit or reward flow
// exists in this build; they stay functional regardless.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality.

/** Banner load. No-oping it leaves every banner slot permanently empty. */
object BannerLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "loadAd"
)

/** Interstitial load. Never loaded means never ready, never shown. */
object InterstitialLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/interstitial/InterstitialAdLoadCallback;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
    name = "load"
)

package app.zdrgon.patches.notes.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Google Mobile Ads loads — Notes (iNotes) 2.2.2 ─────────────────────
//
// Notes is a Flutter title; its ads run through the google_mobile_ads
// plugin into the Google Mobile Ads SDK (GMS classes keep their names).
// Ad census against the 2.2.2 XAPK on 2026-11-03:
//
//   * Exactly 3 AdMob ad-unit IDs are embedded in libapp.so
//     (publisher ca-app-pub-7600110987752627), matching exactly the 3
//     ad-load entry points that survive Dart AOT tree-shaking:
//     loadInterstitialAd, loadNativeAd, loadRewardedAd. The banner,
//     app-open, rewarded-interstitial and AdManager (GAM) loader names
//     are ALL absent from the Dart strings — those formats are unused.
//   * Mediation is AdMob-only: the sole adapter class in dex is
//     com.google.ads.mediation.admob.AdMobAdapter. No AppLovin / Unity /
//     ironSource / Meta / Vungle / InMobi classes exist, and the ~400
//     Amazon classes are the Appstore IAP/DRM/sign-in SDK (no
//     com.amazon.device.ads — APS ads are not present). Adapters are
//     only ever reached through a GMS load, so no-oping the GMS loads
//     below blocks every interruptive/list placement.
//   * The plugin's own loader (FlutterAdLoader, classes2.dex) routes
//     the two patched formats to exactly these method refs:
//     loadInterstitial -> InterstitialAd.load(...), and loadNativeAd ->
//     AdLoader.Builder.build().loadAd(AdRequest).
//   * Native ads are wired end-to-end by the app itself: MainActivity
//     registers its ListTileNativeAdFactory under the id "listTile"
//     and opens the "inotes/native_ad_events" channel; the Dart side
//     renders them in the notes list (notesListAdSwipeRemoveAds).
//
// Verified against the 2.2.2 dexes on 2026-11-03 (both in classes.dex):
//
//   InterstitialAd.load(Context, String, AdRequest,
//     InterstitialAdLoadCallback)V — public static (flags 0x9).
//   AdLoader.loadAd(AdRequest)V — public (flags 0x1); the single-
//     request overload the plugin invokes (loadAds / the AdManager
//     overload are never invoked — plugin source + no GAM strings).
//
// Deliberately NOT patched (opt-in user benefit, Happy Color
// precedent): RewardedAd.load and RewardedInterstitialAd.load. The
// Dart strings prove rewarded is this app's ad-gate mechanic —
// ad_gate_watch_folder / ad_gate_watch_audio / ad_gate_watch_scan:
// free users watch a rewarded ad to temporarily use folders, voice
// notes and scans. No-oping rewarded would REMOVE that free unlock
// path while granting nothing. (loadRewardedInterstitialAd is in
// fact absent from the Dart strings; both stay functional anyway.)
//
// Deliberately NOT patched (no usage evidence): BaseAdView.loadAd
// (banner), AppOpenAd.load (app open) — no Dart loader strings, no
// spare ad units.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality.

/** Interstitial ("ad break") load. Never loaded means never shown. */
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

/** Native (notes-list tile) load. No-oping it leaves list ad slots empty. */
object NativeLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd"
)

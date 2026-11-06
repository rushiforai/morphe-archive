package app.xiondigital.patches.tandem.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/*
 * R8 relocates Tandem's own classes into the default package, while the bundled SDKs keep their
 * package names (their consumer ProGuard rules preserve the API surface). Those two kinds of anchor
 * need different treatment:
 *
 * - The SDK entry points below are exact signatures, and they hold in every build inspected.
 * - Tandem's community-ad composable is *not* stable by name: it is `Ljhp;->a(Lex4;Lf79;Lpw4;Leh;Lbg5;I)V`
 *   in 6.38.0 and `Lcl3;->a(Lnet/tandem/community/core/models/CommunityCard$BannerAd;Lpy6;Lik3;Lrc;Lp14;I)V`
 *   in 6.12.0 — different class name, and the config type it consumes was refactored. It is matched
 *   by the `"communityAd"` test tag it assigns instead, which is the one thing that did not move
 *   (exactly one method references it in each build, which is what `--validate` checks).
 *
 * Rewarded formats are deliberately absent: those are only requested when the user asks for one
 * (to earn in-app rewards), so blocking them would remove a feature instead of an annoyance.
 */

/**
 * Tandem's community ad composable — `classes4.dex` in both inspected builds.
 *
 * The view model behind it emits a `CommunityAdConfig(...)`/`CommunityCard.BannerAd` built from the
 * AdMob unit `ca-app-pub-4507927355231659/3667237836`, and this composable is the only consumer: it
 * reads the config, draws the ad, then a divider. The `"communityAd"` test tag it assigns to that
 * slot pins the method, and no other method in either build carries it.
 *
 * Everything else about the method is build-specific — 6.38.0 has
 * `Ljhp;->a(Lex4;Lf79;Lpw4;Leh;Lbg5;I)V`, 6.12.0 has
 * `Lcl3;->a(Lnet/tandem/community/core/models/CommunityCard$BannerAd;Lpy6;Lik3;Lrc;Lp14;I)V` — so the
 * descriptor, parameters and class are deliberately left unfiltered. What survives both is that it
 * is a static `void` composable and that it assigns the `"communityAd"` tag.
 *
 * Note that the ad unit is an AdMob one but the AdMob *view* classes are not present in the dex —
 * Tandem renders the slot itself — so this composable, not an SDK call, is the choke point.
 */
internal object CommunityAdComposableFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    filters = listOf(
        string("communityAd"),
    ),
)

/** `com.applovin.mediation.ads.MaxAppOpenAd.loadAd()` — the app-open ad Tandem requests at launch. */
internal object MaxAppOpenAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxAppOpenAd;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/** `com.applovin.mediation.ads.MaxInterstitialAd.loadAd()`. */
internal object MaxInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxInterstitialAd;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/** `com.applovin.mediation.ads.MaxAdView.loadAd()` — the banner request. */
internal object MaxAdViewLoadFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxAdView;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `com.applovin.mediation.ads.MaxAdView.startAutoRefresh()`.
 *
 * `loadAd()` issues a single request; this is what schedules the repeating banner refresh, so both
 * have to go or an empty banner container keeps polling.
 */
internal object MaxAdViewStartAutoRefreshFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxAdView;",
    name = "startAutoRefresh",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/** `com.facebook.ads.InterstitialAd.loadAd()`. */
internal object FacebookInterstitialLoadFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/InterstitialAd;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/** `com.facebook.ads.InterstitialAd.loadAd(InterstitialAd$InterstitialLoadAdConfig)`. */
internal object FacebookInterstitialLoadConfigFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/InterstitialAd;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/facebook/ads/InterstitialAd\$InterstitialLoadAdConfig;"),
)

/** `com.facebook.ads.AdView.loadAd()`. */
internal object FacebookAdViewLoadFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AdView;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/** `com.facebook.ads.AdView.loadAd(AdView$AdViewLoadConfig)`. */
internal object FacebookAdViewLoadConfigFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AdView;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/facebook/ads/AdView\$AdViewLoadConfig;"),
)

/** `com.facebook.ads.NativeAdBase.loadAd()` — `NativeAd` and `NativeBannerAd` inherit this one. */
internal object FacebookNativeAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/NativeAdBase;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/** `com.facebook.ads.NativeAdBase.loadAd(NativeAdBase$NativeLoadAdConfig)`. */
internal object FacebookNativeAdLoadConfigFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/NativeAdBase;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/facebook/ads/NativeAdBase\$NativeLoadAdConfig;"),
)

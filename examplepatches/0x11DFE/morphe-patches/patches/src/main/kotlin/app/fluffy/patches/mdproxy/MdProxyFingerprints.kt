package app.fluffy.patches.mdproxy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * TimeLeft getter (zq0.B on v1.0.8.8): the only parameterless static method
 * returning a long that reads the "TimeLeft" MMKV key (decodeLong with a
 * 1-hour default). Every other "TimeLeft" mention either encodes it back
 * (MMKV.h) or returns void. The helper class name is R8-random per build;
 * the fingerprint does not depend on it.
 */
object TimeLeftGetterFingerprint : Fingerprint(
    isStatic = true,
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(
        string("TimeLeft", StringComparisonType.CONTAINS),
    ),
)

/**
 * Session countdown formatter (HomeFragment.v0): formats the remaining
 * milliseconds as "%02d:%02d:%02d:%02d" (days:hours:minutes:seconds). The
 * only method with that format string and a long parameter.
 */
object CountdownFormatterFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/String;",
    parameters = listOf("J"),
    filters = listOf(
        string("%02d:%02d:%02d:%02d", StringComparisonType.CONTAINS),
    ),
)

/**
 * Rewarded-ad loader on the home screen (HomeFragment.n0): parameterless
 * method that loads a rewarded ad through the GMS SDK. Pinned by the
 * RewardedAd.load call and zero parameters; the ad unit is matched only by
 * its ca-app-pub prefix, so rotating units in the AdMob console does not
 * break the fingerprint. The server-row click handler loads a rewarded ad
 * too, but takes a View parameter.
 */
object HomeRewardedAdLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("ca-app-pub", StringComparisonType.CONTAINS),
        methodCall(definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;", name = "load"),
    ),
)

/**
 * Interstitial loader (HomeFragment.k0): the only (Context)V method calling
 * GMS InterstitialAd.load; the ad unit is matched only by its ca-app-pub
 * prefix.
 */
object InterstitialAdLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("ca-app-pub", StringComparisonType.CONTAINS),
        methodCall(definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;", name = "load"),
    ),
)

/**
 * Banner loader launcher (HomeFragment.j0): carries no string constants;
 * identified by launching the loadBannerAds$1 coroutine. Only j0 constructs
 * that callback class.
 */
object BannerAdLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lcom/v2ray/ang/ui/HomeFragment${'$'}loadBannerAds${'$'}1;", name = "<init>"),
    ),
)

/**
 * App-open ad loader (AngApplication$AppOpenAdManager.a): the only
 * (FragmentActivity)V method calling GMS AppOpenAd.load; the ad unit is
 * matched only by its ca-app-pub prefix.
 */
object AppOpenAdLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;"),
    filters = listOf(
        string("ca-app-pub", StringComparisonType.CONTAINS),
        methodCall(definingClass = "Lcom/google/android/gms/ads/appopen/AppOpenAd;", name = "load"),
    ),
)

/**
 * Server-row boost click handler (R8-merged lambda, m61 on v1.0.8.8): the
 * packed-switch onClick that boosts a server row by loading a rewarded ad.
 * Pinned by (View)V + RewardedAd.load + a ca-app-pub const; the main click
 * handler shares the toast strings but never loads ads itself.
 */
object ServerRowBoostClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        string("ca-app-pub", StringComparisonType.CONTAINS),
        methodCall(definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;", name = "load"),
    ),
)

/**
 * Boost / periodic-interstitial gate (HomeFragment.C0): static, takes
 * (HomeFragment, FragmentActivity, boolean showBoost). Reads CurrentVoucher
 * (holders skip it), formats a date and reads the BoostedServer array for
 * the grant-on-interstitial-shown path. The parameter list alone is unique;
 * the two strings pin it.
 */
object BoostInterstitialFlowFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Lcom/v2ray/ang/ui/HomeFragment;",
        "Landroidx/fragment/app/FragmentActivity;",
        "Z",
    ),
    filters = listOf(
        string("CurrentVoucher", StringComparisonType.CONTAINS),
        string("yyyy-MM-dd HH:mm:ss", StringComparisonType.CONTAINS),
    ),
)

/**
 * Selected-server getter (zq0.D on v1.0.8.8): the only parameterless static
 * String method reading the "USER_SELECTED_SERVER" MMKV key.
 */
object SelectedServerGetterFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("USER_SELECTED_SERVER", StringComparisonType.CONTAINS),
    ),
)

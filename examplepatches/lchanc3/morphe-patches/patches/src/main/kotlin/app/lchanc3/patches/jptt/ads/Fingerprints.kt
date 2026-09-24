package app.lchanc3.patches.jptt.ads

import app.lchanc3.patches.jptt.shared.Constants.UTIL_CLASS
import app.morphe.patcher.Fingerprint

private const val AD_VIEW = "Lcom/google/android/gms/ads/AdView;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private const val ACTIVITY = "Landroid/app/Activity;"

/** `Util.getAdmobBannerAd()`, the one place every AdMob banner in the app is made. */
internal object GetAdmobBannerAdFingerprint : Fingerprint(
    definingClass = UTIL_CLASS,
    name = "getAdmobBannerAd",
    returnType = AD_VIEW,
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

/**
 * `Util.addLocalAd()`, which the list screens call instead of AdMob when the app
 * has decided AdMob is blocked. It is the only caller of `addTAMediaAd()`.
 */
internal object AddLocalAdFingerprint : Fingerprint(
    definingClass = UTIL_CLASS,
    name = "addLocalAd",
    returnType = "V",
    parameters = listOf("Z", "Z", VIEW_GROUP, ACTIVITY),
)

/** `Util.addTAMediaAd()`, the TAMedia banner, silenced in its own right. */
internal object AddTAMediaAdFingerprint : Fingerprint(
    definingClass = UTIL_CLASS,
    name = "addTAMediaAd",
    returnType = "V",
    parameters = listOf("Z", VIEW_GROUP, ACTIVITY),
)

/** `ArticleFragment$NativeAdItem.loadAd()`, the ad rows inside an article. */
internal object ArticleNativeAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/joshua/jptt/ArticleFragment\$NativeAdItem;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** `MainDigestHolder$NativeAdItem.loadAd()`, the same rows in the digest lists. */
internal object DigestNativeAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/joshua/jptt/MainDigestHolder\$NativeAdItem;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

package app.mmc.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/*
 * Mini Militia Classic 0.14.4 ad architecture (reverse engineered from the APK):
 *
 *   libcocos2dcpp.so (C++)
 *     └─ JNI static bridges in  Lcom/appsomniacs/mmc/DA2Activity;
 *          showAdBanner()V, hideAdNetworkBanner()V,
 *          prepareInterstitial()V, showInterstitial()V,
 *          prepareRewardedAd()V, showRewardedAd()V, isRewardedAdReady()Z
 *            └─ Lcom/appsomniacs/c2/PitBoss;           (facade, IAdNetworkAdapter)
 *                 └─ Lcom/appsomniacs/core/adminion/AdsImperator;   (ad manager)
 *                      ├─ .../adnetworkadapter/AppLovinMaxAdNetworkAdapter;  (MAX banner + interstitial)
 *                      └─ .../adnetworkadapter/AdMobAdNetworkAdapter;        (AdMob banner + interstitial)
 *
 *   Consent: Lcom/appsomniacs/core/compliance/ComplianceManager; (Google UMP form, only gates ads)
 *
 * The Java layer is not obfuscated, so name based fingerprints are stable. The JNI bridges
 * are additionally matched by their unique anomaly-report strings.
 */

internal const val DA2_ACTIVITY = "Lcom/appsomniacs/mmc/DA2Activity;"
internal const val PIT_BOSS = "Lcom/appsomniacs/c2/PitBoss;"
internal const val ADS_IMPERATOR = "Lcom/appsomniacs/core/adminion/AdsImperator;"
internal const val AD_NETWORK_ADAPTER_BASE = "Lcom/appsomniacs/core/adminion/AdNetworkAdapterBase;"
internal const val APPLOVIN_ADAPTER =
    "Lcom/appsomniacs/core/adminion/adnetworkadapter/AppLovinMaxAdNetworkAdapter;"
internal const val ADMOB_ADAPTER =
    "Lcom/appsomniacs/core/adminion/adnetworkadapter/AdMobAdNetworkAdapter;"
internal const val COMPLIANCE_MANAGER = "Lcom/appsomniacs/core/compliance/ComplianceManager;"

private val PUBLIC_STATIC = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)

// region JNI bridges called from native code (DA2Activity)

/** DA2Activity.showAdBanner()V — requests the bottom banner from the ad stack. */
internal object ShowAdBannerBridgeFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("ActivityNull%sshowAdBanner"),
)

/** DA2Activity.prepareInterstitial()V — preloads a full screen interstitial. */
internal object PrepareInterstitialBridgeFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("ActivityNull%sprepareInterstitial"),
)

/** DA2Activity.showInterstitial()V — shows the interstitial (between matches / menus). */
internal object ShowInterstitialBridgeFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("ActivityNull%sshowInterstitial"),
)

/** DA2Activity.showRewardedAd()V — rewarded video entry point (dormant in 0.14.4). */
internal object ShowRewardedAdBridgeFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("ActivityNull%sshowRewardedAd"),
)

/** DA2Activity.prepareRewardedAd()V */
internal object PrepareRewardedAdBridgeFingerprint : Fingerprint(
    definingClass = DA2_ACTIVITY,
    name = "prepareRewardedAd",
    accessFlags = PUBLIC_STATIC,
    returnType = "V",
    parameters = listOf(),
)

/** DA2Activity.isRewardedAdReady()Z — forced to false so native never offers a video. */
internal object IsRewardedAdReadyBridgeFingerprint : Fingerprint(
    definingClass = DA2_ACTIVITY,
    name = "isRewardedAdReady",
    accessFlags = PUBLIC_STATIC,
    returnType = "Z",
    parameters = listOf(),
)

// endregion

// region Ad network adapters (used to locate the classes if they are ever renamed)

/** AppLovinMaxAdNetworkAdapter.showInterstitialAd(Activity)Z */
internal object AppLovinShowInterstitialFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string(
            "tryShowInterstitial(): Call to show an AppLovin interstitial",
            StringComparisonType.STARTS_WITH,
        ),
    ),
)

/** AdMobAdNetworkAdapter.onInitializingComponent(Activity)V */
internal object AdMobInitializingComponentFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string(
            "AdMob SDK onInitializingComponent startup call completed",
            StringComparisonType.STARTS_WITH,
        ),
    ),
)

// endregion

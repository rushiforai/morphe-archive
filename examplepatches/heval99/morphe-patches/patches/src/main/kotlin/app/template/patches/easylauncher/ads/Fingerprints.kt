package app.template.patches.easylauncher.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// The ad stack lives in com.eet.core.ads.*. Package names survive R8 here, class and method
// names mostly do not, so the anchors below are log lines, preference keys and method shape.
private const val CONSENT_PACKAGE = "Lcom/eet/core/ads/consent/"
private const val APP_OPEN_PACKAGE = "Lcom/eet/core/ads/activity/"
private const val NATIVE_AD_PACKAGE = "Lcom/eet/core/ads/nativead/"

internal const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

// The single ad gate (R8 merges it into a large static utility class). It reads the
// "ads.enabled" preference, which the ad-free purchase clears, and also says no on Firebase
// Test Lab and when the "INSIDE_WALDO" instrumentation property is set. Banner, native, app-open,
// all-apps, search and welcome placements all ask it first.
internal object AdsEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        string("ads.enabled", StringComparisonType.CONTAINS),
        string("INSIDE_WALDO", StringComparisonType.CONTAINS),
    ),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

// UserConsentManager.initializeMobileAdsSdk(Context): starts the next-gen GMA SDK and CloudX.
internal object InitializeMobileAdsSdkFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("initializeMobileAdsSdk: ", StringComparisonType.STARTS_WITH)),
    custom = { method, classDef ->
        classDef.type.startsWith(CONSENT_PACKAGE) && AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

// UserConsentManager.requestConsentInfoUpdate(Activity): the UMP consent form, which only
// exists to ask for ad personalisation consent.
internal object RequestConsentInfoUpdateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(string("requestConsentInfoUpdate: activity=", StringComparisonType.STARTS_WITH)),
    custom = { method, classDef ->
        classDef.type.startsWith(CONSENT_PACKAGE) && AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

// AppOpenAdManager.loadAd(context, adUnit, placement, extras, mode): every app-open load ends up
// here, including the ResolveInfo overload (through its coroutine) and the notification handler.
internal object AppOpenLoadAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "L",
    ),
    filters = listOf(string("loadAd: new ad wrapper created for key, ", StringComparisonType.STARTS_WITH)),
    custom = { _, classDef -> classDef.type.startsWith(APP_OPEN_PACKAGE) },
)

// AppOpenAdManager.showAd(activity, adUnit, placement, onDone): shows the ad, then runs onDone,
// which opens what the user tapped (deep link, app, notification target).
internal object AppOpenShowAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0),
    filters = listOf(string("showAd: failed to show ad, ", StringComparisonType.STARTS_WITH)),
    custom = { _, classDef -> classDef.type.startsWith(APP_OPEN_PACKAGE) },
)

// The native ad cache's replenish step, which preloads native ads in the background.
internal object NativeAdCacheReplenishFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("replenishAds: size=", StringComparisonType.STARTS_WITH)),
    custom = { _, classDef -> classDef.type.startsWith(NATIVE_AD_PACKAGE) },
)

// The ad-free view model's own copy of the gate. Nothing collects its flows in 1.10.28, so this
// is optional.
internal object AdFreeViewModelIsAdsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/eet/core/iap/AdFreeViewModel;",
    name = "isAdsEnabled",
    returnType = "Z",
    parameters = listOf(),
)

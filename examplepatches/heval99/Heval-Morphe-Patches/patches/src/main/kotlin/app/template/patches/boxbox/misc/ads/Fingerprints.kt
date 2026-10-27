package app.template.patches.boxbox.misc.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// AppConfigModel.toString(): a Kotlin data class, so the property names are literal strings.
// Every ad placement (AppLovin up to 5.4.16, Google Mobile Ads from 5.4.17) shows only when
// the plan is Free and the remote config's isAdsEnabled is true. The field read right after
// ", isAdsEnabled=" is the flag.
internal object AppConfigModelToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("AppConfigModel(", StringComparisonType.STARTS_WITH),
        string(", isAdsEnabled="),
    ),
)

// Google Mobile Ads (5.4.17+). R8 renames most GMA classes, so only MobileAds keeps its name
// (handled by the shared neutraliseMobileAdsStatics); the rest is matched by the SDK's own
// precondition messages and method shape.

// MobileAds.initialize, wherever R8 inlined it: the static void that carries the SDK's own init log
// line. 5.4.17 inlined it into a static on MobileAds itself (covered by neutraliseMobileAdsStatics);
// 5.4.18 inlined it into the app's consent-gated ad init helper (a static-only class holding the
// "can request ads" flows), leaving MobileAds with only setPlugin and stop. Matches every such
// method; the patch skips one that is still on MobileAds.
internal object InlinedMobileAdsInitFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("Initializing on calling thread", StringComparisonType.STARTS_WITH)),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null
    },
)

// The static full-screen loads, load(Context, String, AdRequest, callback): InterstitialAd,
// RewardedAd, RewardedInterstitialAd and AppOpenAd. All four open with the SDK's "Context cannot be
// null." check and the "#008" main-thread check. Only InterstitialAd still checks "AdRequest cannot
// be null." in 5.4.18 (R8 dropped it from the other three, which only GMA's own ad inspector test
// handler calls), so that string no longer finds them all. Only concrete matches are patched.
internal object FullScreenAdLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "L", "L"),
    filters = listOf(
        string("Context cannot be null."),
        string("#008 Must be called on the main UI thread."),
    ),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null
    },
)

// BaseAdView.loadAd(AdRequest): the abstract ViewGroup that declares setAdUnitId (public API
// name, kept) and that AdView extends.
internal object BaseAdViewLoadAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(string("#008 Must be called on the main UI thread.")),
    custom = { method, classDef ->
        AccessFlags.FINAL.isSet(method.accessFlags) &&
            AccessFlags.ABSTRACT.isSet(classDef.accessFlags) &&
            classDef.superclass == "Landroid/view/ViewGroup;" &&
            classDef.methods.any { it.name == "setAdUnitId" }
    },
)

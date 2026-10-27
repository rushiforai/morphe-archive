package app.template.patches.truecaller.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The three ad views every banner and native placement binds through. Their class names are kept
// (they are inflated from layouts); their bind methods are R8-renamed, so the patch selects them
// by parameter types.
internal const val ADS_CONTAINER = "Lcom/truecaller/ads/ui/AdsContainer;"
internal const val ADS_CONTAINER_LIGHT = "Lcom/truecaller/ads/ui/AdsContainerLight;"
internal const val ADS_SWITCH_VIEW = "Lcom/truecaller/ads/ui/AdsSwitchView;"
internal const val AD_LAYOUT_TYPE = "Lcom/truecaller/ads/AdLayoutTypeX;"

// AdsSwitchView's bind(bannerAd, AdLayoutTypeX). Its first parameter is the (obfuscated) banner
// ad holder type, which the patch reads from here instead of hard-coding it.
internal object AdsSwitchViewBindFingerprint : Fingerprint(
    definingClass = ADS_SWITCH_VIEW,
    returnType = "V",
    parameters = listOf("L", AD_LAYOUT_TYPE),
    custom = { method, _ -> method.parameterTypes.size == 2 },
)

// The interstitial manager's "can show interstitials" check (krk.e() in 26.39.6):
// isEnabled("featureInterstitialAd") && shouldShowAds. Every interstitial placement (Click to
// WhatsApp, call details, block, pay, ...) asks it first and runs the user's action at once when
// it is false; otherwise the action waits until the ad closes. The key is exact-matched; the only
// other readers are the toggle registries, which return lists.
internal object InterstitialAdsEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("featureInterstitialAd")),
)

// The "Opening WhatsApp / the app" screen shown before an app-open ad (kept: declared in the
// manifest). It holds no pending action: the coroutine that starts it runs the action itself after
// a one-second delay.
internal const val AD_APP_OPENING_ACTIVITY = "Lcom/truecaller/ads/interstitial/AdAppOpeningActivity;"

// The Ads V2 placement check isEnabled(placement, continuation) (ar0.a in 26.40.5): a global Ads V2
// switch, then one feature toggle per AdPlacement (kept sealed class), e.g. "featureAdsV2OnClList"
// for the call log list. Every Ads V2 (Compose) placement asks it before loading or showing
// anything: the call log list ad slot and its ad positions, the call log promo slot, the message
// list, details view, caller ID, in-call and PACS screens. The call log list slot falls back to
// a "Truecaller Premium / Upgrade for an ad-free experience" row (AdPlaceholderType.Premium) when
// no ad fills it. The key is exact-matched; the other readers are the toggle registries.
internal object AdsV2PlacementEnabledFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/truecaller/ads/api/model/ad/AdPlacement;", "L"),
    filters = listOf(string("featureAdsV2OnClList")),
)

// The master "ads allowed" check, AdsAvailability.shouldShowAds() (R8 inlined it into the static
// kt50.Y() in 26.40.5): true when the QA "qaForceAds" flag is set, otherwise only when the Premium
// store's shouldShowAds (off with the NO_ADS feature) is on and the "adsDisabledUntil" time has
// passed. Its callers are all ad gates (the ads loaders, the contacts list and classic call log ad
// slots, TruecallerInit, ...). Only this method reads both strings. Not pinned to static: the check
// used to be an instance method of the ads availability class and may move back.
internal object AdsAllowedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(
        string("qaForceAds", StringComparisonType.CONTAINS),
        string("adsDisabledUntil", StringComparisonType.CONTAINS),
    ),
)

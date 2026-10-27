package app.template.patches.yahoosports.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// Yahoo Sports keeps its view, controller and Verizon Media player class names; members and the
// helper/config classes are R8-renamed. Every anchor below is a kept class name, a stable remote
// config key or method shape.

// SportsAdCardView.setData(input): the one view that renders every in-app ad card. Score, team
// and league lists, the ad-supported webview's top pencil and the video screen all bind it through
// CardCtrl, which makes the view VISIBLE (when needed) before calling setData. The typed overload
// does the work (it builds the GAM or Taboola sponsored-moments ad view and starts the ad load);
// the synthetic setData(Object) bridge only casts and forwards, so it is skipped. The input type is
// R8-renamed, so the overload is matched by "one parameter that is not Object".
internal object SportsAdCardViewSetDataFingerprint : Fingerprint(
    definingClass = "Lcom/yahoo/mobile/ysports/ui/card/media/ads/view/SportsAdCardView;",
    name = "setData",
    returnType = "V",
    custom = { method, _ ->
        method.implementation != null &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString() != "Ljava/lang/Object;"
    },
)

// The sponsored-moments ad config manager (12.10.3: media/ads/manager/a). Its <clinit> declares
// the remote config keys, so the class is found by two of them. Its public no-arg boolean getters
// are the ad switches read outside the class: taboolaNativePencilAdEnabled (12.10.3: a()),
// taboolaStreamAdEnabled (b(): the Taboola stream ad view hides itself when false) and useGamAds
// (c(): the GAM pencil prefetch queue and the extra scores-list ad slots).
internal object AdConfigManagerClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf(
        string("stream_taboola_ad_enabled", StringComparisonType.CONTAINS),
        string("sponsored_moments_use_gam_ads", StringComparisonType.CONTAINS),
    ),
)

// SapiMediaItem.getAdTagUri(): the IMA VAST tag of a Yahoo video. MediaItem is an interface with a
// default getAdTagUri, so the class is pinned. Every reader handles null: the player builds no
// AdsConfiguration (so IMA never runs), the no-ad path reports "no ad", analytics logs "no ad tag".
internal object SapiMediaItemGetAdTagUriFingerprint : Fingerprint(
    definingClass = "Lcom/verizondigitalmedia/mobile/client/android/sapiMediaItemProvider/data/SapiMediaItem;",
    name = "getAdTagUri",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

package semicoloncolonel.mobilestream.patches.newsnation.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.OKHTTP_JSON_FILTER_API
import semicoloncolonel.mobilestream.patches.shared.misc.missingMethods
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.OkHttpClientInitFingerprint

// NewsNation phone app (510.3.0, React Native).
//
// First, the app builds its screens and articles from NewsNation's WordPress
// API, and every screen carries the publisher's own ad switches
// (disabled_ads: display, preroll, nativo, taboola, all). An OkHttp
// interceptor turns all of them on in each response, so the app leaves the
// ad slots out entirely and no blank space is left where an ad would be.
//
// Second, as a fallback, the feed, articles, and video player are
// JavaScript, but every ad is shown through a native ad view or module, which
// tells the JavaScript when its ad could not be filled. Each one now answers
// its load request with that same "no ad" result instead of requesting an ad,
// so the app treats every slot as unfilled:
//   - the app's own Google Ad Manager / Prebid banner (BannerView)
//   - react-native-ad-manager's banner, adaptive banner, and native ad views,
//     and its full-screen (interstitial) ads
//   - Teads in-read video ads
//   - Taboola's recommendation unit and Nativo's sponsored-content cards are
//     never fetched or placed
//   - the video player is never given an ad tag, so videos play without a
//     pre-roll
//
// Ads stitched into the live stream on the server are not affected. The
// Android TV app shares the package name and is patched by
// "Skip ads (Android TV)". Morphe Manager can still select this patch for it,
// so it does nothing there.

private const val EXTENSION = "Lsemicoloncolonel/mobilestream/extension/newsnation/NewsNationAds;"
private const val AD_SWITCH_FILTER = "Lsemicoloncolonel/mobilestream/extension/newsnation/AdSwitchFilter;"
private const val NO_FILL = "invoke-static {p0}, $EXTENSION->noFill(Ljava/lang/Object;)V\nreturn-void"

internal object AppBannerLoadFingerprint : Fingerprint(
    definingClass = "Lcom/nexstar/newsnation/BannerView;",
    name = "loadAd",
    parameters = listOf(),
    returnType = "V",
)

internal object AdManagerBannerLoadFingerprint : Fingerprint(
    definingClass = "Lcom/matejdr/admanager/BannerAdView;",
    name = "loadBanner",
    parameters = listOf(),
    returnType = "V",
)

internal object AdManagerAdaptiveBannerLoadFingerprint : Fingerprint(
    definingClass = "Lcom/matejdr/admanager/AdaptiveBannerAdView;",
    name = "loadBanner",
    parameters = listOf(),
    returnType = "V",
)

internal object AdManagerNativeLoadFingerprint : Fingerprint(
    definingClass = "Lcom/matejdr/admanager/NativeAdViewContainer;",
    name = "loadAd",
    returnType = "V",
)

internal object AdManagerNativeReloadFingerprint : Fingerprint(
    definingClass = "Lcom/matejdr/admanager/NativeAdViewContainer;",
    name = "reloadAd",
    parameters = listOf(),
    returnType = "V",
)

internal object AdManagerInterstitialRequestFingerprint : Fingerprint(
    definingClass = "Lcom/matejdr/admanager/RNAdManagerInterstitial;",
    name = "requestAd",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
    returnType = "V",
)

// TeadsManager.load(FrameLayout, Boolean), the "load" prop.
internal object TeadsLoadFingerprint : Fingerprint(
    definingClass = "Lcom/nexstar/newsnation/Teads/TeadsManager;",
    name = "load",
    parameters = listOf("Landroid/widget/FrameLayout;", "Ljava/lang/Boolean;"),
    returnType = "V",
)

// ReactClassicUnit.receiveCommand(unit, String command, args): "fetch" loads
// the Taboola unit.
internal object TaboolaCommandFingerprint : Fingerprint(
    definingClass = "Lcom/taboolareactnativetaboola/ReactClassicUnit;",
    name = "receiveCommand",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.getOrNull(1)?.toString() == "Ljava/lang/String;" },
)

// RNAdContainerManager.receiveCommand(view, int command, args):
// placeAdInView and prefetchAd.
internal object NativoCommandFingerprint : Fingerprint(
    definingClass = "Lnet/nativo/reactsdk/ntvsdkmanager/RNAdContainerManager;",
    name = "receiveCommand",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.getOrNull(1)?.toString() == "I" },
)

internal object VideoAdTagFingerprint : Fingerprint(
    definingClass = "Lcom/brentvatne/exoplayer/ReactExoplayerView;",
    name = "setAdTagUrl",
    parameters = listOf("Landroid/net/Uri;"),
    returnType = "V",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads (phone)",
    description = "Removes the banner, native, sponsored, and video ads in the phone app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // On the Android TV build (no BannerView) there is nothing to do.
        val phone = AppBannerLoadFingerprint.methodOrNull ?: return@execute

        // The ad-switch filter calls OkHttp and okio by name; fail here, not
        // in the app.
        missingMethods(OKHTTP_JSON_FILTER_API).takeIf { it.isNotEmpty() }?.let {
            throw PatchException("OkHttp methods missing: ${it.joinToString()}")
        }
        OkHttpClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $AD_SWITCH_FILTER->install(Lokhttp3/OkHttpClient\$Builder;)V",
        )

        // Within the phone build every hook must match, so a renamed one
        // fails the patch instead of leaving ads in place.
        phone.returnEarly(NO_FILL)
        AdManagerBannerLoadFingerprint.method.returnEarly(NO_FILL)
        AdManagerAdaptiveBannerLoadFingerprint.method.returnEarly(NO_FILL)
        AdManagerNativeLoadFingerprint.method.returnEarly(NO_FILL)
        AdManagerNativeReloadFingerprint.method.returnEarly(NO_FILL)

        AdManagerInterstitialRequestFingerprint.method.returnEarly(
            "invoke-static {p1}, $EXTENSION->rejectNoFill(Ljava/lang/Object;)V\nreturn-void",
        )

        // Report Teads' own "failed to receive an ad" to the JavaScript
        // instead of requesting one.
        TeadsLoadFingerprint.method.returnEarly(
            """
                iget-object v0, p0, Lcom/nexstar/newsnation/Teads/TeadsManager;->inReadAdListener:Ltv/teads/sdk/InReadAdListener;
                if-eqz v0, :msp_done
                const-string p2, "No fill"
                invoke-interface {v0, p2}, Ltv/teads/sdk/InReadAdBaseListener;->onFailToReceiveAd(Ljava/lang/String;)V
                :msp_done
                return-void
            """,
        )

        TaboolaCommandFingerprint.method.returnEarly("return-void")
        NativoCommandFingerprint.method.returnEarly("return-void")
        VideoAdTagFingerprint.method.returnEarly("return-void")
    }
}

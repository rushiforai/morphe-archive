package semicoloncolonel.mobilestream.patches.cbsnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.misc.disableSignatureCheckPatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News 5.20. The app's classes are not obfuscated.
//
// - Banners: every banner goes through AdsManager.loadCustomTargetedAds.
//   The feed's ad rows are inserted by InjectComponentItem for the server's
//   "AdSlot" entries; returning null inserts no row, so no gap is left. The
//   sticky banner at the bottom is hidden, with the box and divider around
//   it, instead of loading.
// - Video: on-demand and DVR videos get their pre-roll and mid-roll ad tag
//   from AviaConfigs.getOverrideAdUri. With no ad tag, the Paramount AVIA
//   player skips IMA and starts the video.
// - Taboola recommendations under articles are not started, and the
//   Confiant ad-quality SDK, which hooks WebView in native code, is not
//   initialized.
//
// Ads in the live streams are stitched in on the server (Google DAI) and
// still play.

private const val ADS = "Lcom/treemolabs/apps/cbsnews/ads/"
private const val STICKY_BANNER_HIDER = "Lsemicoloncolonel/mobilestream/extension/cbsnews/StickyBannerHider;"

internal object LoadBannerAdFingerprint : Fingerprint(
    definingClass = "${ADS}AdsManager;",
    name = "loadCustomTargetedAds",
    returnType = "V",
)

internal object StickyBannerFingerprint : Fingerprint(
    definingClass = "${ADS}StickyBannerAds;",
    name = "startAdRequest",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Landroid/view/View;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

internal object FeedAdSlotFingerprint : Fingerprint(
    definingClass = "Lcom/treemolabs/apps/cbsnews/ui/components/InjectComponentItem;",
    name = "createInjectableComponentItem",
    strings = listOf("AdSlot"),
)

internal object VideoAdTagFingerprint : Fingerprint(
    definingClass = "Lcom/treemolabs/apps/cbsnews/ui/videoplayers/helpers/AviaConfigs;",
    name = "getOverrideAdUri",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

internal object TaboolaFingerprint : Fingerprint(
    definingClass = "Lcom/treemolabs/apps/cbsnews/ui/fragments/ArticleFragment;",
    name = "startTaboolaAd",
    returnType = "V",
)

internal object ConfiantFingerprint : Fingerprint(
    definingClass = "Lcom/treemolabs/apps/cbsnews/ui/activities/CBSNewsApplication;",
    name = "initializeConfiant",
    returnType = "V",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the banner ads, the ads before and during videos and recordings, and the " +
        "Taboola recommendations under articles. Ads in the live streams are part of the broadcast and " +
        "still play.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableSignatureCheckPatch)

    extendWith("extensions/extension.mpe")

    execute {
        LoadBannerAdFingerprint.method.returnEarly("return-void")
        StickyBannerFingerprint.method.returnEarly(
            """
                invoke-static/range { p2 .. p2 }, $STICKY_BANNER_HIDER->hide(Landroid/view/View;)V
                return-void
            """,
        )
        FeedAdSlotFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn-object v0")
        VideoAdTagFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn-object v0")
        TaboolaFingerprint.method.returnEarly("return-void")
        ConfiantFingerprint.method.returnEarly("return-void")
    }
}

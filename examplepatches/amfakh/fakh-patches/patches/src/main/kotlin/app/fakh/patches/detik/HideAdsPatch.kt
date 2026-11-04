package app.fakh.patches.detik

import app.fakh.patches.detik.shared.Constants.COMPATIBILITY_DETIK
import app.fakh.patches.shared.web.wrapWebClients
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val WEB_ADS = "Lapp/fakh/extension/detik/WebAds;"

/** The screens that show detik.com HTML: the article body (two row types), the in-app browser, the feature pages and Milidetik. */
private val WEB_SCREENS = listOf(
    "Ld8/l;",
    "Ld8/o;",
    "Ls8/b;",
    "Lorg/detikcom/rss/ui/in_app_browser/InAppBrowserDetikActivity;",
    "Lorg/detikcom/rss/ui/detik_feature/detail_feature/DetikFeatureDetailActivity;",
    "LY7/a;",
)

/**
 * The ad placement lookup of the app's AdsManager. Every banner, native ad, full-screen ad and video ad tag starts
 * from it, and each caller already skips its slot when a placement does not exist.
 */
private object AdPlacementFingerprint : Fingerprint(
    returnType = "Lorg/detikcom/rss/data/model/item/DFPPlacementItem;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("identifier=? and placement=?"),
)

/** The bind of the static banner row in the feed, which keeps a 150dp placeholder while no banner is set. */
private object StaticBannerRowFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lorg/detikcom/rss/data/model/item/RssDaoItem;"),
    filters = listOf(fieldAccess(name = "bannerAdReceived"), fieldAccess(name = "bannerAdLoaded")),
)

/** The ad script the server sends with each article, which the article screen puts in the page head. */
private object HeaderAdsFingerprint : Fingerprint(
    definingClass = "Lorg/detikcom/rss/data/model/item/detail_article/DetailContent;",
    name = "getHeaderAds",
    returnType = "Ljava/lang/String;",
)

/** MobileAds.initialize, called from the splash screen. Nothing waits for its callback. */
private object MobileAdsInitFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
    ),
)

/** The Google Mobile Ads SDK starts itself from this provider, before Application.onCreate. */
private val adsProviderPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            (0 until providers.length).map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.google.android.gms.ads.MobileAdsInitProvider" }
                .also { if (it.size != 1) throw PatchException("detikcom: MobileAdsInitProvider not found in the manifest.") }
                .forEach { it.setAttribute("android:enabled", "false") }
        }
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the ad banners, native ads, full-screen ads and video ads, and the ads on detik.com pages opened in the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DETIK)
    category("Ads")
    extendWith("extensions/extension.mpe")
    dependsOn(adsProviderPatch)

    execute {
        AdPlacementFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """,
        )
        HeaderAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """,
        )
        MobileAdsInitFingerprint.method.addInstruction(0, "return-void")
        StaticBannerRowFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView${'$'}E;->itemView:Landroid/view/View;
                new-instance v1, Landroid/widget/AbsListView${'$'}LayoutParams;
                const/4 v2, 0x0
                invoke-direct { v1, v2, v2 }, Landroid/widget/AbsListView${'$'}LayoutParams;-><init>(II)V
                invoke-virtual { v0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup${'$'}LayoutParams;)V
                const/16 v1, 0x8
                invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
                return-void
            """,
        )
        wrapWebClients(WEB_SCREENS, WEB_ADS)
    }
}

package app.template.patches.digisport.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked

// Digi Sport shows AdMob banners as rows in articles and the live EPG list (VHSectionAd ->
// AdMobManager), and IMA pre-rolls before live channels and article/VOD videos. Live channels can
// also be IMA DAI streams with server-inserted ads; those are left to "Disable live stream ads",
// so this patch never changes how a live stream is built. The ad slots come from server "ads"
// lists and <ad-api> elements in article bodies; steps 6-9 drop them at the data level, so the
// spacer rows around them go too. MobileAds is not touched (the app never calls initialize or any
// other MobileAds static; MobileAdsInitProvider is left alone), and neither is SatiManager.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes banner ads and video ads."
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // 1. AdMobManager: loadAd hides the container and returns, so the request/put lambda is
        // never posted. requestAd (the only AdRequest.Builder().build() + AdView.loadAd) and putAd
        // return at once too, which also covers the AdListener's access$requestAd /
        // access$putAd re-entries and the posted lambda; the access$ bridges only forward.
        AdMobManagerLoadAdFingerprint.method.addInstructionsChecked(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
            """,
        )
        AdMobManagerRequestAdFingerprint.method.returnEarly()
        AdMobManagerPutAdFingerprint.method.returnEarly()

        // 2. The ad row itself takes no space: bind sets itemView GONE, zeroes its layout height
        // (the row root is a wrap_content RelativeLayout without margins) and returns before
        // loadAd. A VHSectionAd only ever holds ad rows, so a recycled holder stays hidden.
        // bind has .locals 0, so only p0/p1 exist: p1 (the UIAd) is dropped for the view, then
        // p0 (this) is reused for GONE and the layout params, and p1 for the 0 height.
        VHSectionAdBindFingerprint.method.addInstructionsWithLabelsChecked(
            0,
            """
                iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
                const/16 p0, 0x8
                invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
                move-result-object p0
                if-eqz p0, :collapsed
                const/4 p1, 0x0
                iput p1, p0, Landroid/view/ViewGroup${'$'}LayoutParams;->height:I
                :collapsed
                return-void
            """,
        )

        // 3. Live channel pre-roll: createPlayerInput skips the "Reclama" pre-roll item.
        UiLivePrerollGetEnableFingerprint.method.returnEarly(false)

        // 4. Article and VOD pre-roll: the ad tag reads as "" (the field is a non-null String and
        // GetArticleVod calls isBlank on it), so GetArticleVod adds no pre-roll item.
        // GetArticleDetailsUtils only null-checks it and still adds a blank.mp4 item with an empty
        // ad tag; step 5 makes that item play without ads.
        ArticleApiPayloadsGetMVideoPrerollFingerprint.method.addInstructionsChecked(
            0,
            """
                const-string v0, ""
                return-object v0
            """,
        )

        // 5. Backstop: the player's IMA client-side AdsLoader provider answers null, so media3
        // plays every item with an ads configuration without ads ("Playing media without ads, as
        // no AdsLoader was provided."). PlayerService.onCreate ignores the result, and every
        // reader of the never-set mImaPreRoll null-checks it.
        InitImaAdsFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 6. Data level: the server's ad lists for articles, the EPG, listings and soccer results
        // read as a new empty list (not null: SyncEpgRepositoryBase.extractAds loops over the EPG
        // list without a null check), so no ad item or the spacer around it is ever built.
        listOf(
            ApiArticleDataGetAdsFingerprint,
            ApiEpgDataGetAdsFingerprint,
            ListingDataGetAdsListFingerprint,
            ApiResultsResponseDataGetAdsFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructionsChecked(
                0,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                    return-object v0
                """,
            )
        }

        // 7. In-article <ad-api> elements are never treated as ads, so neither the ad section nor
        // its spacer is added.
        ArticleAdConstraintsFingerprint.method.returnEarly(false)

        // 8. No ad section between article widgets; the caller skips a null section.
        AddAdWidgetFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 9. The EPG cache never gets ad rows.
        SyncEpgAddBannerFingerprint.method.returnEarly()
    }
}

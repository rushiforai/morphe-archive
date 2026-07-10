package app.stremiobridge.patches.letterboxd.videostore

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.stremiobridge.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

/**
 * Hides the "Rent from Letterboxd Video Store" banner on film pages.
 *
 * This is a SEPARATE patch from the Stremio button patch and can be enabled or
 * disabled independently in Morphe Manager. Enabling one does not require or
 * affect the other.
 *
 * -- Approach (modeled on De-Vanced's "Hide ads" patch) --
 * The rent banner is NOT part of the generic call-to-actions list (an earlier
 * attempt at FilmResults.getCallToActions() had no effect because the rent
 * banner is a separate flow). It is rendered by:
 *
 *   Class  : Lcom/letterboxd/letterboxd/ui/fragments/film/FilmFragment;
 *   Method : updateVideoStoreBanner(ActivityFilmBinding, VideoStoreProductSummary)V
 *
 * That method's own logic already hides the banner when the product summary
 * argument is null:
 *
 *   [0] iget-object v0, v4, ...->videoStoreBannerContainer:LinearLayout
 *   ...
 *   [5] if-eqz v5, ...        // if product == null
 *   [11] const/16 v1, 0x8     //   -> set container View.GONE
 *   [12] invoke-virtual {v0, v1}, View;->setVisibility(I)V
 *   [13] if-nez v5, ...
 *   [14] return-void          //   -> and return (banner stays hidden)
 *
 * So the cleanest, most robust neutralization is to force the product-summary
 * parameter (register v5) to null at the very start of the method. Letterboxd's
 * own existing code then hides the container and returns — no view lookups or
 * fragile indices of our own. Register layout: registers=6, ins=3, so the
 * parameters are v3=this, v4=binding, v5=VideoStoreProductSummary.
 *
 * This targets a different method than the Stremio patch, so there are no index
 * conflicts and the two patches work in any combination.
 *
 * -- Home-feed carousel row --
 * The "Letterboxd Video Store" row on the home feed is a separate surface,
 * rendered by SignedInPopularFilmsFragment from PopularViewModel.UIState.MainView.
 * That fragment already hides FragmentSignedInPopularFilmsBinding.videoStoreProductsLayout
 * (LinearLayout, set to View.GONE) whenever MainView.getVideoStoreHomeData()
 * returns null. So rather than touching the fragment's rendering code, this
 * patch neutralizes the data-class getter itself to always return null:
 *
 *   Class  : PopularViewModel.UIState.MainView (Kotlin data class)
 *   Method : getVideoStoreHomeData()Lcom/letterboxd/api/model/VideoStoreHomeResponse;
 *
 * That getter is a tiny, single-purpose accessor in its own class/dex, with no
 * overlap with any method touched by the Stremio patch or the film-page banner
 * patch above — no index-conflict risk.
 */
@Suppress("unused")
val hideVideoStoreCtaPatch = bytecodePatch(
    name = "Hide Video Store",
    description = "Hides the \"Rent from Letterboxd Video Store\" banner on film " +
        "pages and the video store carousel row on the home feed. Can be " +
        "toggled independently of the Stremio button patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // Force the VideoStoreProductSummary parameter (v5) to null so the
        // method's own "no product -> hide container" path runs.
        UpdateVideoStoreBannerFingerprint.method.addInstructions(
            0,
            "const/4 v5, 0x0",
        )

        // Force the home-feed video store getter to always return null so the
        // fragment's own "no data -> hide row" path runs.
        GetVideoStoreHomeDataFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return-object v0
            """.trimIndent(),
        )
    }
}

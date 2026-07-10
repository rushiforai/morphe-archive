package app.stremiobridge.patches.letterboxd.videostore

import app.morphe.patcher.Fingerprint

/**
 * Targets FilmFragment.updateVideoStoreBanner(ActivityFilmBinding,
 * VideoStoreProductSummary)V — the method that populates (or hides) the
 * "Rent from Letterboxd Video Store" banner on film pages.
 *
 * Verified against Letterboxd 3.5.3 (versionCode 495) by direct DEX analysis.
 * The method already hides the banner container when its product-summary
 * argument is null, so the patch forces that argument to null.
 *
 * Matched by class type + method name so it's resilient to most updates that
 * don't rename the method.
 */
object UpdateVideoStoreBannerFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmFragment;" &&
            method.name == "updateVideoStoreBanner"
    },
)

/**
 * Targets PopularViewModel.UIState.MainView.getVideoStoreHomeData() — the
 * Kotlin data-class getter that exposes the nullable VideoStoreHomeResponse
 * backing the "Letterboxd Video Store" carousel row on the home feed.
 *
 * Verified against Letterboxd 3.5.3 (versionCode 495) by direct DEX analysis.
 * SignedInPopularFilmsFragment's state collector (onViewCreated$3$1.emit)
 * already hides FragmentSignedInPopularFilmsBinding.videoStoreProductsLayout
 * (sets visibility GONE) whenever this getter returns null, so forcing it to
 * always return null is sufficient to hide the row.
 *
 * Matched by class type + method name so it's resilient to most updates that
 * don't rename the getter.
 */
object GetVideoStoreHomeDataFingerprint : Fingerprint(
    returnType = "Lcom/letterboxd/api/model/VideoStoreHomeResponse;",
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel\$UIState\$MainView;" &&
            method.name == "getVideoStoreHomeData"
    },
)

package app.stremiobridge.patches.letterboxd.spotlight

import app.morphe.patcher.Fingerprint

/**
 * Targets PopularViewModel.UIState.MainView.getFeaturedTrailer() — the Kotlin
 * data-class getter that exposes the nullable FeaturedContentItem.FeaturedTrailer
 * backing the "Spotlight" ad card on the home feed (labelled with an "AD" badge
 * next to the "Popular this week" row; title/subtitle/poster/video all come from
 * this object, e.g. title "Spotlight", subtitle = the sponsor's own title).
 *
 * Verified against Letterboxd 3.5.7 (versionCode 503) by direct DEX analysis.
 * SignedInPopularFilmsFragment's state collector (onViewCreated$3$1.emit) already
 * hides FragmentSignedInPopularFilmsBinding.adComposeView (a Jetpack Compose
 * ComposeView, set to View.GONE) whenever this getter returns null; when non-null
 * it sets the view VISIBLE and calls setContent(...) to render the ad card. So
 * forcing this getter to always return null is sufficient to hide the card,
 * exactly mirroring the Hide Video Store patch's approach to the home-feed
 * "Letterboxd Video Store" carousel row.
 *
 * Matched by class type + method name so it's resilient to most updates that
 * don't rename the getter.
 */
object GetFeaturedTrailerFingerprint : Fingerprint(
    returnType = "Lcom/letterboxd/api/model/FeaturedContentItem\$FeaturedTrailer;",
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel\$UIState\$MainView;" &&
            method.name == "getFeaturedTrailer"
    },
)

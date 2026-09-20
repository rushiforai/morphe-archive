package app.stremiobridge.patches.letterboxd.spotlight

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.stremiobridge.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

/**
 * Hides the sponsored "Spotlight" ad card on the home feed (the "AD"-badged
 * card shown near the "Popular this week" row, e.g. promoting a Video Store
 * title or a paid studio placement).
 *
 * This is a SEPARATE patch from the Stremio button, Hide Video Store, and Hide
 * Where to Watch patches and can be enabled or disabled independently in
 * Morphe Manager.
 *
 * -- Approach --
 * The card is rendered into a Jetpack Compose ComposeView:
 *
 *   Class  : Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel$UIState$MainView;
 *   Method : getFeaturedTrailer()Lcom/letterboxd/api/model/FeaturedContentItem$FeaturedTrailer;
 *
 * SignedInPopularFilmsFragment's state-collector coroutine
 * (onViewCreated$3$1.emit) already hides
 * FragmentSignedInPopularFilmsBinding.adComposeView (View.GONE) whenever this
 * getter returns null; when non-null it sets the view VISIBLE and populates it
 * via Compose setContent(...). So the cleanest, most robust neutralization is
 * to force this getter to always return null — Letterboxd's own existing code
 * then hides the ComposeView and never invokes setContent. Register layout:
 * registers=2, ins=1 (a plain zero-arg instance getter: v0 is free, v1=this).
 *
 * This targets a tiny, single-purpose getter in its own method — no overlap
 * with any method touched by the other three patches, so all four can be
 * applied together in any combination.
 */
@Suppress("unused")
val hideSpotlightAdPatch = bytecodePatch(
    name = "Hide Spotlight Ad",
    description = "Hides the sponsored \"Spotlight\" ad card on the home feed. " +
        "Can be toggled independently of the other patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // Force the getter to always return null so the fragment's own
        // "no featured trailer -> hide ad card" path runs.
        GetFeaturedTrailerFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return-object v0
            """.trimIndent(),
        )
    }
}

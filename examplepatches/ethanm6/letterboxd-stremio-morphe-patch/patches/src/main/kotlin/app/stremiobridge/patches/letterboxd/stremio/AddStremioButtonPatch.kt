package app.stremiobridge.patches.letterboxd.stremio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.stremiobridge.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

/**
 * Smali descriptor of the merged extension class.
 * Must exactly match the package declared in StremioExtension.java.
 */
private const val EXTENSION_CLASS = "Lapp/stremiobridge/extension/StremioExtension;"

/**
 * Adds a purple "Stremio" button to Letterboxd film pages, styled as a
 * runtime clone of the real trailer button (same background drawable,
 * text appearance, padding, icon — only the label and tint differ).
 *
 * Placed directly below the trailer button when one exists, or in the
 * trailer button's exact original position when there is none (the real
 * trailer button stays in the layout but hidden via View.GONE in that
 * case — see ConfigureTrailerFingerprint). Tapping the button opens the
 * film directly in the Stremio app via deep link, or the Stremio web
 * player as a fallback.
 *
 * Two separate injection points are used:
 *
 * 1. FilmFragment.updateData — caches the current film's IMDb ID into a
 *    static field in the extension (FilmResults -> Film.getLinks() ->
 *    Link[type=Imdb].getId(), read via reflection). Runs once per film
 *    page load, before the button can be tapped.
 *
 *    Index 0, register v6 = FilmViewModel$FilmResults (passed as Object;
 *    pristine incoming-parameter state, no need to wait for any field load).
 *
 * 2. FilmHeaderFragment.configureTrailer — creates and positions the
 *    button as a runtime clone of the real trailer button.
 *
 *    Index 0, registers:
 *      v1 = this (FilmHeaderFragment / Fragment)
 *      v2 = FilmTrailer, nullable (null means "no trailer")
 *      v4 = FragmentFilmHeaderBinding (as Object; "trailerButton" read via
 *           reflection, since View Binding classes expose views as plain
 *           public fields)
 *
 * Does not overlap with the "Hide ads" or "Unlock app icons" community
 * patches, so all three can be applied together.
 */
@Suppress("unused")
val addStremioButtonPatch = bytecodePatch(
    name = "Add Stremio button",
    description = "Adds a purple Stremio button directly below the trailer button " +
        "on film pages, styled identically to it. Takes the trailer button's " +
        "position when there is no trailer. Opens the film directly in the " +
        "Stremio app or web player.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    extendWith("extensions/extension.mpe")

    execute {
        UpdateDataFingerprint.method.addInstructions(
            0,
            "invoke-static { v6 }, " +
                "$EXTENSION_CLASS->cacheImdbId(Ljava/lang/Object;)V",
        )

        ConfigureTrailerFingerprint.method.addInstructions(
            0,
            "invoke-static { v1, v2, v4 }, " +
                "$EXTENSION_CLASS->onTrailerConfigured(" +
                "Landroidx/fragment/app/Fragment;" +
                "Ljava/lang/Object;" +
                "Ljava/lang/Object;" +
                ")V",
        )
    }
}

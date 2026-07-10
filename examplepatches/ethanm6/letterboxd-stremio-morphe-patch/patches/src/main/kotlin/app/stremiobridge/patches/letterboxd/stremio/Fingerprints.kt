package app.stremiobridge.patches.letterboxd.stremio

import app.morphe.patcher.Fingerprint

/**
 * Targets FilmFragment.updateData(ActivityFilmBinding, FilmViewModel$FilmResults)V.
 *
 * Used solely to cache the current film's IMDb ID (via FilmResults ->
 * Film.getLinks() -> Link[type=Imdb].getId(), read with reflection in the
 * extension). This runs once per film-page load, before the user can tap
 * the Stremio button created by ConfigureTrailerFingerprint's injection.
 *
 * Verified against Letterboxd 3.5.3 (versionCode 495).
 */
object UpdateDataFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmFragment;" &&
            method.name == "updateData"
    },
)

/**
 * Targets FilmHeaderFragment.configureTrailer(FilmTrailer, String, FragmentFilmHeaderBinding)V.
 *
 * Verified against Letterboxd 3.5.3 (versionCode 495) by direct DEX analysis.
 *
 * Earlier patch revisions incorrectly targeted FilmFragment.updateData and its
 * filmCallToActionsCompose ComposeView — that view turned out to be the
 * unrelated "Rent from Video Store" CTA section, not the trailer button.
 * The real trailer button (android.widget.Button, id "trailerButton") lives
 * in a separate child fragment, FilmHeaderFragment, hosted via the
 * filmHeader FragmentContainerView in activity_film.xml.
 *
 * configureTrailer's logic (decompiled):
 *   if (trailer == null) {
 *       binding.trailerButton.setVisibility(GONE)   // button stays in layout, just hidden
 *   } else {
 *       binding.trailerButton.setOnClickListener(...)
 *   }
 *
 * No styling is set programmatically anywhere in this method — the pill
 * shape, background, and icon all come from the static XML/style resource
 * on the <Button> element. This is why the extension clones the live
 * Drawable/TextView properties at runtime instead of hardcoding them.
 *
 * Matched by class type + method name only (not "access$configureTrailer",
 * the Kotlin-generated synthetic bridge for the same method).
 */
object ConfigureTrailerFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmHeaderFragment;" &&
            method.name == "configureTrailer"
    },
)

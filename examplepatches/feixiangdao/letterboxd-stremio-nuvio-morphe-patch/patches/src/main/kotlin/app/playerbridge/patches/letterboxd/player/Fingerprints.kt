package app.playerbridge.patches.letterboxd.player

import app.morphe.patcher.Fingerprint

/**
 * FilmFragment.updateData(ActivityFilmBinding, FilmViewModel$FilmResults)V
 * Verified against Letterboxd 3.5.3 (versionCode 495).
 */
object UpdateDataFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmFragment;" &&
            method.name == "updateData"
    },
)

/**
 * FilmHeaderFragment.configureTrailer(
 *   FilmTrailer, String, FragmentFilmHeaderBinding
 * )V
 * Verified against Letterboxd 3.5.3 (versionCode 495).
 */
object ConfigureTrailerFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmHeaderFragment;" &&
            method.name == "configureTrailer"
    },
)

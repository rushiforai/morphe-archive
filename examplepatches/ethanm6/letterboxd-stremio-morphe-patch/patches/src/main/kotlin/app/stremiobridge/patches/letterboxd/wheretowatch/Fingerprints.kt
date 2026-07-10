package app.stremiobridge.patches.letterboxd.wheretowatch

import app.morphe.patcher.Fingerprint

/**
 * Targets WhereToWatchFragment.updateServicesIcons(Z, List<ProductionAvailability>)V
 * — the method that populates (or hides) the "Where to watch" streaming-service
 * icon row on film pages.
 *
 * Verified against Letterboxd 3.5.4 (versionCode 496) by direct DEX analysis.
 * WhereToWatchFragment is the child fragment hosted in
 * ActivityFilmBinding.filmWheretowatch (a FragmentContainerView). The method
 * already hides its own root LinearLayout when the film isn't owned and the
 * providers list is empty, so the patch forces both arguments into that state.
 *
 * Matched by class type + method name so it's resilient to most updates that
 * don't rename the method.
 */
object UpdateServicesIconsFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/letterboxd/letterboxd/ui/fragments/film/WhereToWatchFragment;" &&
            method.name == "updateServicesIcons"
    },
)

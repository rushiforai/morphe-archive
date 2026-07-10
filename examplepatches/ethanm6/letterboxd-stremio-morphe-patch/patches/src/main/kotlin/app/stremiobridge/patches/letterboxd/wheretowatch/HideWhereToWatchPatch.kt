package app.stremiobridge.patches.letterboxd.wheretowatch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.stremiobridge.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

/**
 * Hides the "Where to watch" streaming-service icon row on film pages.
 *
 * This is a SEPARATE patch from the Stremio button and Hide Video Store
 * patches and can be enabled or disabled independently in Morphe Manager.
 *
 * -- Approach --
 * The row is the "filmWheretowatch" FragmentContainerView in
 * ActivityFilmBinding, hosting its own child fragment:
 *
 *   Class  : Lcom/letterboxd/letterboxd/ui/fragments/film/WhereToWatchFragment;
 *   Method : updateServicesIcons(Z, List<ProductionAvailability>)V
 *
 * That method's own logic already hides the fragment's root LinearLayout when
 * the film isn't owned (rented/bought) and the providers list is empty:
 *
 *   if (!owned && providers.isEmpty()) {
 *       binding.getRoot().setVisibility(View.GONE)
 *       return
 *   }
 *
 * So the cleanest, most robust neutralization is to force both arguments into
 * that state at the very start of the method — owned (p1) to false and
 * providers (p2) to an empty list. Letterboxd's own existing code then hides
 * the row and returns — no view lookups or fragile indices of our own.
 *
 * This targets a class untouched by the Stremio button and Hide Video Store
 * patches, so there are no index conflicts and all three patches work in any
 * combination.
 */
@Suppress("unused")
val hideWhereToWatchPatch = bytecodePatch(
    name = "Hide Where to Watch",
    description = "Hides the \"Where to watch\" streaming-service icon row on " +
        "film pages. Can be toggled independently of the other patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // Force owned=false and providers=emptyList() so the method's own
        // "nothing to show -> hide row" path runs.
        UpdateServicesIconsFingerprint.method.addInstructions(
            0,
            """
            const/4 p1, 0x0
            invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;
            move-result-object p2
            """.trimIndent(),
        )
    }
}

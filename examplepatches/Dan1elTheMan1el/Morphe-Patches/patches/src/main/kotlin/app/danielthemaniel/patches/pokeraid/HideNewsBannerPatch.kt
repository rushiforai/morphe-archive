package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Hides PokeRaid's multiple-announcement carousel at the generated
 * Data Binding layer.
 *
 * Do NOT remove the <include> from fragment layouts:
 * generated Data Binding expects the included binding to exist.
 *
 * The binding implementation for view_multiple_announcement_banners is
 * gj.pq. Its executeBindings() equivalent, g(), normally observes
 * MultipleAnnouncementBannersViewModel.f57291k and calls:
 *
 *     th.c.D(recyclerView, visible)
 *
 * which maps to View.setVisibility(VISIBLE/GONE).
 *
 * Returning after forcing this binding's RecyclerView to GONE keeps the
 * binding object intact while preventing runtime updates from restoring
 * the announcement carousel.
 */
@Suppress("unused")
val hideNewsBannersPatch = bytecodePatch(
    name = "Hide News Banners",
    description = "Hides PokeRaid announcement carousels without breaking Data Binding.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        val announcementBinding = mutableClassDefBy(
            "Lgj/pq;"
        )

        announcementBinding.methods
            .first {
                it.name == "g" &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "V"
            }
            .addInstructions(
                0,
                """
                iget-object v0, p0, Lgj/oq;->t:Landroidx/recyclerview/widget/RecyclerView;

                const/16 v1, 0x8
                invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V

                return-void
                """.trimIndent()
            )
    }
}

package app.polishapps.patches.orange.dashboard

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_MOJ_ORANGE

@Suppress("unused")
val hideOfferCarouselPatch = bytecodePatch(
    name = "Hide offer carousels",
    description = "Removes the offer carousels from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOJ_ORANGE)

    dependsOn(dashboardItemsHookPatch)

    execute {
        setLayoutId("ghostCollectionLayout", "template_main_dashboard_ghost_collection")
        setLayoutId("ghostSkeletonLayout", "template_main_dashboard_ghost_skeleton")
        setExtensionConstant("hideOfferCarousel", 1)
    }
}

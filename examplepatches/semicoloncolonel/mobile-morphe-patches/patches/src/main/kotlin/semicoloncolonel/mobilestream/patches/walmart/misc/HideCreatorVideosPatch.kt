package semicoloncolonel.mobilestream.patches.walmart.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants
import semicoloncolonel.mobilestream.patches.walmart.shared.filterWalmartTempoModules

// ─────────────────────────────────────────────────────────────────────────────
// Hide creator videos.
//
// Walmart 26.42.2 shows content creators' videos, which earn them a
// commission, as "Featured in videos" on item pages (Tempo module type
// MobileSocialContent) and as video carousels on the home and membership
// pages (VideoCarousel). Both module types are dropped from the page's module
// list as the page is read.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideCreatorVideosPatch = bytecodePatch(
    name = "Hide creator videos",
    description = "Removes the \"Featured in videos\" creator sections and video carousels.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        filterWalmartTempoModules("walmartCreatorVideoModules")
    }
}

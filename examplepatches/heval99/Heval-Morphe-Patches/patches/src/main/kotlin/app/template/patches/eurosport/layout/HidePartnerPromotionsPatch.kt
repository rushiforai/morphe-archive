package app.template.patches.eurosport.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.eurosport.shared.returnNull
import app.template.patches.eurosport.shared.single
import app.template.patches.eurosport.shared.singleStaticFactory
import app.template.patches.eurosport.shared.toStringFingerprint
import app.template.patches.shared.Constants.COMPATIBILITY_EUROSPORT

// The "Watch on" banner model (8.33.0: pki) on article, match and video pages.
private val WatchBannerToStringFingerprint = toStringFingerprint("WatchBannerUi(label=")

@Suppress("unused")
val hidePartnerPromotionsPatch = bytecodePatch(
    name = "Hide partner promotions",
    description = "Hides the \"Watch on\" streaming partner banners.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EUROSPORT)

    execute {
        // The WatchBannerUi factory (8.33.0: static qai.c(lki)) answers null, as it already does
        // when the server sends no banner. All eight callers handle null.
        val banner = single(WatchBannerToStringFingerprint, "WatchBannerUi toString").classDef.type
        singleStaticFactory(banner, "WatchBannerUi").method.returnNull()
    }
}

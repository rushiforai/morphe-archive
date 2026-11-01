package patches.ftm

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Closes evidenced automatic shop-product announcements while preserving service notices, manual forms and editorial content.") {
    compatibleWith(ftm)
    dependsOn(originalInput, webContent)
    execute { enable("Ads") }
}

package patches.bright

import app.morphe.patcher.patch.bytecodePatch

/**
 * Native advertising suppression: banner activation and reserved layout,
 * interstitial policy and its article-click continuation. The Google Mobile
 * Ads SDK initialization itself still runs; no ad request, banner or
 * interstitial display survives the audited activation paths, and hosted
 * web/video advertising remains out of scope for this control. Publisher
 * advertorial records are filtered separately before feed layout.
 */
@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Stops the inspected Google Ad Manager banner loading and layout, and completes the interstitial policy through its genuine no-ad continuation so article navigation is unchanged. Also removes publisher-marked advertorial records before feed layout. The ads SDK initialization and hosted web/video advertising are not covered by this control.",
) {
    dependsOn(originalInput, runtime, adNative)
    compatibleWith(bright)
    execute { selectControl("ads") }
}

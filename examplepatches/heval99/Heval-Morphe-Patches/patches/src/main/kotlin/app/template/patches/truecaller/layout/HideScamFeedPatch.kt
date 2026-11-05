package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls

private const val FEATURE = "truecaller.hide_scam_feed"

// A Heval Controls feature: the Scam Feed master switch answers false only while it is on. The
// bottom bar and the drawer are built at launch, hence the restart.
@Suppress("unused")
val hideScamFeedPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide Scam feed",
        description = "Turns off the Scam feed, its tab and its notifications.",
        category = TruecallerControlsCategory.TABS,
        restartRequired = true,
    ),
    default = false,
) {
    ScamFeedFeatureFingerprint.method.hevalReturnEarly(FEATURE, false)
}

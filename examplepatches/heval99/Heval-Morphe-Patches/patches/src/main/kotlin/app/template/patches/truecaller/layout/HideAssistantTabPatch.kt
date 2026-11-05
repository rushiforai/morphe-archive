package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls

private const val FEATURE = "truecaller.hide_assistant_tab"

// A Heval Controls feature: the Call Assistant check answers false only while it is on. The bottom
// bar is built at launch, hence the restart.
@Suppress("unused")
val hideAssistantTabPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide Assistant tab",
        description = "Turns off Call Assistant and hides its tab.",
        category = TruecallerControlsCategory.TABS,
        restartRequired = true,
    ),
    default = false,
) {
    CallAssistantFeatureFingerprint.method.hevalReturnEarly(FEATURE, false)
}

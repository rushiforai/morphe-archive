package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideFeatureToggle

private const val FEATURE = "truecaller.hide_family_button"

// A Heval Controls feature: the override applies only while it is on. The home screen reads the
// toggle when it is built, hence the restart.
@Suppress("unused")
val hideFamilyButtonPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide family button",
        description = "Turns off Family Protection and hides its button.",
        category = TruecallerControlsCategory.TABS,
        restartRequired = true,
    ),
    default = false,
) {
    // "featureFamilyProtect" is read inline at several sites (home screen, family status,
    // notification worker), so it is overridden in the toggle resolver itself.
    overrideFeatureToggle("featureFamilyProtect", false, FEATURE)
}

package app.template.patches.truecaller.misc.autolaunch

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

private const val FEATURE = "truecaller.disable_auto_launch"

// A Heval Controls feature: the override applies only while it is on.
@Suppress("unused")
val disableAutoLaunchPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Disable auto-launch",
        description = "Stops Truecaller from opening itself in the background.",
        category = TruecallerControlsCategory.PROMOTIONS,
    ),
) {
    // "featureAutoAppLaunchPassive" is a server experiment for passive users: after N inactive
    // days the app starts its own VIEW deep link with FLAG_ACTIVITY_NEW_TASK while the screen
    // is off. Reading it as off keeps every user in the control group.
    overrideReadFeatureToggles(listOf("featureAutoAppLaunchPassive"), false, FEATURE)
}

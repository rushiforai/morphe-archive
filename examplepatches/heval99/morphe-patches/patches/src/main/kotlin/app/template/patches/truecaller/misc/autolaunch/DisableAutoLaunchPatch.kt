package app.template.patches.truecaller.misc.autolaunch

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

@Suppress("unused")
val disableAutoLaunchPatch = bytecodePatch(
    name = "Disable auto-launch",
    description = "Stops Truecaller from opening itself in the background.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // "featureAutoAppLaunchPassive" is a server experiment for passive users: after N inactive
        // days the app starts its own VIEW deep link with FLAG_ACTIVITY_NEW_TASK while the screen
        // is off. Reading it as off keeps every user in the control group.
        overrideReadFeatureToggles(listOf("featureAutoAppLaunchPassive"), false)
    }
}

package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.overrideFeatureToggle

@Suppress("unused")
val hideFamilyButtonPatch = bytecodePatch(
    name = "Hide family button",
    description = "Turns off Family Protection and hides its button.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // "featureFamilyProtect" is read inline at several sites (home screen, family status,
        // notification worker), so it is overridden in the toggle resolver itself.
        overrideFeatureToggle("featureFamilyProtect", false)
    }
}

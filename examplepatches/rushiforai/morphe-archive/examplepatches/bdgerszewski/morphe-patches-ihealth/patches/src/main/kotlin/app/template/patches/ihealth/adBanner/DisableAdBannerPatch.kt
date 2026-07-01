package app.template.patches.ihealth.adBanner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IHEALTH

@Suppress("unused")
val disableAdBannerPatch = bytecodePatch(
    name = "Disable ad banner",
    description = "Prevents the rotating ad banner from appearing at the bottom of the Devices screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IHEALTH)

    execute {
        ShowAdBannerDevicesFingerprint.method.addInstructions(0, "return-void")
        ShowAdBannerSettingsFingerprint.method.addInstructions(0, "return-void")
    }
}

package app.template.patches.andropods.play

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ANDROPODS_COMPATIBILITY
import app.template.patches.shared.disableAndroPodsPairIp
import app.template.patches.shared.replaceBody

@Suppress("unused")
val androPodsPlayStorePatch = bytecodePatch(
    name = "Play Store Fix",
    description = "Removes the Google Play installation check that blocks patched APKs at startup.",
    default = true,
) {
    compatibleWith(ANDROPODS_COMPATIBILITY)

    execute {
        AndroPodsPairIpCheckLicenseFingerprint.method.replaceBody("return-void")
        disableAndroPodsPairIp()
    }
}

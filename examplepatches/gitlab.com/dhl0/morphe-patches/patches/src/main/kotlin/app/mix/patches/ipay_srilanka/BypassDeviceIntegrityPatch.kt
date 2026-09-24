package app.mix.patches.ipay_srilanka

import app.mix.patches.all.pairip.license.disableLicenseCheckPatch
import app.mix.patches.ipay_srilanka.shared.Constants.COMPATIBILITY_IPAY_SRILANKA
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val bypassDeviceIntegrityChecksPatch = bytecodePatch(
    name = "Bypass device integrity checks",
    description = "Bypasses startup validation: client-side licensing and " +
        "Developer Option / USB / Wireless debugging state checks.",
) {
    compatibleWith(COMPATIBILITY_IPAY_SRILANKA)

    dependsOn(
        disableLicenseCheckPatch,
        neutralizeDeviceIntegrityNativePatch,
    )
}

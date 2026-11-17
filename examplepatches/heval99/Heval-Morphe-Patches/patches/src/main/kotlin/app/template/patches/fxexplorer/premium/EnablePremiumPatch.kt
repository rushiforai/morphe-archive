package app.template.patches.fxexplorer.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FXEXPLORER

/**
 * FX Explorer decides Plus locally: the licence blob from Play (`plus_json` + `plus_signature`)
 * is verified in one method, with the separate `nextapp.fx.rk` licence app as a second source.
 * Making that method answer true unlocks the Plus screens (audio/video/media, archive, network,
 * root and the other Plus tools). Purchases and Play Billing are untouched.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Plus features.",
) {
    compatibleWith(COMPATIBILITY_FXEXPLORER)

    execute {
        PlusLicenseFingerprint.method.returnEarly(true)
    }
}

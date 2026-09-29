/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.protonvpn.delay

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val removeChangeServerDelayPatch = bytecodePatch(
    name = "Remove delay",
    description = "Removes the imposed delay when changing VPN servers."
) {
    compatibleWith(Compat.PROTON_VPN)

    execute {
        GetLongDelayFingerprint.method.returnEarly(0)
        GetShortDelayFingerprint.method.returnEarly(0)
    }
}
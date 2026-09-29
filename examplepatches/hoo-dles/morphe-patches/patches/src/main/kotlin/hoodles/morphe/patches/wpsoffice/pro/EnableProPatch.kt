/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.wpsoffice.pro

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.wpsoffice.shared.antitamper.disableAntiTamperPatch

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables app features locked behind the subscription paywall. Login is required and AI functionality is unavailable."
) {
    compatibleWith(Compat.WPS_OFFICE)

    dependsOn(disableAntiTamperPatch)

    execute {
        HasPrivilegeFingerprint.method.returnEarly(true)
    }
}
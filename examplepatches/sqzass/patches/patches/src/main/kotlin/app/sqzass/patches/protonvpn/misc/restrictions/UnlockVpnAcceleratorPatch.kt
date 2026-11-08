/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val unlockVpnAcceleratorPatch: BytecodePatch = bytecodePatch(
    name = "Unlock VPN Accelerator",
    description = "Unlocks VPN Accelerator on free plans.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // VPN Accelerator is controlled by isAcceleratorEnabled() in ConnectionPreferences
        val clazz = findClass("Lcom/protonvpn/android/connectionpreferences/ConnectionPreferences;")
        val method = clazz.findMethod("isAcceleratorEnabled", "()Z")
            ?: throw IllegalStateException("isAcceleratorEnabled not found")
        method.clearBody()
        method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

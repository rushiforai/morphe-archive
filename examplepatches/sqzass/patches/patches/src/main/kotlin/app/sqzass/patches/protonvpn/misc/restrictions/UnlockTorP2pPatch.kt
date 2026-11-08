/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val unlockTorP2pPatch: BytecodePatch = bytecodePatch(
    name = "Unlock Tor over VPN / P2P",
    description = "Unlocks Tor and P2P servers on free plans.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // Tor over VPN is controlled by isTorEnabled() in ConnectionPreferences
        val clazz = findClass("Lcom/protonvpn/android/connectionpreferences/ConnectionPreferences;")
        val method = clazz.findMethod("isTorEnabled", "()Z")
            ?: throw IllegalStateException("isTorEnabled not found")
        method.clearBody()
        method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        
        // P2P is controlled by isP2PEnabled() in ConnectionPreferences
        val p2pMethod = clazz.findMethod("isP2PEnabled", "()Z")
            ?: throw IllegalStateException("isP2PEnabled not found")
        p2pMethod.clearBody()
        p2pMethod.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

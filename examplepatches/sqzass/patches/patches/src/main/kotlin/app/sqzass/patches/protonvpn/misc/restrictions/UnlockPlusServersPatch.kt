/*
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val unlockPlusServersPatch: BytecodePatch = bytecodePatch(
    name = "Unlock Plus servers",
    description = "Forces Server.isPlusServer() to return true so Secure Core / Plus-tier servers are selectable on free plans.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        val clazz = findClass("Lcom/protonvpn/android/servers/Server;")
        val method = clazz.findMethod("isPlusServer", "()Z")
            ?: throw IllegalStateException("isPlusServer not found")
        method.clearBody()
        method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

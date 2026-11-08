/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val unlockSpeedTestPatch: BytecodePatch = bytecodePatch(
    name = "Unlock speed test",
    description = "Unlocks speed test feature.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // Speed test is controlled by a feature flag - intercept the method that checks it
        val clazz = findClass("Lcom/protonvpn/android/redesign/app/ui/speed/SpeedTestManager;")
        val speedMethod = clazz.findMethod("isSpeedTestEnabled", "()Z")
            ?: findMethodInClazz(clazz, "checkSpeed", "()Z")
            ?: throw IllegalStateException("Speed test method not found")
        speedMethod.clearBody()
        speedMethod.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

private fun findMethodInClazz(clazz: any, name: String, paramDesc: String): any {
    return clazz.methods.singleOrNull { it.name == name && it.parameterTypes.size == 1 } ?: throw IllegalStateException("Method not found")
}

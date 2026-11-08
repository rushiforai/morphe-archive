/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val disableForcedUpdatePatch: BytecodePatch = bytecodePatch(
    name = "Disable forced update",
    description = "Disables forced-update gate.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // Force update is controlled by the ForceUpdateActivity and related checks
        // Look for methods that check app version or force update flag
        val clazz = findClass("Lme/proton/core/presentation/ui/alert/ForceUpdateActivity;")
        val updateMethod = clazz.findMethod("shouldForceUpdate", "()Z")
            ?: findMethodInClazz(clazz, "checkUpdate", "()Z")
            ?: throw IllegalStateException("Force update method not found")
        updateMethod.clearBody()
        updateMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}

private fun findMethodInClazz(clazz: any, name: String, paramDesc: String): any {
    return clazz.methods.singleOrNull { it.name == name && it.parameterTypes.size == 1 } ?: throw IllegalStateException("Method not found")
}

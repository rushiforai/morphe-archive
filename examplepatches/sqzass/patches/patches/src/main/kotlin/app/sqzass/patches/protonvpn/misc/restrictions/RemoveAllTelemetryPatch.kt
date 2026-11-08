/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val removeAllTelemetryPatch: BytecodePatch = bytecodePatch(
    name = "Remove all telemetry",
    description = "Removes all telemetry/analytics.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // Telemetry is sent via me.proton.core telemetry library
        // Intercept the methods that send telemetry data
        val clazz = findClass("Lme/proton/core/telemetry/TelemetryManager;")
        val sendMethod = clazz.findMethod("send", "(Lme/proton/core/telemetry/TelemetryEvent;)V")
            ?: findMethodInClazz(clazz, "report", "(Ljava/lang/String;)V")
            ?: throw IllegalStateException("Telemetry method not found")
        sendMethod.clearBody()
        sendMethod.addInstructions(0, "return-void")
    }
}

private fun findMethodInClazz(clazz: any, name: String, paramDesc: String): any {
    return clazz.methods.singleOrNull { it.name == name && it.parameterTypes.size == 1 } ?: throw IllegalStateException("Method not found")
}

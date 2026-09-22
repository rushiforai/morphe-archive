/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/ResourceBatteryGovernor;"
private const val MANAGER = "Landroid/hardware/SensorManager;"
private const val LISTENER_AND_SENSOR = "Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;"

@Suppress("unused")
val resourceBatteryGovernorPatch = bytecodePatch(
    name = "Resource and battery governor",
    description = "Stops TikTok listening to the motion sensors it polls for device fingerprinting: the accelerometer, gyroscope, magnetometer, rotation, gravity and linear acceleration sensors. Saves the battery they wake. Switch: Hushfeed settings > Privacy.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableResourceGovernor()V",
        )

        // The plain form and the Handler form are both reached on 46.2.3; the batching form
        // is the other one a build may use.
        val replacements = mapOf(
            "$MANAGER->registerListener(${LISTENER_AND_SENSOR}I)Z" to
                "$EXTENSION->interceptSensorRegistration($MANAGER${LISTENER_AND_SENSOR}I)Z",
            "$MANAGER->registerListener(${LISTENER_AND_SENSOR}ILandroid/os/Handler;)Z" to
                "$EXTENSION->interceptSensorRegistration($MANAGER${LISTENER_AND_SENSOR}ILandroid/os/Handler;)Z",
            "$MANAGER->registerListener(${LISTENER_AND_SENSOR}II)Z" to
                "$EXTENSION->interceptSensorRegistration($MANAGER${LISTENER_AND_SENSOR}II)Z",
        )
        val sites = invokeSitesOf(replacements.keys)
        if (sites.isEmpty()) {
            throw PatchException("Resource and battery governor: no SensorManager.registerListener call site was found.")
        }
        replaceSites(sites, replacements)
        println("[Resource and battery governor] Intercepted ${sites.size} sensor registration sites.")
    }
}

/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/ResourceBatteryGovernor;"
private data class SensorSite(val owner: ClassDef, val method: Method, val index: Int, val replacement: String)

@Suppress("unused")
val resourceBatteryGovernorPatch = bytecodePatch(
    name = "Resource and battery governor",
    description = "Blocks TikTok from polling device sensors for fingerprinting and throttles background buffer preloading. Reduces battery drain from motion tracking and prefetch.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val sensorTarget = "Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z"
        val sites = mutableListOf<SensorSite>()
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            owner.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = instruction.getReference<MethodReference>()?.toString() ?: return@forEachIndexed
                    if (ref != sensorTarget) return@forEachIndexed
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                    val invoke = instruction as FiveRegisterInstruction
                    sites += SensorSite(
                        owner, method, index,
                        "invoke-static { v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE}, v${invoke.registerF} }, " +
                            "$EXTENSION->interceptSensorRegistration(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z",
                    )
                }
            }
        }
        sites.forEach { site ->
            mutableClassDefBy(site.owner).findMutableMethodOf(site.method).replaceInstruction(site.index, site.replacement)
        }
        println("[Resource & battery governor] Intercepted ${sites.size} sensor registration sites.")
    }
}

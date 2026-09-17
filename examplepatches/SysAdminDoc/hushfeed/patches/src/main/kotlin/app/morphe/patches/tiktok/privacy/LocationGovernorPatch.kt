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

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/LocationGovernor;"
private data class LocationSite(val owner: ClassDef, val method: Method, val index: Int, val replacement: String)

@Suppress("unused")
val locationGovernorPatch = bytecodePatch(
    name = "Location access governor",
    description = "Blocks TikTok from reading your real GPS location. Location requests return null. Goes beyond the SIM and region spoof, which changes the locale and timezone but not the coordinates.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val targets = mapOf(
            "Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;" to
                "interceptGetLastKnownLocation(Landroid/location/LocationManager;Ljava/lang/String;)Landroid/location/Location;",
        )
        val sites = mutableListOf<LocationSite>()
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            owner.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = instruction.getReference<MethodReference>()?.toString() ?: return@forEachIndexed
                    val target = targets[ref] ?: return@forEachIndexed
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                    val invoke = instruction as FiveRegisterInstruction
                    sites += LocationSite(
                        owner, method, index,
                        "invoke-static { v${invoke.registerC}, v${invoke.registerD} }, $EXTENSION->$target",
                    )
                }
            }
        }
        sites.forEach { site ->
            mutableClassDefBy(site.owner).findMutableMethodOf(site.method).replaceInstruction(site.index, site.replacement)
        }
        println("[Location governor] Intercepted ${sites.size} location access sites.")
    }
}

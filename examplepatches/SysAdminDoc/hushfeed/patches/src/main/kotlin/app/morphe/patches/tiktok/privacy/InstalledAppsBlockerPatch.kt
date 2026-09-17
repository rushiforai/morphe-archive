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

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/InstalledAppsBlocker;"
private data class PackageSite(val owner: ClassDef, val method: Method, val index: Int, val replacement: String)

@Suppress("unused")
val installedAppsBlockerPatch = bytecodePatch(
    name = "Block installed app scanning",
    description = "Stops TikTok from reading the list of apps installed on your phone. TikTok uses this for device fingerprinting and ad targeting.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val targets = mapOf(
            "Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;" to
                "interceptGetInstalledPackages(Landroid/content/pm/PackageManager;I)Ljava/util/List;",
            "Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;" to
                "interceptGetInstalledApplications(Landroid/content/pm/PackageManager;I)Ljava/util/List;",
        )
        val sites = mutableListOf<PackageSite>()
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            owner.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = instruction.getReference<MethodReference>()?.toString() ?: return@forEachIndexed
                    val target = targets[ref] ?: return@forEachIndexed
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                    val invoke = instruction as FiveRegisterInstruction
                    sites += PackageSite(
                        owner, method, index,
                        "invoke-static { v${invoke.registerC}, v${invoke.registerD} }, $EXTENSION->$target",
                    )
                }
            }
        }
        sites.forEach { site ->
            mutableClassDefBy(site.owner).findMutableMethodOf(site.method).replaceInstruction(site.index, site.replacement)
        }
        println("[Installed apps blocker] Intercepted ${sites.size} package query sites.")
    }
}

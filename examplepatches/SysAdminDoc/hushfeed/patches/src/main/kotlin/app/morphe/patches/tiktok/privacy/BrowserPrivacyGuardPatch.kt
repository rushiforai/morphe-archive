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

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/BrowserPrivacyGuard;"
private data class JsSite(val owner: ClassDef, val method: Method, val index: Int, val replacement: String)

@Suppress("unused")
val browserPrivacyGuardPatch = bytecodePatch(
    name = "In-app browser privacy guard",
    description = "Stops TikTok from injecting JavaScript tracking interfaces into the in-app browser's WebView. Links redirected to the system browser by Open external links directly are not affected.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val jsTarget = "Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V"
        val sites = mutableListOf<JsSite>()
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            owner.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = instruction.getReference<MethodReference>()?.toString() ?: return@forEachIndexed
                    if (ref != jsTarget) return@forEachIndexed
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                    val invoke = instruction as FiveRegisterInstruction
                    sites += JsSite(
                        owner, method, index,
                        "invoke-static { v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE} }, " +
                            "$EXTENSION->filterJsInterface(Landroid/webkit/WebView;Ljava/lang/Object;Ljava/lang/String;)V",
                    )
                }
            }
        }
        sites.forEach { site ->
            mutableClassDefBy(site.owner).findMutableMethodOf(site.method).replaceInstruction(site.index, site.replacement)
        }
        println("[Browser privacy guard] Intercepted ${sites.size} WebView JS interface injection sites.")
    }
}

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

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/ContactListBlocker;"
private data class ContactSite(val owner: ClassDef, val method: Method, val index: Int, val replacement: String)

@Suppress("unused")
val contactListBlockerPatch = bytecodePatch(
    name = "Block contact list access",
    description = "Stops TikTok from reading your phone contacts. Find Friends and People you may know lose access to your contact list.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val contactTargets = setOf(
            "Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;",
        )
        val sites = mutableListOf<ContactSite>()
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            owner.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = instruction.getReference<MethodReference>()?.toString() ?: return@forEachIndexed
                    if (ref !in contactTargets) return@forEachIndexed
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                    val invoke = instruction as FiveRegisterInstruction
                    sites += ContactSite(
                        owner, method, index,
                        "invoke-static { v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE}, v${invoke.registerF}, v${invoke.registerG} }, " +
                            "$EXTENSION->interceptQuery(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;",
                    )
                }
            }
        }
        sites.forEach { site ->
            mutableClassDefBy(site.owner).findMutableMethodOf(site.method).replaceInstruction(site.index, site.replacement)
        }
        println("[Contact list blocker] Intercepted ${sites.size} ContentResolver.query sites.")
    }
}

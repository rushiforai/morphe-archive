/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.links

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SHARE_LINK_PATCH = "$EXTENSION_PACKAGE/ShareLinkPatch;"

/**
 * A framework call that is turned into a static call to the extension, which cleans the text up and then
 * makes the real call: (receiver, arguments...) become the static call's arguments unchanged.
 */
private class Redirect(
    private val owner: String,
    private val name: String,
    private val parameters: List<String>,
    private val returns: String,
    val smali: String,
) {
    fun handles(ref: MethodReference) = ref.definingClass == owner && ref.name == name &&
        ref.returnType == returns && ref.parameterTypes.map { it.toString() } == parameters
}

private val redirects = listOf(
    // Copying a post's link: the text is cleaned before it reaches the clipboard.
    Redirect(
        "Landroid/content/ClipboardManager;", "setPrimaryClip", listOf("Landroid/content/ClipData;"), "V",
        "$SHARE_LINK_PATCH->setPrimaryClip(Landroid/content/ClipboardManager;Landroid/content/ClipData;)V",
    ),
    // Sharing: LinkedIn puts the link in an Intent extra before the share sheet opens.
    Redirect(
        "Landroid/content/Intent;", "putExtra", listOf("Ljava/lang/String;", "Ljava/lang/String;"),
        "Landroid/content/Intent;",
        "$SHARE_LINK_PATCH->putExtra(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
    ),
)

@Suppress("unused")
val sanitizeShareLinksPatch = bytecodePatch(
    name = "Sanitize share links",
    description = "Strips the tracking parameters from LinkedIn links that get copied or shared.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isSanitizeShareLinksIncluded")

        // AndroidX and other libraries (Compose's clipboard, ShareCompat) make these calls on LinkedIn's
        // behalf, so every class that calls one of them is rewritten, not just LinkedIn's own classes. The
        // extension is left alone: it is the code that performs the real call.
        val extensionPrefix = "L${EXTENSION_PACKAGE.removePrefix("L")}/"
        val callers = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(extensionPrefix)) return@classDefForEach
            val redirectsHere = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref != null && redirects.any { it.handles(ref) }
                } == true
            }
            if (redirectsHere) callers += classDef
        }

        callers.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val code = method.implementation?.instructions ?: return@forEach
                // Same indexes as the call being rewritten, so the order does not matter; newest first anyway.
                code.withIndex().toList().asReversed().forEach { (index, instruction) ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    val redirect = ref?.let { r -> redirects.firstOrNull { it.handles(r) } } ?: return@forEach
                    val replacement = when (instruction.opcode) {
                        Opcode.INVOKE_VIRTUAL -> {
                            val regs = method.getInstruction<FiveRegisterInstruction>(index)
                            val arguments = listOf(regs.registerC, regs.registerD, regs.registerE, regs.registerF, regs.registerG)
                                .take(regs.registerCount)
                                .joinToString { "v$it" }
                            "invoke-static { $arguments }, ${redirect.smali}"
                        }
                        Opcode.INVOKE_VIRTUAL_RANGE -> {
                            val regs = method.getInstruction<RegisterRangeInstruction>(index)
                            "invoke-static/range { v${regs.startRegister} .. v${regs.startRegister + regs.registerCount - 1} }, " +
                                redirect.smali
                        }
                        else -> return@forEach
                    }
                    method.replaceInstruction(index, replacement)
                }
            }
        }
    }
}

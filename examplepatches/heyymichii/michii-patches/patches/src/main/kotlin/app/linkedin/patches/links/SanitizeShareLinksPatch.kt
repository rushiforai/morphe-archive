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

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/ShareLinkPatch;"

/** A framework call that is redirected to a static method of the extension with the same arguments. */
private class Redirect(
    val definingClass: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
    val extensionMethod: String,
) {
    fun matches(reference: MethodReference) =
        reference.definingClass == definingClass && reference.name == name &&
            reference.returnType == returnType && reference.parameterTypes.map { it.toString() } == parameters
}

private val redirects = listOf(
    Redirect(
        "Landroid/content/ClipboardManager;", "setPrimaryClip", listOf("Landroid/content/ClipData;"), "V",
        "$EXTENSION_CLASS->setPrimaryClip(Landroid/content/ClipboardManager;Landroid/content/ClipData;)V",
    ),
    Redirect(
        "Landroid/content/Intent;", "putExtra", listOf("Ljava/lang/String;", "Ljava/lang/String;"),
        "Landroid/content/Intent;",
        "$EXTENSION_CLASS->putExtra(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
    ),
)

@Suppress("unused")
val sanitizeShareLinksPatch = bytecodePatch(
    name = "Sanitize share links",
    description = "Removes tracking parameters from LinkedIn links when they are copied or shared.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isSanitizeShareLinksIncluded")

        // Collect every class that calls one of the redirected methods, then edit them. This includes
        // libraries (Compose clipboard, ShareCompat), since LinkedIn copies and shares through them too.
        // The extension itself is skipped: it makes the real calls.
        val targets = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("L${EXTENSION_PACKAGE.removePrefix("L")}/")) return@classDefForEach
            val calls = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference != null && redirects.any { it.matches(reference) }
                } == true
            }
            if (calls) targets += classDef
        }

        targets.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                instructions.withIndex().toList().reversed().forEach { (index, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEach
                    val redirect = redirects.firstOrNull { it.matches(reference) } ?: return@forEach
                    // Same registers as the virtual call: the receiver becomes the first static argument.
                    val call = when (instruction.opcode) {
                        Opcode.INVOKE_VIRTUAL -> {
                            val r = method.getInstruction<FiveRegisterInstruction>(index)
                            val registers = listOf(r.registerC, r.registerD, r.registerE, r.registerF, r.registerG)
                                .take(r.registerCount).joinToString { "v$it" }
                            "invoke-static { $registers }, ${redirect.extensionMethod}"
                        }
                        Opcode.INVOKE_VIRTUAL_RANGE -> {
                            val r = method.getInstruction<RegisterRangeInstruction>(index)
                            "invoke-static/range { v${r.startRegister} .. v${r.startRegister + r.registerCount - 1} }, " +
                                redirect.extensionMethod
                        }
                        else -> return@forEach
                    }
                    method.replaceInstruction(index, call)
                }
            }
        }
    }
}

package app.southstar21.patches.instagram.misc.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/signature/BypassSignatureCheckPatch;"

/**
 * The class Instagram uses to decide whether another app's signature is trusted. Only the error
 * strings survive obfuscation, and the check itself is the (app, flag) method walking the
 * trusted signatures with keySet().
 */
internal object IsTrustedSignatureFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("The provider for uri '", "' is not trusted: "),
    ),
    returnType = "Z",
    parameters = listOf("L", "Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "keySet"
        } == true
    },
)

// Ported from https://github.com/brosssh/instagram-morphe-patches-library (GPLv3).
@Suppress("unused")
val bypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Stops Instagram rejecting apps by their signature, which a patched app no longer matches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Every answer goes through the extension, which trusts this app itself and passes
        // Instagram's answer through for any other. Answering yes for every app made the system
        // share sheet look signed like Instagram, which Instagram refuses to open for sharing.
        IsTrustedSignatureFingerprint.method.apply {
            val appRegister = "p1"
            val returns = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN }
                .map { it.index }
            check(returns.isNotEmpty()) { "$name returns nothing" }
            returns.asReversed().forEach { index ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                replaceInstruction(
                    index,
                    "invoke-static { $appRegister, v$register }, $EXTENSION_CLASS->isTrusted(Ljava/lang/Object;Z)Z"
                )
                addInstructions(
                    index + 1,
                    """
                        move-result v$register
                        return v$register
                    """
                )
            }
        }
    }
}

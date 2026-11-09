package dev.aayy.bwpatches.passkey

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.aayy.bwpatches.shared.Constants.COMPATIBILITY_BITWARDEN_FDROID
import dev.aayy.bwpatches.shared.Constants.COMPATIBILITY_BITWARDEN_PLAY

private const val R_STRING_CLASS = "Lcom/bitwarden/ui/R\$string;"

/** Shown when a browser's package is allow-listed but its signing certificate doesn't match. */
private const val SIGNATURE_MISMATCH_RESOURCE =
    "passkey_operation_failed_because_browser_signature_does_not_match"

/** Shown when a browser isn't on any allow list; this is the path that offers a "trust" prompt. */
private const val NOT_PRIVILEGED_RESOURCE =
    "passkey_operation_failed_because_browser_is_not_privileged"

private fun methodKey(definingType: String, method: Method) =
    "$definingType|${method.name}|" +
        "${method.parameterTypes.joinToString(",") { it.toString() }}|${method.returnType}"

private fun fieldKey(field: FieldReference) =
    "${field.definingClass}->${field.name}:${field.type}"

/**
 * A Kotlin `object` singleton is read with `sget-object` of a field whose type is the object's own
 * class. This finds the nearest such access before [index], i.e. the error object a branch matches.
 */
private fun singletonFieldBefore(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    index: Int,
): FieldReference? {
    for (back in index - 1 downTo maxOf(0, index - 12)) {
        val instruction = instructions[back]
        if (instruction.opcode == Opcode.SGET_OBJECT && instruction is ReferenceInstruction) {
            val field = instruction.reference as? FieldReference ?: continue
            if (field.type == field.definingClass) return field
        }
    }
    return null
}

@Suppress("unused")
val trustResignedBrowserPatch = patch(
    name = "Trust re-signed browsers for passkeys",
    description = "Lets you trust a Morphe-patched (re-signed) browser for passkeys. Normally " +
        "Bitwarden hard-fails such a browser with \"signature does not match\" and offers no way " +
        "to trust it; this routes it to the standard \"trust this browser?\" prompt instead, so " +
        "you approve it once and it's remembered. Browsers whose signature already matches are " +
        "unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BITWARDEN_PLAY, COMPATIBILITY_BITWARDEN_FDROID)

    execute {
        // 1. Identify the two origin-validation error singletons by the error strings they map to.
        //    The mapping method references both kept string resources; the object matched in each
        //    branch is the nearest preceding singleton access.
        var notAllowedField: FieldReference? = null
        var signatureMismatchField: FieldReference? = null
        var mappingMethodKey: String? = null

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    if (reference !is FieldReference ||
                        reference.definingClass != R_STRING_CLASS
                    ) {
                        return@forEachIndexed
                    }
                    val singleton = when (reference.name) {
                        NOT_PRIVILEGED_RESOURCE,
                        SIGNATURE_MISMATCH_RESOURCE,
                            -> singletonFieldBefore(instructions, index) ?: return@forEachIndexed

                        else -> return@forEachIndexed
                    }
                    if (reference.name == NOT_PRIVILEGED_RESOURCE) {
                        notAllowedField = singleton
                    } else {
                        signatureMismatchField = singleton
                    }
                    mappingMethodKey = methodKey(classDef.type, method)
                }
            }
        }

        val notAllowed = notAllowedField
        val signatureMismatch = signatureMismatchField
        if (notAllowed == null || signatureMismatch == null) {
            throw PatchException(
                "Could not identify the privileged-browser validation results. Bitwarden's passkey " +
                    "origin validation may have changed; this patch needs updating.",
            )
        }
        val notAllowedDescriptor = fieldKey(notAllowed)
        val signatureMismatchKey = fieldKey(signatureMismatch)

        // 2. Everywhere the validator returns "signature mismatch" (except the message-mapping
        //    method), return "not allowed" instead, so the signature-mismatch case falls through to
        //    the user-trust list and Bitwarden's trust prompt.
        var patched = 0
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (methodKey(classDef.type, method) == mappingMethodKey) return@forEach
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val targets = instructions.withIndex()
                    .filter { (_, instruction) ->
                        instruction.opcode == Opcode.SGET_OBJECT &&
                            instruction is ReferenceInstruction &&
                            (instruction.reference as? FieldReference)
                                ?.let(::fieldKey) == signatureMismatchKey
                    }
                    .map { it.index }
                if (targets.isEmpty()) return@forEach

                val mutableMethod = mutableClassDefBy(classDef).methods.first {
                    it.name == method.name &&
                        it.parameterTypes == method.parameterTypes &&
                        it.returnType == method.returnType
                }
                targets.sortedDescending().forEach { index ->
                    val register =
                        (mutableMethod.getInstruction(index) as OneRegisterInstruction).registerA
                    mutableMethod.replaceInstruction(
                        index,
                        "sget-object v$register, $notAllowedDescriptor",
                    )
                    patched++
                }
            }
        }

        if (patched == 0) {
            throw PatchException(
                "Found the validation errors but no signature-mismatch return to reroute. This " +
                    "patch needs updating for this app version.",
            )
        }
    }
}

package dev.aayy.bwpatches.passkey

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.aayy.bwpatches.shared.Constants.COMPATIBILITY_BITWARDEN_FDROID
import dev.aayy.bwpatches.shared.Constants.COMPATIBILITY_BITWARDEN_PLAY

private const val EXTENSION_CLASS = "Ldev/aayy/bwpatches/extension/PasskeyUv;"

private const val R_STRING_CLASS = "Lcom/bitwarden/ui/R\$string;"

/**
 * Resource names shown when Bitwarden cannot verify the user during a passkey operation. They sit
 * right after the "user is verified" flag is cleared in the fallback path, which lets the patch
 * locate that flag field structurally instead of by an obfuscated name.
 */
private val UV_FAILURE_RESOURCES = setOf(
    "credential_operation_failed_because_user_could_not_be_verified",
    "passkey_operation_failed_because_user_could_not_be_verified",
)

private fun fieldKey(field: FieldReference) =
    "${field.definingClass}->${field.name}:${field.type}"

@Suppress("unused")
val noScreenLockPasskeyPatch = patch(
    name = "No screen lock passkey",
    description = "Skips the master password / PIN prompt for Bitwarden passkey sign-in and " +
        "creation on a device with no secure lock screen. Devices with a PIN, pattern, " +
        "password, or biometric lock are unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BITWARDEN_PLAY, COMPATIBILITY_BITWARDEN_FDROID)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Locate the boolean "isUserVerified" field without relying on obfuscated names.
        //    In the user-verification fallback path the app clears this field (iput-boolean false)
        //    immediately before referencing one of the UV failure string resources. The boolean
        //    instance field that shows up most often next to those references is the flag.
        val fieldAccessCounts = HashMap<String, Int>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    if (reference is FieldReference &&
                        reference.definingClass == R_STRING_CLASS &&
                        reference.name in UV_FAILURE_RESOURCES
                    ) {
                        for (back in index - 1 downTo maxOf(0, index - 8)) {
                            val previous = instructions[back]
                            if (previous.opcode == Opcode.IPUT_BOOLEAN) {
                                val flag = (previous as ReferenceInstruction).reference
                                if (flag is FieldReference) {
                                    fieldAccessCounts.merge(fieldKey(flag), 1, Int::plus)
                                }
                                break
                            }
                        }
                    }
                }
            }
        }

        val targetFieldKey = fieldAccessCounts.maxByOrNull { it.value }?.key
            ?: throw PatchException(
                "Could not locate the passkey user-verification flag. Bitwarden's obfuscated " +
                    "layout may have changed; the patch needs updating.",
            )

        // 2. At every read of that flag, treat the user as verified when the device has no secure
        //    lock. "if-nez" leaves the value untouched when it is already true, so devices with a
        //    lock keep the original behavior and only the no-lock fallback is short-circuited.
        var patchedReads = 0
        classDefForEach { classDef ->
            val readIndices = classDef.methods.map { method ->
                val instructions = method.implementation?.instructions?.toList()
                method to (
                    instructions
                        ?.withIndex()
                        ?.filter { (_, instruction) ->
                            instruction.opcode == Opcode.IGET_BOOLEAN &&
                                instruction is ReferenceInstruction &&
                                (instruction.reference as? FieldReference)
                                    ?.let(::fieldKey) == targetFieldKey
                        }
                        ?.map { it.index }
                        ?: emptyList()
                    )
            }.filter { it.second.isNotEmpty() }

            if (readIndices.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            readIndices.forEach { (method, indices) ->
                val mutableMethod = mutableClass.methods.first {
                    it.name == method.name &&
                        it.parameterTypes == method.parameterTypes &&
                        it.returnType == method.returnType
                }
                // Inject back-to-front so earlier indices stay valid.
                indices.sortedDescending().forEach { index ->
                    val register =
                        (mutableMethod.getInstruction(index) as TwoRegisterInstruction).registerA
                    val continuation = mutableMethod.getInstruction(index + 1)
                    mutableMethod.addInstructionsWithLabels(
                        index + 1,
                        """
                            if-nez v$register, :bw_keep_verification
                            invoke-static {}, $EXTENSION_CLASS->noSecureLock()Z
                            move-result v$register
                        """,
                        ExternalLabel("bw_keep_verification", continuation),
                    )
                    patchedReads++
                }
            }
        }

        if (patchedReads == 0) {
            throw PatchException(
                "Found the passkey user-verification flag but no reads to patch. The patch needs " +
                    "updating for this app version.",
            )
        }
    }
}

package app.bigyank.patches.shealth

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.util.MethodUtil

internal const val SAMSUNG_ACCOUNT_PACKAGE = "com.osp.app.signin"
internal const val DUMMY_ACCOUNT_PACKAGE = "com.notsamsung.dummy"

/** Device account type — used only in the AccountManager stub, not the dummy workaround strings. */
internal const val DEVICE_SAMSUNG_ACCOUNT_TYPE = "com.osp.app.signin"

private fun String.replaceSigninPackage(): String =
    replace(SAMSUNG_ACCOUNT_PACKAGE, DUMMY_ACCOUNT_PACKAGE)

private fun isStringConstantOpcode(opcode: Opcode): Boolean =
    opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO

private data class StringReplacement(
    val index: Int,
    val register: Int,
    val opcode: Opcode,
    val value: String,
)

/**
 * Replaces every `com.osp.app.signin` occurrence in dex (const-strings, field defaults,
 * and prefixed strings such as `com.osp.app.signin:action`).
 */
internal fun BytecodePatchContext.replaceSigninPackageInDex() {
    classDefForEach { classDef ->
        val methodReplacements = classDef.methods.mapNotNull { method ->
            val implementation = method.implementation ?: return@mapNotNull null
            val replacements = buildList {
                implementation.instructions.forEachIndexed { index, instruction ->
                    if (!isStringConstantOpcode(instruction.opcode)) return@forEachIndexed
                    val string = ((instruction as ReferenceInstruction).reference as? StringReference)?.string
                        ?: return@forEachIndexed
                    if (SAMSUNG_ACCOUNT_PACKAGE !in string) return@forEachIndexed
                    add(
                        StringReplacement(
                            index = index,
                            register = (instruction as OneRegisterInstruction).registerA,
                            opcode = instruction.opcode,
                            value = string.replaceSigninPackage(),
                        ),
                    )
                }
            }
            if (replacements.isEmpty()) null else method to replacements
        }

        val fieldReplacements = classDef.fields.mapNotNull { field ->
            val initial = field.initialValue as? StringEncodedValue ?: return@mapNotNull null
            if (SAMSUNG_ACCOUNT_PACKAGE !in initial.value) return@mapNotNull null
            field to initial.value.replaceSigninPackage()
        }

        if (methodReplacements.isEmpty() && fieldReplacements.isEmpty()) return@classDefForEach

        val mutableClass = mutableClassDefBy(classDef)

        methodReplacements.forEach { (method, replacements) ->
            val mutableMethod = mutableClass.methods.firstOrNull { candidate ->
                MethodUtil.methodSignaturesMatch(candidate, method)
            } ?: throw PatchException(
                "Signin package replace: method ${method.name} missing from mutable ${classDef.type}",
            )
            replacements.sortedByDescending { it.index }.forEach { replacement ->
                mutableMethod.replaceInstruction(
                    replacement.index,
                    BuilderInstruction21c(
                        replacement.opcode,
                        replacement.register,
                        ImmutableStringReference(replacement.value),
                    ),
                )
            }
        }

        fieldReplacements.forEach { (field, newValue) ->
            val mutableField = mutableClass.fields.firstOrNull { candidate ->
                candidate.name == field.name && candidate.type == field.type
            } ?: throw PatchException(
                "Signin package replace: field ${field.name} missing from mutable ${classDef.type}",
            )
            val encoded = mutableField.getInitialValue() as? MutableStringEncodedValue
                ?: throw PatchException(
                    "Signin package replace: field ${classDef.type}->${field.name} has no mutable string initial value",
                )
            encoded.setValue(newValue)
        }
    }
}

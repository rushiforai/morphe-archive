package app.morphe.patches.util.transformation

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findInstructionIndicesReversed
import app.morphe.util.fiveRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method

/**
 * An invoke-virtual call that is redirected to a static method in the extension class.
 *
 * The extension method must have the same name and return type as the original method, and take
 * the receiver as its first parameter followed by the original parameters.
 */
interface InvocationReplacement {
    val definedClassName: String
    val methodName: String
    val methodParams: Array<String>
    val returnType: String
}

private fun InvocationReplacement.extensionMethodDescriptor() =
    "$methodName($definedClassName${methodParams.joinToString("")})$returnType"

private fun InvocationReplacement.toFilter() = methodCall(
    opcode = Opcode.INVOKE_VIRTUAL,
    definingClass = definedClassName,
    name = methodName,
    parameters = methodParams.toList(),
    returnType = returnType,
)

/**
 * Finds the indices of all calls to [replacement] in reverse order, so replacing them does not
 * invalidate the remaining indices.
 */
fun Method.findInvokeVirtualIndices(replacement: InvocationReplacement): List<Int> =
    findInstructionIndicesReversed(replacement.toFilter())

/**
 * Replaces every call to [replacement] with a static call to the equivalent extension method.
 */
fun MutableMethod.replaceInvokeVirtualWithExtension(
    extensionClassDescriptor: String,
    replacement: InvocationReplacement,
    indices: List<Int> = findInvokeVirtualIndices(replacement),
) {
    indices.forEach { index ->
        replaceInstruction(
            index,
            "invoke-static { ${fiveRegisters(index)} }, " +
                "$extensionClassDescriptor->${replacement.extensionMethodDescriptor()}",
        )
    }
}

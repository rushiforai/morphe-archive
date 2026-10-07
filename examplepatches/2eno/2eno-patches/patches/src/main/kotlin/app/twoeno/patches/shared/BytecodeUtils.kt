package app.twoeno.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.p0Register
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * @return The register holding the parameter at [index], not counting `this`.
 */
internal fun Method.parameterRegister(index: Int): Int {
    var register = p0Register + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    for (i in 0 until index) {
        register += when (parameterTypes[i].toString()) {
            "J", "D" -> 2
            else -> 1
        }
    }
    return register
}

/**
 * Passes every returned object through a static extension method `(Ljava/lang/Object;)Ljava/lang/Object;`
 * or a method with a more specific signature, and returns its result instead.
 *
 * @param extensionMethod Full method descriptor, for example `Lapp/Ext;->filter(Ljava/util/List;)Ljava/util/List;`.
 */
internal fun MutableMethod.replaceReturnedObjects(extensionMethod: String) {
    val castType = returnType.takeIf { !extensionMethod.endsWith(")$it") }
    forEachReturn(Opcode.RETURN_OBJECT) { register ->
        """
            invoke-static/range { v$register .. v$register }, $extensionMethod
            move-result-object v$register
        """ + (castType?.let { "\ncheck-cast v$register, $it" } ?: "")
    }
}

/**
 * Passes every returned object to a static extension method returning `V`.
 * The method can modify the object, but not replace it.
 */
internal fun MutableMethod.inspectReturnedObjects(extensionMethod: String) {
    forEachReturn(Opcode.RETURN_OBJECT) { register ->
        "invoke-static/range { v$register .. v$register }, $extensionMethod"
    }
}

private fun MutableMethod.forEachReturn(opcode: Opcode, smali: (register: Int) -> String) {
    val returnIndices = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == opcode }
        .map { (index, _) -> index }
        .reversed()
    if (returnIndices.isEmpty()) throw PatchException("No $opcode instruction found in $this")

    returnIndices.forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(index, smali(register))
    }
}

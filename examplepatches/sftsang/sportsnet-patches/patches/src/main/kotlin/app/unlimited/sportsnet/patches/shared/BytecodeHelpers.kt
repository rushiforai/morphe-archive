package app.unlimited.sportsnet.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Makes methods of [classType] return at once. With no [names], every method returning void
 * (other than constructors) is emptied; otherwise only the void methods with those names.
 */
internal fun emptyVoidMethods(classType: String, vararg names: String) {
    val mutableClass = mutableClassDefByOrNull(classType)
        ?: throw PatchException("Class not found: $classType")
    val methods = mutableClass.methods.filter { method ->
        method.returnType == "V" &&
            method.implementation != null &&
            !method.name.startsWith("<") &&
            (names.isEmpty() || method.name in names)
    }
    if (methods.isEmpty() || (names.isNotEmpty() && methods.map { it.name }.toSet() != names.toSet())) {
        throw PatchException("Expected methods not found in $classType: ${names.joinToString()}")
    }
    methods.forEach { it.returnEarly() }
}

/** Makes the extension's settings method [name] in [extensionClass] return [value]. */
internal fun setExtensionValue(extensionClass: String, name: String, value: String) {
    val method = mutableClassDefBy(extensionClass).methods.firstOrNull { it.name == name }
        ?: throw PatchException("Extension method not found: $extensionClass->$name")
    method.returnEarly(value)
}

/**
 * Passes the list a getter returns through the static [filter] method, which takes and returns
 * a [java.util.List], right before the getter returns it.
 */
internal fun filterReturnedList(method: MutableMethod, filter: String) {
    method.instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { it.index }
        .reversed()
        .forEach { index ->
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            // At the return's label, so that branches to the return also pass through the filter.
            method.addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static {v$register}, $filter
                    move-result-object v$register
                    check-cast v$register, Ljava/util/List;
                """
            )
        }
}

package app.southstar21.patches.instagram.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Passes every object this method returns through [hook], a static `(Object)Object` style
 * extension method, and returns its result instead.
 *
 * Each `return-object` is replaced in place rather than having code inserted before it, so
 * branches that jump straight to the return still go through the hook.
 *
 * @param castType type to cast the hook's result back to, if the method returns something
 *                 more specific than the hook does.
 */
internal fun MutableMethod.hookReturnedObjects(hook: String, castType: String? = null) {
    val returns = instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index }
    check(returns.isNotEmpty()) { "$name returns no object" }

    returns.asReversed().forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        replaceInstruction(index, "invoke-static/range { v$register .. v$register }, $hook")
        addInstructions(
            index + 1,
            """
                move-result-object v$register
                ${if (castType != null) "check-cast v$register, $castType" else ""}
                return-object v$register
            """
        )
    }
}

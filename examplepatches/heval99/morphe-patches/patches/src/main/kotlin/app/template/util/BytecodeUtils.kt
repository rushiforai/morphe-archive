package app.template.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val RETURN_TYPE_MISMATCH = "Mismatch between override type and Method return type"

/**
 * Overrides the first instruction of a method that returns a boxed `Boolean`
 * (`Ljava/lang/Boolean;`) with a constant boxed `Boolean` return value.
 * None of the method code will ever execute.
 *
 * @param force Skip the return type check. Needed for methods with an obfuscated
 *              return type that is not resolved to `Ljava/lang/Boolean;` normally.
 */
fun MutableMethod.returnBoxedBooleanEarly(value: Boolean, force: Boolean = false) {
    if (!force)
        check(returnType == "Ljava/lang/Boolean;") { RETURN_TYPE_MISMATCH }
    addInstructions(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->${if (value) "TRUE" else "FALSE"}:Ljava/lang/Boolean;
            return-object v0
        """.trimIndent(),
    )
}

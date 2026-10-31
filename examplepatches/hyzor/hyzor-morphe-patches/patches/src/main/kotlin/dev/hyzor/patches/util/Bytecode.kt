package dev.hyzor.patches.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Replace the body of a boolean getter with `return value`.
 *
 * Emitted at index 0, so the original body stays behind the `return` and is simply
 * never reached. `const/4 v0` is valid even on a getter that declares no local
 * registers (`registers_size == ins_size`): register 0 is then `this`, which is
 * harmless to clobber because we return immediately.
 *
 * @throws IllegalArgumentException if the method does not return `Z`.
 */
fun MutableMethod.returnEarly(value: Boolean) {
    require(returnType == "Z") {
        "returnEarly(Boolean) requires a Z return type, was $returnType on $name"
    }

    addInstructions(
        0,
        """
            const/4 v0, ${if (value) "0x1" else "0x0"}
            return v0
        """.trimIndent(),
    )
}

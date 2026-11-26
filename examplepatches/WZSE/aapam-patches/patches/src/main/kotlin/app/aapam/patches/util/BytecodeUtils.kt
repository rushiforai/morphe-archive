package app.aapam.patches.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val RETURN_TYPE_MISMATCH = "Target method return type does not match"

/**
 * Overrides the first instruction of a method with a void return.
 * None of the original method code will execute.
 */
fun MutableMethod.returnEarly() {
    check(returnType.first() == 'V') { RETURN_TYPE_MISMATCH }
    overrideReturnValue("0x0", false)
}

/**
 * Overrides the first instruction of a method with a constant `Boolean` return value.
 * None of the original method code will execute.
 */
fun MutableMethod.returnEarly(value: Boolean) {
    check(returnType.first() == 'Z') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(if (value) "0x1" else "0x0", false)
}

/**
 * Overrides the first instruction of a method with a constant `Int` return value.
 * None of the original method code will execute.
 */
fun MutableMethod.returnEarly(value: Int) {
    check(returnType.first() == 'I') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant String return value.
 * None of the original method code will execute.
 */
fun MutableMethod.returnEarly(value: String) {
    check(returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;") {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(value, false)
}

/**
 * Overrides the first instruction of a method with a constant `null` return value.
 * None of the original method code will execute.
 */
fun MutableMethod.returnEarly(value: Void?) {
    val r = returnType.first()
    check(r == 'L' || r == '[') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(null, false)
}

private fun MutableMethod.overrideReturnValue(value: String?, returnLate: Boolean) {
    val instructions = if (value != null && (returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;")) {
        """
            const-string v0, "$value"
            return-object v0
        """
    } else when (returnType.first()) {
        'L', '[' -> {
            """
                const/4 v0, 0x0
                return-object v0
            """
        }
        'V' -> "return-void"
        'B', 'Z' -> {
            """
                const/4 v0, $value
                return v0
            """
        }
        'S', 'C' -> {
            """
                const/16 v0, $value
                return v0
            """
        }
        'I', 'F' -> {
            """
                const v0, $value
                return v0
            """
        }
        'J', 'D' -> {
            """
                const-wide v0, $value
                return-wide v0
            """
        }
        else -> error("Return type is not supported: $this")
    }

    if (!returnLate) {
        addInstructions(0, instructions)
    }
}

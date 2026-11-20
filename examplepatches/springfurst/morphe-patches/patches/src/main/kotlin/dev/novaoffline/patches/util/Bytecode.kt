package dev.novaoffline.patches.util

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

/** Replace the body of a void method with an immediate return. */
fun MutableMethod.returnVoid() {
    require(returnType == "V") {
        "returnVoid requires a V return type, was $returnType on $name"
    }
    addInstructions(0, "return-void")
}

/** Replace the body of an object-returning method with `return null`. */
fun MutableMethod.returnNull() {
    require(returnType.startsWith("L")) {
        "returnNull requires an object return type, was $returnType on $name"
    }
    // v0 is zero-initialised on entry, so returning it returns null.
    addInstructions(0, "return-object v0")
}

/**
 * Replace the body of an object-returning method with `return Boolean.FALSE`.
 *
 * Used for Kotlin `suspend` functions, whose bytecode return type is `Ljava/lang/Object;`
 * (the coroutine state machine) even when the Kotlin signature returns `Boolean`.
 */
fun MutableMethod.returnFalseObject() {
    require(returnType.startsWith("L")) {
        "returnFalseObject requires an object return type, was $returnType on $name"
    }
    addInstructions(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
        """.trimIndent(),
    )
}

package app.aidan.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode

/**
 * Makes all implemented void overloads with the requested names return immediately.
 * Absent classes and unmatched names are allowed.
 */
fun BytecodePatchContext.disableOptionalVoidMethods(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    val methodSet = methodNames.toSet()

    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            if (method.implementation!!.instructions.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
                method.addInstructions(0, "return-void")
            }
        }
    }
}

/**
 * Makes all implemented void overloads with the requested names return immediately.
 * The class and at least one matching method are required.
 */
fun BytecodePatchContext.disableRequiredVoidMethods(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Required policy failed: missing class $classDescriptor for void method(s) ${methodNames.joinToString()}")
    val methodSet = methodNames.toSet()
    var matched = false

    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            matched = true
            if (method.implementation!!.instructions.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
                method.addInstructions(0, "return-void")
            }
        }
    }

    if (!matched) {
        throw PatchException("Required policy failed: missing implemented void method(s) ${methodNames.joinToString()} in $classDescriptor")
    }
}

/**
 * Makes all implemented void overloads with the requested names return immediately.
 * The class and every requested method name are required.
 */
fun BytecodePatchContext.disableRequiredVoidMethodsByName(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Required policy failed: missing class $classDescriptor for void method(s) ${methodNames.joinToString()}")
    val methodSet = methodNames.toSet()
    val matchedNames = mutableSetOf<String>()

    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            matchedNames += method.name
            if (method.implementation!!.instructions.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
                method.addInstructions(0, "return-void")
            }
        }
    }

    val missingNames = methodSet - matchedNames
    if (missingNames.isNotEmpty()) {
        throw PatchException("Required policy failed: missing implemented void method(s) ${missingNames.joinToString()} in $classDescriptor")
    }
}

/** Makes all implemented boolean overloads with [methodName] return [value]. */
fun BytecodePatchContext.returnOptionalBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean
) {
    returnBoolean(classDescriptor, methodName, value, required = false)
}

/** Makes all implemented boolean overloads with [methodName] return [value]. */
fun BytecodePatchContext.returnRequiredBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean
) {
    returnBoolean(classDescriptor, methodName, value, required = true)
}

/** Makes all implemented class-returning overloads with [methodName] return null. */
fun BytecodePatchContext.returnOptionalNullObject(classDescriptor: String, methodName: String) {
    returnNullObject(classDescriptor, methodName, required = false)
}

/** Makes all implemented class-returning overloads with [methodName] return null. */
fun BytecodePatchContext.returnRequiredNullObject(classDescriptor: String, methodName: String) {
    returnNullObject(classDescriptor, methodName, required = true)
}

/** Makes all implemented String-returning overloads with [methodName] return [value]. */
fun BytecodePatchContext.returnOptionalString(
    classDescriptor: String,
    methodName: String,
    value: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "Ljava/lang/String;" && method.implementation != null) {
            method.addInstructions(0, "const-string v0, \"${value.escapeSmaliString()}\"\nreturn-object v0")
        }
    }
}

/** Makes all implemented object-returning overloads with [methodNames] return kotlin.Unit.INSTANCE. */
fun BytecodePatchContext.returnOptionalUnit(
    classDescriptor: String,
    vararg methodNames: String
) {
    returnUnit(classDescriptor, methodNames.toList(), required = false)
}

/** Makes all implemented object-returning overloads with [methodNames] return kotlin.Unit.INSTANCE. */
fun BytecodePatchContext.returnRequiredUnit(
    classDescriptor: String,
    vararg methodNames: String
) {
    returnUnit(classDescriptor, methodNames.toList(), required = true)
}

/** Returns true if this boolean option is explicitly enabled or defaulted to true. */
val Option<Boolean>.isEnabled: Boolean
    get() = (value ?: default) == true

private fun BytecodePatchContext.returnBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean,
    required: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
    if (mutableClass == null) {
        if (!required) return
        throw PatchException("Required policy failed: missing class $classDescriptor for boolean method $methodName")
    }
    val constInstruction = if (value) "const/4 v0, 0x1" else "const/4 v0, 0x0"
    var matched = false

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "Z" && method.implementation != null) {
            method.addInstructions(0, "$constInstruction\nreturn v0")
            matched = true
        }
    }

    if (required && !matched) {
        throw PatchException("Required policy failed: missing implemented boolean method $methodName in $classDescriptor")
    }
}

private fun BytecodePatchContext.returnNullObject(
    classDescriptor: String,
    methodName: String,
    required: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
    if (mutableClass == null) {
        if (!required) return
        throw PatchException("Required policy failed: missing class $classDescriptor for object method $methodName")
    }
    var matched = false

    for (method in mutableClass.methods) {
        if (method.name == methodName && (method.returnType.startsWith("L") || method.returnType.startsWith("[")) && method.implementation != null) {
            method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
            matched = true
        }
    }

    if (required && !matched) {
        throw PatchException("Required policy failed: missing implemented object method $methodName in $classDescriptor")
    }
}

private fun BytecodePatchContext.returnUnit(
    classDescriptor: String,
    methodNames: List<String>,
    required: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
    if (mutableClass == null) {
        if (!required) return
        throw PatchException("Required policy failed: missing class $classDescriptor for unit method")
    }
    var matched = false

    for (method in mutableClass.methods) {
        if (method.name in methodNames && method.returnType.startsWith("L") && method.implementation != null) {
            method.addInstructions(
                0,
                """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
                """.trimIndent()
            )
            matched = true
        }
    }

    if (required && !matched) {
        throw PatchException("Required policy failed: missing implemented unit method in $classDescriptor")
    }
}

private fun String.escapeSmaliString() = buildString(length) {
    for (character in this@escapeSmaliString) {
        when (character) {
            '\\' -> append("\\\\")
            '\"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> append(character)
        }
    }
}

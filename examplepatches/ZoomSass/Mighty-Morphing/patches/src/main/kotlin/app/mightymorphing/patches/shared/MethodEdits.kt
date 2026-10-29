package app.mightymorphing.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.util.MethodUtil

private fun MutableMethod.where(): String = "$definingClass->$name"

private fun Any.declaredFieldsDeep(): List<java.lang.reflect.Field> = buildList {
    var type: Class<*>? = javaClass
    while (type != null && type != Any::class.java) {
        addAll(type.declaredFields)
        type = type.superclass
    }
}

/** Older Morphe builds still expose this field by name. 2.0 does not. */
private fun MutableMethodImplementation.tryRaiseRegisterCount(count: Int): Boolean {
    if (registerCount >= count) return true
    val field = declaredFieldsDeep().firstOrNull { candidate ->
        candidate.name == "registerCount" &&
            !java.lang.reflect.Modifier.isStatic(candidate.modifiers)
    } ?: return false
    return runCatching {
        field.isAccessible = true
        runCatching {
            val modifiers = java.lang.reflect.Field::class.java.getDeclaredField("modifiers")
            modifiers.isAccessible = true
            modifiers.setInt(field, field.modifiers and java.lang.reflect.Modifier.FINAL.inv())
        }
        field.setInt(this, count)
        registerCount == count
    }.getOrDefault(false)
}

/**
 * Stable Morphe keeps try blocks in an ArrayList named tryBlocks.
 * 2.0 renames that field. Returns false when the blocks are still there,
 * so the caller can rebuild the method instead of editing the old list.
 */
private fun MutableMethodImplementation.tryClearTryBlocks(): Boolean {
    if (tryBlocks.isEmpty()) return true
    val field = declaredFieldsDeep().firstOrNull { candidate ->
        candidate.name == "tryBlocks" &&
            !java.lang.reflect.Modifier.isStatic(candidate.modifiers) &&
            java.util.ArrayList::class.java.isAssignableFrom(candidate.type)
    } ?: return false
    return runCatching {
        field.isAccessible = true
        val blocks = field.get(this) as? java.util.ArrayList<*> ?: return false
        blocks.clear()
        tryBlocks.isEmpty()
    }.getOrDefault(false)
}

fun MutableMethod.clearBody() {
    val impl = implementation ?: throw PatchException("${where()} has no body")
    if (!impl.tryClearTryBlocks()) {
        throw PatchException("${where()} try blocks cannot be cleared")
    }
    val count = impl.instructions.size
    if (count > 0) {
        removeInstructions(count)
    }
}

/**
 * Replace a method body. [registerCount] is the total register count, including parameters.
 * Set it before the new body is compiled so `p` registers land on the right slots.
 */
fun MutableMethod.setBody(registerCount: Int, smali: String) {
    val impl = implementation ?: throw PatchException("${where()} has no body")
    if (impl.registerCount < registerCount && !impl.tryRaiseRegisterCount(registerCount)) {
        throw PatchException("${where()} needs $registerCount registers")
    }
    clearBody()
    addInstructionsWithLabels(0, smali.trimIndent())
}

private fun MutableMethod.sameSignature(other: MutableMethod): Boolean =
    name == other.name && parameterTypes.toList() == other.parameterTypes.toList()

/**
 * Replace a method body on any Morphe release.
 * Stable releases can edit the method in place. 2.0 hides the register count and
 * the try-block list, so the method is rebuilt and swapped onto the class.
 */
fun BytecodePatchContext.writeBody(method: MutableMethod, registerCount: Int, smali: String) {
    val text = smali.trimIndent()
    val impl = method.implementation ?: throw PatchException("${method.definingClass}->${method.name} has no body")
    val fits = impl.registerCount >= registerCount || impl.tryRaiseRegisterCount(registerCount)
    if (fits && impl.tryClearTryBlocks()) {
        val count = impl.instructions.size
        if (count > 0) {
            method.removeInstructions(count)
        }
        method.addInstructionsWithLabels(0, text)
        return
    }
    val replacement = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameters,
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        MutableMethodImplementation(registerCount),
    ).toMutable()
    replacement.addInstructionsWithLabels(0, text)
    val clazz = mutableClassDefBy(method.definingClass)
    fun MutableSet<MutableMethod>.swap() {
        removeAll { it.sameSignature(method) }
        add(replacement)
    }
    clazz.methods.swap()
    if (MethodUtil.isDirect(method)) {
        clazz.directMethods.swap()
    } else {
        clazz.virtualMethods.swap()
    }
}

fun BytecodePatchContext.returnVoid(method: MutableMethod) {
    val registers = maxOf(method.implementation?.registerCount ?: 1, 1)
    writeBody(method, registers, "return-void")
}

fun BytecodePatchContext.returnBoolean(method: MutableMethod, value: Boolean) {
    val registers = maxOf(method.implementation?.registerCount ?: 1, 1)
    val bit = if (value) "0x1" else "0x0"
    writeBody(
        method,
        registers,
        """
        const/4 v0, $bit
        return v0
        """,
    )
}

fun MutableMethod.indexOfReference(snippet: String): Int {
    val index = instructions.indexOfFirst { instruction ->
        instruction is ReferenceInstruction && instruction.reference.toString().contains(snippet)
    }
    if (index < 0) {
        throw PatchException("${where()} has no instruction containing $snippet")
    }
    return index
}

fun MutableMethod.indexOfString(value: String): Int {
    val index = instructions.indexOfFirst { instruction ->
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            instruction is ReferenceInstruction &&
            instruction.reference.toString().contains(value)
    }
    if (index < 0) {
        throw PatchException("${where()} has no string $value")
    }
    return index
}

fun MutableMethod.insertAt(index: Int, smali: String, vararg labels: ExternalLabel) {
    addInstructionsWithLabels(index, smali.trimIndent(), *labels)
}

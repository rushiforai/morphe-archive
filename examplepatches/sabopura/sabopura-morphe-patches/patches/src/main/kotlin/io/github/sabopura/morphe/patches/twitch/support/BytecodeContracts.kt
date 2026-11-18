package io.github.sabopura.morphe.patches.twitch.support

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*

internal fun Instruction.callRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

internal fun <T> Iterable<T>.uniqueContract(label: String): T {
    val found = toList()
    return found.singleOrNull() ?: throw PatchException("Twitch: $label: expected 1 match, found ${found.size}; input layout changed")
}

internal fun BytecodePatchContext.classesWithStrings(vararg anchors: String): List<ClassDef> {
    require(anchors.isNotEmpty())
    val candidates = classDefByStrings(anchors.first())
    val otherTypes = anchors.drop(1).map { text -> classDefByStrings(text).map { it.type }.toSet() }
    return candidates.filter { c -> otherTypes.all { c.type in it } }
}

/** R8 may erase Kotlin parameter-check strings. Resolve behavior against anchored model types. */
internal fun BytecodePatchContext.classesMatching(predicate: (ClassDef) -> Boolean): List<ClassDef> {
    val matches = mutableListOf<ClassDef>()
    classDefForEach { if (predicate(it)) matches += it }
    return matches
}

/** The enum constant, such as GOTO_16; Kotlin's `opcode.name` is dexlib2's smali spelling (goto/16). */
private val Opcode.constant: String get() = (this as Enum<*>).name

private fun Instruction.reads(register: Int): Boolean {
    val written = if (this is ThreeRegisterInstruction || this is TwoRegisterInstruction || this is OneRegisterInstruction) {
        (this as OneRegisterInstruction).registerA
    } else -1
    // Over-approximates: an int operand of a LONG or DOUBLE opcode also counts its next register.
    val wide = listOf("WIDE", "LONG", "DOUBLE").any { it in opcode.constant }
    val used = when (this) {
        is FiveRegisterInstruction, is RegisterRangeInstruction -> callRegisters()
        is ThreeRegisterInstruction -> listOf(registerB, registerC)
        is TwoRegisterInstruction -> listOf(registerB)
        else -> emptyList()
    }
    if (register in used || wide && (register - 1) in used) return true
    if (written != register && !(wide && written + 1 == register)) return false
    return !opcode.setsRegister() || opcode == Opcode.CHECK_CAST || opcode.constant.endsWith("_2ADDR")
}

private fun Instruction.writes(register: Int): Boolean =
    opcode.setsRegister() && this is OneRegisterInstruction &&
        (registerA == register || opcode.setsWideRegister() && registerA + 1 == register)

/** The lowest local register (never a parameter) that no path from instruction [index] reads again, or null. */
internal fun freeLocalAt(method: Method, index: Int): Int? {
    val implementation = method.implementation ?: return null
    val parameters = method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    return (0 until minOf(implementation.registerCount - parameters, 256)).firstOrNull { registerDeadAt(method, index, it) }
}

/**
 * True when nothing reads [register] again on any path from instruction [from], following
 * branches, switches and exception handlers, so a hook there may overwrite it.
 */
internal fun registerDeadAt(method: Method, from: Int, register: Int): Boolean {
    val implementation = method.implementation ?: return false
    val code = implementation.instructions.toList()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val indexAt = addresses.dropLast(1).withIndex().associate { (index, address) -> address to index }
    val seen = HashSet<Int>()
    val pending = ArrayDeque(listOf(from))
    while (pending.isNotEmpty()) {
        val index = pending.removeLast()
        val instruction = code.getOrNull(index) ?: continue
        if (!seen.add(index)) continue
        if (instruction.reads(register)) return false
        implementation.tryBlocks.filter {
            addresses[index] in it.startCodeAddress until it.startCodeAddress + it.codeUnitCount
        }.flatMap { it.exceptionHandlers }.forEach { indexAt[it.handlerCodeAddress]?.let(pending::addLast) }
        if (instruction.writes(register)) continue
        val name = instruction.opcode.constant
        when {
            name.startsWith("RETURN") || instruction.opcode == Opcode.THROW -> Unit
            name.startsWith("GOTO") -> indexAt[addresses[index] + (instruction as OffsetInstruction).codeOffset]?.let(pending::addLast)
            instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH -> {
                val payload = code[indexAt.getValue(addresses[index] + (instruction as OffsetInstruction).codeOffset)] as SwitchPayload
                payload.switchElements.forEach { indexAt[addresses[index] + it.offset]?.let(pending::addLast) }
                pending.addLast(index + 1)
            }
            instruction is OffsetInstruction -> {
                indexAt[addresses[index] + instruction.codeOffset]?.let(pending::addLast)
                pending.addLast(index + 1)
            }
            else -> pending.addLast(index + 1)
        }
    }
    return true
}

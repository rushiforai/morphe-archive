/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.facebook.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.RegisterLiveness
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.BitSet

/** The package of the Facebook extension, as a smali descriptor prefix. */
internal const val EXTENSION_PACKAGE = "Lapp/morphe/extension/facebook"

/** Which patches this build carries. See the class's own comment. */
internal const val SETTINGS_STATUS = "$EXTENSION_PACKAGE/settings/SettingsStatus;"

/**
 * Rewrites `SettingsStatus.[name]()` to answer true, so the extension acts for this patch and the
 * settings screen shows its switch. Call it from the feature patch's execute block; the patch must
 * depend on the Facebook extension patch, which is what merges `SettingsStatus` into the APK.
 */
internal fun BytecodePatchContext.enableStatus(name: String) {
    val method = statusMethod(name)
    method.returnEarly(true)
}

/**
 * Throws naming [name] unless `SettingsStatus` has a boolean method of that name, the same check
 * [enableStatus] makes. A patch whose own find phase changes bytecode before it calls [enableStatus]
 * should call this first, so a missing method refuses before anything is mutated rather than after,
 * through [enableStatus], once the patch's own hooks are already in.
 */
internal fun BytecodePatchContext.requireStatusMethod(name: String) {
    statusMethod(name)
}

private fun BytecodePatchContext.statusMethod(name: String): MutableMethod =
    mutableClassDefBy(SETTINGS_STATUS).methods.singleOrNull {
        it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty()
    } ?: throw PatchException("SettingsStatus has no boolean method $name()")

/** How many registers a parameter of this type takes: two for a long or a double. */
private fun CharSequence.width(): Int = if (toString() == "J" || toString() == "D") 2 else 1

/**
 * The `p` register holding declared parameter [index], counting `this` on an instance method and
 * two registers for each wide parameter before it.
 */
internal fun Method.parameterRegister(index: Int): String {
    require(index in parameterTypes.indices) { "$definingClass->$name has no parameter $index" }
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return "p" + (self + parameterTypes.take(index).sumOf { it.width() })
}

/** The `v` number of the register holding declared parameter [index]: [parameterRegister] past the locals. */
internal fun Method.parameterRegisterNumber(index: Int): Int =
    localRegisterCount() + parameterRegister(index).removePrefix("p").toInt()

/**
 * Throws naming [what] unless declared parameter [parameterIndex] is still in its own register at
 * each instruction of [readAt], where a hook reads it. Facebook's code reuses a parameter's
 * register once it's done with the parameter, `this` included, so a hook reading one further down
 * could get whatever went there instead, and would still verify when that's an object too. Any
 * write to the register from which one of [readAt] can be reached, along a branch, a switch or an
 * exception handler, is refused.
 */
internal fun Method.requireParameterIntact(what: String, parameterIndex: Int, readAt: Collection<Int>) {
    val register = parameterRegisterNumber(parameterIndex)
    val registers = if (parameterTypes[parameterIndex].width() == 2) setOf(register, register + 1) else setOf(register)
    requireEntryValueAt(what, "parameter $parameterIndex (v$register)", registers, readAt)
}

/** [requireParameterIntact] for `this`, which an instance method keeps in the register past its locals. */
internal fun Method.requireThisIntact(what: String, readAt: Collection<Int>) {
    if (AccessFlags.STATIC.isSet(accessFlags)) {
        throw PatchException("$what: $definingClass->$name is static, so it has no this for the hook to read")
    }
    val register = localRegisterCount()
    requireEntryValueAt(what, "this (v$register)", setOf(register), readAt)
}

/** Throws unless nothing that can run before one of [readAt] writes any of [registers], which hold [held] on entry. */
private fun Method.requireEntryValueAt(what: String, held: String, registers: Set<Int>, readAt: Collection<Int>) {
    val flow = ControlFlow.of(this)
    val writes = flow.instructions.indices.filter { index ->
        val instruction = flow.instructions[index]
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        instruction.opcode.setsRegister() && destination != null &&
            (destination in registers || (instruction.opcode.setsWideRegister() && destination + 1 in registers))
    }
    // A write takes effect on its normal successors; a throw from it leaves the old value.
    val reached = BitSet()
    val pending = ArrayDeque<Int>()
    fun visit(next: List<Int>) = next.forEach { if (!reached[it]) { reached.set(it); pending += it } }
    writes.forEach { visit(flow.normal[it]) }
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        visit(flow.normal[at])
        visit(flow.exceptional[at])
    }
    val spoiled = readAt.filter { reached[it] }.sorted()
    if (spoiled.isNotEmpty()) {
        throw PatchException(
            "$what: $definingClass->$name writes over $held at instruction(s) " +
                "${writes.joinToString()}, before instruction(s) ${spoiled.joinToString()} where the hook reads it",
        )
    }
}

/** How many of the method's registers are locals rather than parameters. */
internal fun Method.localRegisterCount(): Int {
    val implementation = implementation
        ?: throw PatchException("$definingClass->$name has no body")
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return implementation.registerCount - self - parameterTypes.sumOf { it.width() }
}

/**
 * Throws unless the method has at least [count] locals, which is what an injection at index 0 may
 * borrow: no local holds anything before the method's own first instruction runs. Code going in
 * further down borrows through [freeLocalsAt] or [requireFreeAt] instead.
 */
internal fun MutableMethod.requireLocals(what: String, count: Int) {
    val locals = localRegisterCount()
    if (locals < count) {
        throw PatchException("$what: $definingClass->$name has $locals local register(s), needs $count")
    }
}

/**
 * The registers code put in front of instruction [index] must leave alone, by
 * [RegisterLiveness]: whatever a path from [index] reads before writing it, and the same from
 * each of [targets], the instructions the code can jump to instead of falling through.
 *
 * The code also lands in try blocks. dexlib2 keeps a block's labels on the instructions they were
 * on, so code put in front of the first instruction after a block's range falls inside that block,
 * and the handlers of the instruction before [index] count as well. Code in front of a block's
 * first instruction falls outside it; [RegisterLiveness] counts that block's handlers all the same,
 * which only makes the answer stricter.
 */
internal fun Method.liveAcrossInjection(index: Int, targets: Collection<Int> = emptyList()): Set<Int> {
    val liveness = RegisterLiveness.of(this)
    val live = liveness.liveInto(index).toMutableSet()
    targets.forEach { live += liveness.liveInto(it) }
    if (index > 0) ControlFlow.of(this).exceptional[index - 1].forEach { live += liveness.liveInto(it) }
    return live
}

/**
 * The lowest [count] locals, v[highest] or below, that code put in front of instruction [index] may
 * write without changing what the method goes on to read: no parameter, and nothing
 * [liveAcrossInjection] finds live. Throws naming [what] when there aren't that many.
 *
 * @param highest the highest register the code's operands can name, v15 for an `invoke` or an
 *        `iget`, v255 for a `move-result` or an `if-eqz`
 */
internal fun Method.freeLocalsAt(
    what: String,
    index: Int,
    count: Int,
    targets: Collection<Int> = emptyList(),
    highest: Int = 15,
): List<Int> {
    val live = liveAcrossInjection(index, targets)
    val free = (0 until minOf(localRegisterCount(), highest + 1)).filter { it !in live }
    if (free.size < count) {
        throw PatchException(
            "$what: $definingClass->$name has ${free.size} local register(s) up to v$highest that nothing reads " +
                "after instruction $index, needs $count",
        )
    }
    return free.take(count)
}

/**
 * Throws naming [what] unless each of [borrowed], the registers code put in front of instruction
 * [index] writes, is a local that [liveAcrossInjection] finds nothing reading afterwards. A value
 * still wanted there would be replaced without a word: the injected code verifies, and so does the
 * method, as long as the new value is of the same kind.
 */
internal fun Method.requireFreeAt(
    what: String,
    index: Int,
    borrowed: Collection<Int>,
    targets: Collection<Int> = emptyList(),
) {
    val locals = localRegisterCount()
    val parameters = borrowed.filter { it >= locals }.sorted()
    if (parameters.isNotEmpty()) {
        throw PatchException(
            "$what: $definingClass->$name keeps a parameter in ${parameters.joinToString { "v$it" }}, " +
                "which the hook at instruction $index can't borrow",
        )
    }
    val live = liveAcrossInjection(index, targets).filter { it in borrowed }.sorted()
    if (live.isNotEmpty()) {
        throw PatchException(
            "$what: $definingClass->$name still reads ${live.joinToString { "v$it" }} after instruction $index, " +
                "so the hook there can't borrow ${if (live.size == 1) "it" else "them"}",
        )
    }
}

/**
 * Hands each answer the boolean method gives to [hook], a static (I)Z, and returns what the hook
 * says instead. The answer's own register carries it there and back, so nothing is borrowed, and
 * the call goes in at each return's control flow label, so every branch to a return runs it too.
 *
 * The hook takes an int because ART lets a boolean method return a register it types as int or
 * byte (code such as `and-int/lit8 v0, v0, 0x1` before the return), and handing that register to a
 * boolean parameter fails verification when the class loads. An int parameter takes all of them.
 */
internal fun MutableMethod.filterBooleanReturns(what: String, hook: String) {
    if (returnType != "Z") throw PatchException("$what: $definingClass->$name answers $returnType, not a boolean")
    if (!hook.endsWith("(I)Z")) throw PatchException("$what: $hook must take the answer as an int, (I)Z")
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.map { it.index }
    if (returns.isEmpty()) throw PatchException("$what: $definingClass->$name never returns")
    for (index in returns.asReversed()) {
        val answer = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$answer .. v$answer }, $hook
                move-result v$answer
            """,
        )
    }
}

/**
 * [filterBooleanReturns] for a method that answers an object: each answer goes to [hook], a static
 * method taking and answering one object, and the method returns what the hook says instead. When
 * the hook answers a wider type than the method, the answer is cast back to the method's own.
 */
internal fun MutableMethod.filterObjectReturns(what: String, hook: String) {
    if (!returnType.startsWith("L") && !returnType.startsWith("[")) {
        throw PatchException("$what: $definingClass->$name answers $returnType, not an object")
    }
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    if (returns.isEmpty()) throw PatchException("$what: $definingClass->$name never returns")
    val castBack = !hook.endsWith(")$returnType")
    for (index in returns.asReversed()) {
        val answer = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$answer .. v$answer }, $hook
                move-result-object v$answer
            """ + if (castBack) "check-cast v$answer, $returnType\n" else "",
        )
    }
}

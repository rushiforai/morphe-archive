/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.pinterest.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.util.BitSet

/** The package of the Pinterest extension, as a smali descriptor prefix. */
internal const val EXTENSION_PACKAGE = "Lapp/hushpinterest/extension/pinterest"

/** Which patches this build carries. See the class's own comment. */
internal const val SETTINGS_STATUS = "$EXTENSION_PACKAGE/settings/SettingsStatus;"

/**
 * Rewrites `SettingsStatus.[name]()` to answer true, so the extension acts for this patch and the
 * settings screen shows its switch. Call it from the feature patch's execute block; the patch must
 * depend on the Pinterest extension patch, which is what merges `SettingsStatus` into the APK.
 */
internal fun BytecodePatchContext.enableStatus(name: String) {
    val method = statusMethod(name)
    method.returnEarly(true)
}

/**
 * Records one successfully inserted target hook in the extension's immutable build facts. Kept
 * separate from [enableStatus] so wiring checks distinguish a family from its individual targets.
 */
internal fun BytecodePatchContext.enableCapability(name: String) {
    statusMethod(name).returnEarly(true)
}

/**
 * Throws naming [name] unless `SettingsStatus` has a callable static boolean method of that name, the same check
 * [enableStatus] makes. A patch whose own find phase changes bytecode before it calls [enableStatus]
 * should call this first, so a missing method refuses before anything is mutated rather than after,
 * through [enableStatus], once the patch's own hooks are already in.
 */
internal fun BytecodePatchContext.requireStatusMethod(name: String) {
    statusMethod(name)
}

private fun BytecodePatchContext.statusMethod(name: String): MutableMethod {
    val owner = mutableClassDefBy(SETTINGS_STATUS)
    val method = owner.methods.singleOrNull {
        it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty()
    } ?: throw PatchException("SettingsStatus has no boolean method $name()")
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
        !AccessFlags.STATIC.isSet(method.accessFlags) || AccessFlags.ABSTRACT.isSet(method.accessFlags) ||
        AccessFlags.NATIVE.isSet(method.accessFlags) || (method.implementation?.registerCount ?: 0) < 1 ||
        method.implementation?.instructions?.any() != true) {
        throw PatchException("SettingsStatus.$name() is not a callable public static boolean build flag")
    }
    return method
}

/**
 * Gives the extension's static stub [name] in [type] the body [smali], which has [registers]
 * registers in all, its parameters the last of them. A stub answers nothing in the extension's own
 * source because what it calls is one of the app's obfuscated names, found when you patch. It keeps
 * its name, signature and access, so the extension's calls to it run [smali] from then on.
 */
internal fun BytecodePatchContext.writeStub(type: String, name: String, registers: Int, smali: String) {
    val classDef = mutableClassDefBy(type)
    val stub = classDef.methods.singleOrNull { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("$type has no single static stub named $name")
    val needed = stub.parameterTypes.sumOf { it.width() }
    if (registers < needed) throw PatchException("$type->$name takes $needed parameter register(s), more than $registers")
    val body = ImmutableMethod(
        stub.definingClass,
        stub.name,
        stub.parameters,
        stub.returnType,
        stub.accessFlags,
        stub.annotations,
        stub.hiddenApiRestrictions,
        MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructionsWithLabels(0, smali) }
    classDef.methods.remove(stub)
    classDef.methods.add(body)
}

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
 * each instruction of [readAt], where a hook reads it. Pinterest's code reuses a parameter's
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
 * @param reads registers the inserted code itself reads. The method may be done with them, but a
 *        scratch write there would replace the value before the hook reads it.
 * @param highest the highest register the code's operands can name, v15 for an `invoke` or an
 *        `iget`, v255 for a `move-result` or an `if-eqz`
 */
internal fun Method.freeLocalsAt(
    what: String,
    index: Int,
    count: Int,
    targets: Collection<Int> = emptyList(),
    highest: Int = 15,
    reads: Collection<Int> = emptyList(),
): List<Int> {
    val live = liveAcrossInjection(index, targets) + reads
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
 * Puts a question to the extension in front of the method's first instruction: [hook], a static
 * method taking nothing and answering a boolean. On true the method returns at once through
 * [returnSmali], which may use v0; on false it runs as it always did. Borrows v0, which holds
 * nothing before the method's own first instruction, so the method needs one local; throws naming
 * [what] when it has none.
 */
internal fun MutableMethod.returnEarlyWhen(what: String, hook: String, returnSmali: String) {
    requireLocals(what, 1)
    val first = getInstruction(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $hook
            move-result v0
            if-eqz v0, :hush_keep
            $returnSmali
        """,
        ExternalLabel("hush_keep", first),
    )
}

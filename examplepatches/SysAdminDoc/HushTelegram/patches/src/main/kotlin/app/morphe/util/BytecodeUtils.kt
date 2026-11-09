/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original code hard forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/util/BytecodeUtils.kt
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the Morphe patches
 * LICENSE file: https://github.com/MorpheApp/morphe-patches/blob/main/NOTICE
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * File-Specific Exception to Section 7b:
 * -------------------------------------
 * Section 7b (Attribution Requirement) of the Morphe patches LICENSE
 * does not apply to THIS FILE. Use of this file does NOT require any
 * user-facing, in-application, or UI-visible attribution.
 *
 * For this file only, attribution under Section 7b is satisfied by
 * retaining this comment block in the source code of this file.
 *
 * Distribution and Derivative Works:
 * ----------------------------------
 * This comment block MUST be preserved in all copies, distributions,
 * and derivative works of this file, whether in source or modified
 * form.
 *
 * All other terms of the Morphe Patches LICENSE, including Section 7c
 * (Project Name Restriction) and the GPLv3 itself, remain fully
 * applicable to this file.
 */


/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/util/BytecodeUtils.kt
 */
package app.morphe.util

import app.morphe.patcher.InstructionFilter
import app.morphe.util.names.addInstruction
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT
import com.android.tools.smali.dexlib2.Opcode.RETURN
import com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT
import com.android.tools.smali.dexlib2.Opcode.RETURN_WIDE
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull

/**
 * Inserts instructions at a given index, using the existing control flow label at that index.
 * Inserted instructions can have its own control flow labels as well.
 *
 * Effectively this changes the code from:
 * :label
 * (original code)
 *
 * Into:
 * :label
 * (patch code)
 * (original code)
 */
fun MutableMethod.addInstructionsAtControlFlowLabel(
    insertIndex: Int,
    instructions: String,
    vararg externalLabels: ExternalLabel
) {
    // The copy below shares the original's payload until the original is removed, and dexlib2
    // refuses two switches on one payload halfway through, with the copy already in the method.
    val original = getInstruction(insertIndex).opcode
    if (original in PAYLOAD_USERS) {
        throw PatchException("$definingClass->$name: code can't go in front of the $original at instruction $insertIndex")
    }
    // A payload is data after the code. Nothing runs it, and the copy would be a second payload.
    if (original in PAYLOADS) {
        throw PatchException("$definingClass->$name: instruction $insertIndex is a $original, data that never runs, so code can't go in front of it")
    }
    // A result is taken right after its call and a caught exception at its handler's start. Code in
    // front of either leaves the move to a place ART refuses it, whether or not the code jumps.
    if (original == Opcode.MOVE_EXCEPTION || original in MOVE_RESULTS) {
        throw PatchException("$definingClass->$name: code can't go in front of the $original at instruction $insertIndex, " +
            "which only a throw or a call may reach")
    }
    // Compiled the way the patcher compiles it, with a stand-in nop for each label the code names but
    // doesn't hold, to know its length. A label's name is internal to the patcher, so the names come
    // from the code; a type after a colon gets a stand-in too, which is counted the same way.
    val held = Regex("""^\s*:(\w+)\s*$""", RegexOption.MULTILINE).findAll(instructions).map { it.groupValues[1] }.toSet()
    val standIns = Regex(""":(\w+)""").findAll(instructions).map { it.groupValues[1] }.toSet() - held
    val compiled = (instructions + standIns.joinToString("") { "\n:$it\nnop" }).toInstructions(this)
    // A switch or array table of the hook's own would be checked, and copied, against the method's padding.
    compiled.firstOrNull { it.opcode in PAYLOAD_USERS || it.opcode == Opcode.FILL_ARRAY_DATA }?.let {
        throw PatchException("$definingClass->$name: the code at instruction $insertIndex has a ${it.opcode} of its own, which can't be checked")
    }
    if (externalLabels.isNotEmpty()) requireJumpsKeepRegisters(insertIndex, instructions, externalLabels, compiled.size - standIns.size)
    insertAtControlFlowLabel(insertIndex, instructions, *externalLabels)
}

/**
 * [addInstructionsAtControlFlowLabel] without its checks. Only for tests that build a hostile
 * method on purpose, one ART would refuse, to show a patch still turns it down.
 */
internal fun MutableMethod.insertAtControlFlowLabel(
    insertIndex: Int,
    instructions: String,
    vararg externalLabels: ExternalLabel
) {
    // A label on the original instruction means that instruction, which ends up after the patch code.
    // The duplicate below is the same object, and a label goes to an instruction's first place, which
    // hands its labels to the patch code's start: a jump there would loop. Such a label is held by a
    // stand-in nop at the code's end instead, and removing the nop hands it on to the original.
    val original = getInstruction(insertIndex)
    val names = Regex(""":(\w+)""").findAll(instructions).map { it.groupValues[1] }.toSet()
    val onOriginal = names.filter { name -> externalLabels.any { it == ExternalLabel(name, original) } }
    val others = externalLabels.filter { label -> onOriginal.none { label == ExternalLabel(it, original) } }
    val code = if (onOriginal.isEmpty()) instructions else instructions + onOriginal.joinToString("") { "\n:$it" } + "\nnop"

    // Duplicate original instruction and add to +1 index.
    addInstruction(insertIndex + 1, original)

    // Add patch code at same index as duplicated instruction,
    // so it uses the original instruction control flow label.
    addInstructionsWithLabels(insertIndex + 1, code, *others.toTypedArray())

    // Remove original non duplicated instruction.
    removeInstruction(insertIndex)

    if (onOriginal.isNotEmpty()) {
        val standIn = implementation!!.instructions.indexOfFirst { it === original } - 1
        if (getInstruction(standIn).opcode != Opcode.NOP) {
            throw PatchException("$definingClass->$name: the code at instruction $insertIndex lost its stand-in for the jump to instruction $insertIndex")
        }
        removeInstruction(standIn)
    }

    // Original instruction is now after the inserted patch instructions,
    // and the original control flow label is on the first instruction of the patch code.
}

/**
 * Refuses, before the method changes, a hook whose jump would bring a register to a read that
 * can't take what it now holds. ART verifies the whole method when its class loads, so one such
 * jump fails the class on every run, whatever the guard answers. The hook goes into a copy first,
 * and every read in the copy is checked against what the same read had in the unchanged method,
 * so a read the model can't type passes only where nothing about its register changed. A
 * reference of a class that differs between paths, or an array element of a type not known here,
 * is taken on trust; dex2oat on a phone still checks those.
 */
private fun MutableMethod.requireJumpsKeepRegisters(insertIndex: Int, instructions: String, labels: Array<out ExternalLabel>, hookSize: Int) {
    fun refuse(reason: String): Nothing = throw PatchException("$definingClass->$name: $reason")
    val stock = implementation!!.instructions.toList()
    // The label's instruction is internal to the patcher, but copy and equals are public, and an
    // instruction is only ever equal to itself.
    val targets = labels.map { label ->
        stock.indices.singleOrNull { label.copy(instruction = stock[it]) == label }
            ?: refuse("a label of the code at instruction $insertIndex points at no instruction of this method")
    }
    val trial = MutableMethod(ImmutableMethod.of(this))
    trial.insertAtControlFlowLabel(insertIndex, instructions,
        *labels.mapIndexed { n, label -> label.copy(instruction = trial.getInstruction(targets[n])) }.toTypedArray())
    val copied = trial.implementation!!.instructions.toList()
    // dexlib2 starts every payload on an even code unit with a nop in front where needed, so a hook
    // of an odd length adds that nop or drops it, and a goto the hook pushes out of reach grows to
    // goto/16. The copy is matched to the method one instruction at a time around both, with the
    // hook's own length taken from its compiled code, or every instruction past a changed nop would
    // be read against its neighbor.
    if (stock.isPadding(insertIndex)) refuse("instruction $insertIndex is the padding in front of a payload, which never runs")
    val toStock = IntArray(copied.size) { -1 }
    var s = 0
    var t = 0
    var hookStart = -1
    while (s < stock.size || t < copied.size) {
        if (s == insertIndex && hookStart < 0) {
            hookStart = t
            t += hookSize
            continue
        }
        when {
            s < stock.size && t < copied.size && stock[s].opcode.kind() == copied[t].opcode.kind() -> toStock[t++] = s++
            s < stock.size && stock.isPadding(s) -> s++
            t < copied.size && copied.isPadding(t) -> t++
            else -> refuse("can't line the copy with the code at instruction $insertIndex up with the method at instruction $s")
        }
    }
    val hook = hookStart until hookStart + hookSize
    val resumed = hookStart + hookSize
    val stockKinds: RegisterKinds
    val trialKinds: RegisterKinds
    val trialFlow: ControlFlow
    try {
        stockKinds = RegisterKinds.of(this)
        trialKinds = RegisterKinds.of(trial)
        trialFlow = ControlFlow.of(trial)
    } catch (unreadable: IllegalArgumentException) {
        refuse("can't tell whether the code at instruction $insertIndex keeps the registers it jumps with: ${unreadable.message}")
    }
    for (from in hook) {
        for (to in trialFlow.normal[from]) {
            // Inside the hook, or on into the instruction it was put in front of.
            if (to in hook || to == resumed) continue
            val target = toStock[to]
            if (target < 0) refuse("the code at instruction $insertIndex would jump into the padding in front of a payload")
            val opcode = stock[target].opcode
            if (opcode == Opcode.MOVE_EXCEPTION || opcode in MOVE_RESULTS) {
                refuse("the code at instruction $insertIndex would jump to the $opcode at instruction $target, which only a throw or a call may reach")
            }
        }
    }
    for (index in copied.indices) {
        // The hook's own reads are the patch's to get right; this checks what it does to the method.
        if (index in hook) continue
        val now = trialKinds.at(index) ?: continue
        val at = toStock[index]
        if (at < 0) refuse("the code at instruction $insertIndex would run into the padding in front of a payload")
        val before = stockKinds.at(at)
            ?: refuse("the code at instruction $insertIndex would jump to instruction $at, which nothing reached before")
        for ((register, use) in registerReads(copied[index])) {
            val keeps = if (use == RegisterUse.OTHER) {
                RegisterKind.merge(before[register], now[register]) == before[register]
            } else {
                use.fits(now, register) || !use.fits(before, register)
            }
            if (!keeps) {
                refuse("the code at instruction $insertIndex would bring v$register to instruction $at holding ${now[register]}, " +
                    "where the method's own paths bring ${before[register]}")
            }
        }
    }
}

/** A nop in front of a payload, which dexlib2 adds or drops to align it. */
private fun List<Instruction>.isPadding(index: Int) =
    this[index].opcode == Opcode.NOP && getOrNull(index + 1)?.opcode in PAYLOADS

/** An opcode with its wider forms folded in, which dexlib2 picks by the distance a jump needs. */
private fun Opcode.kind() = when (this) {
    Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
    else -> this
}

private val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT)
private val PAYLOAD_USERS = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)
private val PAYLOADS = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)

/**
 * The register an invoke hands its [argumentIndex]th argument in, for either invoke format, or
 * null when the instruction is not an invoke or has no such argument. `this` counts as argument 0
 * on an instance call.
 */
fun Instruction.argumentRegister(argumentIndex: Int): Int? =
    when (this) {
        // Bounded by the count the invoke declares: the unused slots of a 35c read as v0, and
        // the two private copies this replaces handed that back as if it were an argument.
        is FiveRegisterInstruction -> if (argumentIndex >= registerCount) null else when (argumentIndex) {
            0 -> registerC
            1 -> registerD
            2 -> registerE
            3 -> registerF
            4 -> registerG
            else -> null
        }
        is RegisterRangeInstruction -> if (argumentIndex >= registerCount) null else startRegister + argumentIndex
        else -> null
    }

/**
 * The class and its superclasses, nearest first, as far as this context can resolve them and no
 * further than [maxDepth] steps. A cycle, which a damaged dex can carry, ends the walk.
 */
fun BytecodePatchContext.superclassChain(type: String, maxDepth: Int = 20): Sequence<String> = sequence {
    val seen = mutableSetOf<String>()
    var at: String? = type
    var depth = 0
    while (at != null && depth++ < maxDepth && seen.add(at)) {
        yield(at)
        at = tgClassDefByOrNull(at)?.superclass
    }
}

/**
 * Get the [Reference] of an [Instruction] as [T].
 *
 * @param T The type of [Reference] to cast to.
 * @return The [Reference] as [T] or null
 * if the [Instruction] is not a [ReferenceInstruction] or the [Reference] is not of type [T].
 * @see ReferenceInstruction
 */
inline fun <reified T : Reference> Instruction.getReference() = (this as? ReferenceInstruction)?.reference as? T

/** The method this instruction names, which for an invoke is the one it calls, or null when it names none. */
internal fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * The index the branch at [index] jumps to. The patch's own [refuse] answers when that
 * instruction is no branch, or when the jump doesn't land on an instruction of this list.
 */
internal fun List<Instruction>.branchTarget(index: Int, refuse: (String) -> Nothing): Int {
    val branch = this[index] as? OffsetInstruction ?: refuse("instruction $index is no longer a branch")
    var address = 0
    val addresses = IntArray(size)
    for (at in indices) {
        addresses[at] = address
        address += this[at].codeUnits
    }
    val wanted = addresses[index] + branch.codeOffset
    return addresses.indexOfFirst { it == wanted }.takeIf { it >= 0 } ?: refuse("branch $index lands outside the method")
}

/**
 * @return The index of the first opcode specified, or -1 if not found.
 * @see indexOfFirstInstructionOrThrow
 */
fun Method.indexOfFirstInstruction(targetOpcode: Opcode): Int = indexOfFirstInstruction(0, targetOpcode)

/**
 * @param startIndex Optional starting index to start searching from.
 * @return The index of the first opcode specified, or -1 if not found.
 * @see indexOfFirstInstructionOrThrow
 */
fun Method.indexOfFirstInstruction(startIndex: Int = 0, targetOpcode: Opcode): Int =
    indexOfFirstInstruction(startIndex) {
        opcode == targetOpcode
    }

/**
 * Get the index of the first [Instruction] that matches the predicate, starting from [startIndex].
 *
 * @param startIndex Optional starting index to start searching from.
 * @return -1 if the instruction is not found.
 * @see indexOfFirstInstructionOrThrow
 */
fun Method.indexOfFirstInstruction(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    var instructions = this.implementation?.instructions ?: return -1
    if (startIndex != 0) {
        instructions = instructions.drop(startIndex)
    }
    val index = instructions.indexOfFirst(filter)

    return if (index >= 0) {
        startIndex + index
    } else {
        -1
    }
}

/**
 * @return The index of the first opcode specified
 * @throws PatchException
 * @see indexOfFirstInstruction
 */
fun Method.indexOfFirstInstructionOrThrow(targetOpcode: Opcode): Int = indexOfFirstInstructionOrThrow(0, targetOpcode)

/**
 * @return The index of the first opcode specified, starting from the index specified.
 * @throws PatchException
 * @see indexOfFirstInstruction
 */
fun Method.indexOfFirstInstructionOrThrow(startIndex: Int = 0, targetOpcode: Opcode): Int =
    indexOfFirstInstructionOrThrow(startIndex) {
        opcode == targetOpcode
    }

/**
 * Get the index of the first [Instruction] that matches the predicate, starting from [startIndex].
 *
 * @return The index of the instruction.
 * @throws PatchException
 * @see indexOfFirstInstruction
 */
fun Method.indexOfFirstInstructionOrThrow(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    val index = indexOfFirstInstruction(startIndex, filter)
    if (index < 0) {
        throw PatchException("Could not find instruction index in $definingClass->$name")
    }

    return index
}

/**
 * Get the index of matching instruction,
 * starting from and [startIndex] and searching down.
 *
 * @param startIndex Optional starting index to search down from. Searching includes the start index.
 * @return -1 if the instruction is not found.
 * @see indexOfFirstInstructionReversedOrThrow
 */
fun Method.indexOfFirstInstructionReversed(startIndex: Int? = null, targetOpcode: Opcode): Int =
    indexOfFirstInstructionReversed(startIndex) {
        opcode == targetOpcode
    }

/**
 * Get the index of matching instruction,
 * starting from and [startIndex] and searching down.
 *
 * @param startIndex Optional starting index to search down from. Searching includes the start index.
 * @return -1 if the instruction is not found.
 * @see indexOfFirstInstructionReversedOrThrow
 */
fun Method.indexOfFirstInstructionReversed(startIndex: Int? = null, filter: Instruction.() -> Boolean): Int {
    var instructions = this.implementation?.instructions ?: return -1
    if (startIndex != null) {
        instructions = instructions.take(startIndex + 1)
    }

    return instructions.indexOfLast(filter)
}

/**
 * Get the index of matching instruction,
 * starting from the end of the method and searching down.
 *
 * @return -1 if the instruction is not found.
 */
fun Method.indexOfFirstInstructionReversed(targetOpcode: Opcode): Int = indexOfFirstInstructionReversed {
    opcode == targetOpcode
}

/**
 * Get the index of matching instruction,
 * starting from [startIndex] and searching down.
 *
 * @param startIndex Optional starting index to search down from. Searching includes the start index.
 * @return The index of the instruction.
 * @see indexOfFirstInstructionReversed
 */
fun Method.indexOfFirstInstructionReversedOrThrow(startIndex: Int? = null, targetOpcode: Opcode): Int =
    indexOfFirstInstructionReversedOrThrow(startIndex) {
        opcode == targetOpcode
    }

/**
 * Get the index of matching instruction,
 * starting from the end of the method and searching down.
 *
 * @return -1 if the instruction is not found.
 */
fun Method.indexOfFirstInstructionReversedOrThrow(targetOpcode: Opcode): Int = indexOfFirstInstructionReversedOrThrow {
    opcode == targetOpcode
}

/**
 * Get the index of matching instruction,
 * starting from [startIndex] and searching down.
 *
 * @param startIndex Optional starting index to search down from. Searching includes the start index.
 * @return The index of the instruction.
 * @see indexOfFirstInstructionReversed
 */
fun Method.indexOfFirstInstructionReversedOrThrow(startIndex: Int? = null, filter: Instruction.() -> Boolean): Int {
    val index = indexOfFirstInstructionReversed(startIndex, filter)

    if (index < 0) {
        throw PatchException("Could not find instruction index in $definingClass->$name")
    }

    return index
}

/**
 * @return A list of indices of the instructions in reverse order.
 *  _Returns an empty list if no indices are found_
 *  @see findInstructionIndicesReversedOrThrow
 */
fun Method.findInstructionIndicesReversed(filter: Instruction.() -> Boolean): List<Int> = instructions
    .withIndex()
    .filter { (_, instruction) -> filter(instruction) }
    .map { (index, _) -> index }
    .asReversed()

/**
 * @return A list of indices of the instructions in reverse order.
 * @throws PatchException if no matching indices are found.
 */
fun Method.findInstructionIndicesReversedOrThrow(filter: Instruction.() -> Boolean): List<Int> {
    val indexes = findInstructionIndicesReversed(filter)
    if (indexes.isEmpty()) throw PatchException("No matching instructions found in: $this")

    return indexes
}

/**
 * @return A list of indices of the opcode in reverse order.
 *  _Returns an empty list if no indices are found_
 * @see findInstructionIndicesReversedOrThrow
 */
fun Method.findInstructionIndicesReversed(opcode: Opcode): List<Int> =
    findInstructionIndicesReversed { this.opcode == opcode }

/**
 * @return A list of indices of the opcode in reverse order.
 * @throws PatchException if no matching indices are found.
 */
fun Method.findInstructionIndicesReversedOrThrow(opcode: Opcode): List<Int> {
    val instructions = findInstructionIndicesReversed(opcode)
    if (instructions.isEmpty()) throw PatchException("Could not find opcode: $opcode in: $this")

    return instructions
}

/**
 * @return A list of indices of the instructions in reverse order.
 * _Returns an empty list if no indices are found_
 * @throws PatchException if no matching indices are found.
 */
fun Method.findInstructionIndicesReversed(filter: InstructionFilter): List<Int> {
    val method = this
    return findInstructionIndicesReversed {
        filter.matches(method, this)
    }
}

/**
 * @return A list of indices of the instructions in reverse order.
 * @throws PatchException if no matching indices are found.
 */
fun Method.findInstructionIndicesReversedOrThrow(filter: InstructionFilter): List<Int> {
    val indexes = findInstructionIndicesReversed(filter)
    if (indexes.isEmpty()) throw PatchException("No matching instructions found in: $this")

    return indexes
}

/**
 * The `move-result` belonging to the call the literal was loaded for. A `const-string` counts as a
 * literal here: a settings key is loaded and handed to its lookup the same way a number is.
 *
 * <p>Both overrides used to take the first `move-result` anywhere after the literal. A literal
 * is usually loaded a few instructions before the call it is an argument to, and any other call
 * that lands in that gap owns a `move-result` of its own, so the override could be written onto
 * a value that has nothing to do with the literal. The call the literal belongs to is the first
 * one that reads the register it was loaded into, and a `move-result` belongs to the invoke
 * directly above it.
 */
internal fun MutableMethod.indexOfLiteralCallResult(literalIndex: Int): Int {
    val literalRegister = getInstruction<OneRegisterInstruction>(literalIndex).registerA
    var invokeIndex = -1
    for (index in literalIndex + 1 until instructions.count()) {
        val instruction = getInstruction(index)
        if (instruction.opcode.name.startsWith("invoke-") &&
            literalRegister in instruction.registersUsed
        ) {
            invokeIndex = index
            break
        }
        // Anything that writes the register again ends the literal's life. An invoke past
        // that point reads whatever was written last, which is not what was loaded here. A wide
        // write names only its low half, so one into the register below covers this one too.
        // Wide here means the destination is a pair, not that the mnemonic says long: long-to-int
        // and cmp-long both read a pair and answer in one register.
        val written = instruction.writeRegister
        if (written == literalRegister) break
        if (written != null && instruction.writesAWideRegister && written + 1 == literalRegister) {
            break
        }
    }
    check(invokeIndex >= 0) {
        "No call reads the literal loaded at index $literalIndex"
    }
    val resultIndex = invokeIndex + 1
    check(
        resultIndex < instructions.count() &&
            getInstruction(resultIndex).opcode == MOVE_RESULT
    ) {
        "The call after the literal at index $literalIndex does not take its result"
    }
    return resultIndex
}

/**
 * Constant value override of the first MOVE_RESULT after the index parameter.
 */
internal fun MutableMethod.insertLiteralOverride(literalIndex: Int, override: Boolean) {
    val index = indexOfLiteralCallResult(literalIndex)
    val register = getInstruction<OneRegisterInstruction>(index).registerA
    val overrideValue = if (override) "0x1" else "0x0"

    addInstruction(
        index + 1,
        "const v$register, $overrideValue"
    )
}

fun Boolean.toHexString(): String = if (this) "0x1" else "0x0"

/**
 * @return The number of registers for all parameters, including p0.
 * This includes 2 registers for each wide parameter.
 */
val Method.numberOfParameterRegisters: Int
    get() {
        var count = 0

        if (!AccessFlags.STATIC.isSet(accessFlags)) {
            count += 1
        }

        for (param in parameters) {
            count += when (param.origType) {
                "J", "D" -> 2   // wide
                else -> 1       // normal
            }
        }

        return count
    }

private const val RETURN_TYPE_MISMATCH = "Mismatch between override type and Method return type"

/**
 * Overrides the first instruction of a method with a return-void instruction.
 * None of the method code will ever execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly() {
    check(returnType.first() == 'V') {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(false.toHexString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Boolean` return value.
 * None of the original method code will execute.
 *
 * For methods that return an object or any array type, calling this method with `false`
 * will force the method to return a `null` value.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Boolean) {
    check(returnType.first() == 'Z') {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(value.toHexString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Byte` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Byte) {
    check(returnType.first() == 'B') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Short` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Short) {
    check(returnType.first() == 'S') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Char` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Char) {
    check(returnType.first() == 'C') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.code.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Int` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Int) {
    check(returnType.first() == 'I') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Long` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Long) {
    check(returnType.first() == 'J') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Float` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Float) {
    check(returnType.first() == 'F') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant `Double` return value.
 * None of the original method code will execute.
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Double) {
    check(returnType.first() == 'D') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), false)
}

/**
 * Overrides the first instruction of a method with a constant String return value.
 * None of the original method code will execute.
 *
 * Target method must have return type
 * Ljava/lang/String; or Ljava/lang/CharSequence;
 *
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: String) {
    check(returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;") {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(value, false)
}

/**
 * Overrides the first instruction of a method with a constant `NULL` return value.
 * None of the original method code will execute.
 *
 * @param value Value must be `Null`.
 * @see returnLate
 */
fun MutableMethod.returnEarly(value: Void?) {
    val returnType = returnType.first()
    check(returnType == 'L' || returnType == '[') {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(false.toHexString(), false, nullReturn = true)
}

/**
 * Overrides all return statements with a constant `Boolean` value.
 * All method code is executed the same as unpatched.
 *
 * For methods that return an object or any array type, calling this method with `false`
 * will force the method to return a `null` value.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Boolean) {
    check(this.returnType.first() == 'Z') {
        RETURN_TYPE_MISMATCH
    }

    overrideReturnValue(value.toHexString(), true)
}

/**
 * Overrides all return statements with a constant `Byte` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Byte) {
    check(returnType.first() == 'B') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), true)
}

/**
 * Overrides all return statements with a constant `Short` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Short) {
    check(returnType.first() == 'S') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), true)
}

/**
 * Overrides all return statements with a constant `Char` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Char) {
    check(returnType.first() == 'C') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.code.toString(), true)
}

/**
 * Overrides all return statements with a constant `Int` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Int) {
    check(returnType.first() == 'I') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), true)
}

/**
 * Overrides all return statements with a constant `Long` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Long) {
    check(returnType.first() == 'J') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), true)
}

/**
 * Overrides all return statements with a constant `Float` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Float) {
    check(returnType.first() == 'F') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), true)
}

/**
 * Overrides all return statements with a constant `Double` value.
 * All method code is executed the same as unpatched.
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Double) {
    check(returnType.first() == 'D') { RETURN_TYPE_MISMATCH }
    overrideReturnValue(value.toString(), true)
}

/**
 * Overrides all return statements with a constant String value.
 * All method code is executed the same as unpatched.
 *
 * Target method must have return type
 * Ljava/lang/String; or Ljava/lang/CharSequence;
 *
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: String) {
    check(returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;") {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(value, true)
}

/**
 * Overrides all return statements with a constant `Null` value.
 * All method code is executed the same as unpatched.
 *
 * @param value Value must be `Null`.
 * @see returnEarly
 */
fun MutableMethod.returnLate(value: Void?) {
    val returnType = returnType.first()
    check(returnType == 'L' || returnType == '[') {
        RETURN_TYPE_MISMATCH
    }

    overrideReturnValue(false.toHexString(), true, nullReturn = true)
}

private fun MutableMethod.overrideReturnValue(
    value: String,
    returnLate: Boolean,
    nullReturn: Boolean = false,
) {
    // A String or CharSequence return type takes the const-string path below, which is right for
    // returnEarly(String) and wrong for returnEarly(null): it wrote the text "0x0" where the
    // caller asked for null. A null return on those types is the same const/4 as any other
    // object.
    val stringValue = !nullReturn &&
        (returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;")
    val instructions = if (stringValue) {
        """
            const-string v0, "$value"
            return-object v0
        """
    } else when (returnType.first()) {
        // If return type is an object, always return null.
        'L', '[' -> {
            """
                const/4 v0, 0x0
                return-object v0
            """
        }

        'V' -> {
            "return-void"
        }

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

        else -> throw Exception("Return type is not supported: $this")
    }

    // The override writes its value into v0, and a wide one into v0 and v1, so the frame has to
    // hold those registers. Nothing above asks: a method with no room takes the instructions
    // anyway and the result does not verify on the phone rather than failing here. Patches used
    // to check this for themselves beside their own hand-written smali; the check belongs with
    // the code that decides which registers to write.
    //
    // A void override writes into nothing and needs none of them. A static method with no
    // parameters and no locals is `.registers 0`, and `return-void` assembles against it, so a
    // patch that blanks such a method must not be refused here.
    val registersNeeded = when (returnType.first()) {
        'V' -> 0
        'J', 'D' -> 2
        else -> 1
    }
    val registersAvailable = checkNotNull(implementation?.registerCount) {
        "$definingClass->$name has no body, so there is nothing to override"
    }
    check(registersAvailable >= registersNeeded) {
        "$definingClass->$name has $registersAvailable registers and a $returnType override " +
            "needs $registersNeeded to write into"
    }
    // The assembler below compiles against a method it re-declares with this one's parameters,
    // so the frame also has to hold them. Valid dex always does. A hand-built method that does
    // not gets "Collection is empty" thrown out of the compiler's own first(), naming neither
    // the method nor the reason, and reading that refusal as a floor under every override is
    // what briefly put one under the void case here.
    check(registersAvailable >= numberOfParameterRegisters) {
        "$definingClass->$name has $registersAvailable registers and its own parameters take " +
            "$numberOfParameterRegisters, so the assembler has nothing to compile against"
    }

    if (returnLate) {
        findInstructionIndicesReversedOrThrow {
            opcode == RETURN || opcode == RETURN_WIDE || opcode == RETURN_OBJECT
        }.forEach { index ->
            addInstructionsAtControlFlowLabel(index, instructions)
        }
    } else {
        addInstructions(0, instructions)
    }
}

/**
 * Remove the given AccessFlags from the field.
 */
internal fun MutableField.removeFlags(vararg flags: AccessFlags) {
    val bitField = flags.map { it.value }.reduce { acc, flag -> acc or flag }
    this.accessFlags = this.accessFlags and bitField.inv()
}

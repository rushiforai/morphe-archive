package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val CONDITIONAL_BRANCHES = setOf(
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
)

/**
 * Skips the item a revamped (Compose) list builder adds to its LazyColumn under [key].
 *
 * The builders add each optional item as `if (show) item(key = "<key>") { ... }`: a const-string with
 * the key, passed to a static void item helper (LazyListScope.item, R8-inlined), behind a branch that
 * jumps past that call when the item is hidden. A goto to that same target goes in right before the
 * branch, so the item is never added. The branch's registers keep their values for any later reader,
 * and the builder's other items are untouched. [checkGuard] gets the instructions and the branch
 * index and throws when the branch is not the expected one.
 */
internal fun MutableMethod.skipLazyListItem(key: String, checkGuard: (List<BuilderInstruction>, Int) -> Unit) {
    val label = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    val code = implementation ?: throw PatchException("$label has no implementation")
    val instructions = code.instructions.toList()

    // 1. The key, and the item helper call it goes to (the next instruction using its register).
    val keys = instructions.indices.filter { index ->
        val instruction = instructions[index]
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == key
    }
    val keyIndex = keys.singleOrNull() ?: throw PatchException("$label loads \"$key\" ${keys.size} times, expected once")
    val keyRegister = (instructions[keyIndex] as OneRegisterInstruction).registerA
    val addCall = (keyIndex + 1 until instructions.size).firstOrNull { index ->
        instructions[index].argumentRegisters()?.contains(keyRegister) == true || instructions[index].writes(keyRegister)
    } ?: throw PatchException("$label never uses \"$key\"")
    val itemAdd = (instructions[addCall] as? ReferenceInstruction)?.reference as? MethodReference
    if ((instructions[addCall].opcode != Opcode.INVOKE_STATIC && instructions[addCall].opcode != Opcode.INVOKE_STATIC_RANGE) ||
        itemAdd?.returnType != "V" || instructions[addCall].argumentRegisters()?.contains(keyRegister) != true
    ) {
        throw PatchException("$label does not pass \"$key\" to a static void item helper; got ${instructions[addCall].opcode} $itemAdd")
    }
    fun isItemAdd(index: Int) = ((instructions[index] as? ReferenceInstruction)?.reference as? MethodReference) == itemAdd

    // 2. The guard: the nearest conditional branch after the previous item that jumps past the item
    // helper call, without also jumping over the next item.
    val previousItem = (keyIndex - 1 downTo 0).firstOrNull(::isItemAdd) ?: -1
    val guard = (keyIndex - 1 downTo previousItem + 1).firstOrNull { index ->
        instructions[index].opcode in CONDITIONAL_BRANCHES &&
            (instructions[index] as BuilderOffsetInstruction).target.location.index > addCall
    } ?: throw PatchException("$label has no branch that skips the \"$key\" item")
    val target = (instructions[guard] as BuilderOffsetInstruction).target.location.index
    if ((addCall + 1 until target).any(::isItemAdd)) {
        throw PatchException("$label: the \"$key\" guard at $guard also skips the next item")
    }

    // 3. The item is reached only through the guard: every jump into it comes from inside it.
    val jumps = instructions.flatMapIndexed { index, instruction ->
        when (instruction) {
            is BuilderOffsetInstruction -> listOf(index to instruction.target.location.index)
            // A switch payload stands in for its switch instruction (conservative: always outside).
            is BuilderSwitchPayload -> instruction.switchElements.map { index to it.target.location.index }
            else -> emptyList()
        }
    } + code.tryBlocks.flatMap { block -> block.exceptionHandlers.map { -1 to it.handler.location.index } }
    val bypass = jumps.filter { (from, to) -> to in guard + 1..addCall && from !in guard + 1 until addCall }
    if (bypass.isNotEmpty()) {
        throw PatchException("$label: the \"$key\" item is also reached from ${bypass.map { it.first }}, not only through its guard")
    }

    checkGuard(instructions, guard)

    // 4. Always jump past the item.
    requireNoBranchTargetAt(guard, "skipping the \"$key\" item")
    addInstructionsWithLabelsChecked(guard, "goto :skip_item", ExternalLabel("skip_item", getInstruction(target)))
}

private fun Instruction.argumentRegisters(): List<Int>? = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> null
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/** The instruction before [index] that last wrote [register], in code order. */
internal fun List<BuilderInstruction>.lastWriter(index: Int, register: Int): Int =
    (index - 1 downTo 0).firstOrNull { this[it].writes(register) } ?: -1

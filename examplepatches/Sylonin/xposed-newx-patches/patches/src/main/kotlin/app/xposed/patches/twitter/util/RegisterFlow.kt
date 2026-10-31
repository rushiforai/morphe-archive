package app.xposed.patches.twitter.util

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/** What a register may hold, as far as [RegisterFlow] tracks it. */
internal sealed interface Abstract {
    /** Parameter [index], counted without `this`. */
    data class Parameter(val index: Int) : Abstract
    data class Literal(val value: Long) : Abstract

    /** `parameter & mask`. */
    data class Masked(val parameter: Int, val mask: Long) : Abstract
    data class Static(val field: String) : Abstract

    /** A value the analysis doesn't model. */
    data object Other : Abstract

    /** Anything at all; the analysis gave up on this register. */
    data object Any : Abstract
}

/**
 * The values each register may hold before each instruction, over all paths through the
 * method including branches, switches and exception handlers.
 */
internal class RegisterFlow(method: Method) {
    val instructions: List<Instruction> = method.instructionList
    private val registerCount = method.implementation!!.registerCount
    private val states = arrayOfNulls<Array<Set<Abstract>>>(instructions.size)

    init {
        val addresses = IntArray(instructions.size)
        instructions.forEachIndexed { i, instruction ->
            if (i > 0) addresses[i] = addresses[i - 1] + instructions[i - 1].codeUnits
        }
        val indexAt = addresses.withIndex().associate { (i, address) -> address to i }
        val handlers = Array(instructions.size) { mutableListOf<Int>() }
        method.implementation!!.tryBlocks.forEach { block ->
            val end = block.startCodeAddress + block.codeUnitCount
            block.exceptionHandlers.forEach { handler ->
                val target = indexAt.getValue(handler.handlerCodeAddress)
                addresses.indices.filter { addresses[it] >= block.startCodeAddress && addresses[it] < end }
                    .forEach { handlers[it] += target }
            }
        }

        fun successors(i: Int): List<Int> {
            val instruction = instructions[i]
            val next = if (instruction.opcode.canContinue() && i + 1 < instructions.size) listOf(i + 1) else emptyList()
            if (instruction !is OffsetInstruction) return next
            val target = addresses[i] + instruction.codeOffset
            return when (instruction.opcode) {
                Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                    val payload = instructions[indexAt.getValue(target)] as SwitchPayload
                    next + payload.switchElements.map { indexAt.getValue(addresses[i] + it.offset) }
                }

                Opcode.FILL_ARRAY_DATA -> next
                else -> next + indexAt.getValue(target)
            }
        }

        val entry = Array<Set<Abstract>>(registerCount) { emptySet() }
        var register = registerCount - method.parameterRegisters()
        method.parameterTypes.forEachIndexed { i, type ->
            entry[register] = setOf(Abstract.Parameter(i))
            register += if (type.toString().isWide()) 2 else 1
        }

        val pending = ArrayDeque<Int>()
        val queued = BooleanArray(instructions.size)
        fun flowInto(target: Int, state: Array<Set<Abstract>>) {
            val current = states[target]
            var changed = current == null
            if (current == null) {
                states[target] = state.copyOf()
            } else {
                for (r in 0 until registerCount) {
                    val joined = join(current[r], state[r])
                    if (joined != current[r]) {
                        current[r] = joined
                        changed = true
                    }
                }
            }
            if (changed && !queued[target]) {
                queued[target] = true
                pending += target
            }
        }

        if (instructions.isNotEmpty()) flowInto(0, entry)
        while (pending.isNotEmpty()) {
            val i = pending.removeFirst()
            queued[i] = false
            val before = states[i]!!
            val after = transfer(instructions[i], before.copyOf())
            successors(i).forEach { flowInto(it, after) }
            handlers[i].forEach {
                flowInto(it, before)
                flowInto(it, after)
            }
        }
    }

    /** The values of [register] before instruction [index]; empty when unreachable. */
    fun valuesAt(index: Int, register: Int): Set<Abstract> = states[index]?.get(register).orEmpty()

    /** The values passed to the call at [index], without the receiver of an instance call. */
    fun argumentsAt(index: Int): List<Set<Abstract>> {
        val instruction = instructions[index]
        val values = instruction.argumentRegisters().map { valuesAt(index, it) }
        val isStatic = instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        return if (isStatic) values else values.drop(1)
    }

    private fun join(a: Set<Abstract>, b: Set<Abstract>): Set<Abstract> = when {
        Abstract.Any in a || Abstract.Any in b -> ANY
        b.all { it in a } -> a
        else -> (a + b).let { if (it.size > MAX_VALUES) ANY else it }
    }

    private fun transfer(instruction: Instruction, state: Array<Set<Abstract>>): Array<Set<Abstract>> {
        val opcode = instruction.opcode
        when {
            opcode in constOpcodes ->
                state[(instruction as OneRegisterInstruction).registerA] =
                    setOf(Abstract.Literal((instruction as WideLiteralInstruction).wideLiteral))

            opcode in moveOpcodes -> {
                instruction as TwoRegisterInstruction
                state[instruction.registerA] = state[instruction.registerB]
                if (opcode.setsWideRegister()) state[instruction.registerA + 1] = state[instruction.registerB + 1]
            }

            opcode == Opcode.SGET_OBJECT -> state[(instruction as OneRegisterInstruction).registerA] =
                setOf(Abstract.Static(instruction.fieldRef!!.descriptor))

            opcode == Opcode.AND_INT_LIT8 || opcode == Opcode.AND_INT_LIT16 -> {
                instruction as TwoRegisterInstruction
                val literal = setOf(Abstract.Literal((instruction as WideLiteralInstruction).wideLiteral))
                state[instruction.registerA] = masked(state[instruction.registerB], literal)
            }

            opcode == Opcode.AND_INT -> {
                instruction as ThreeRegisterInstruction
                state[instruction.registerA] = masked(state[instruction.registerB], state[instruction.registerC])
            }

            opcode == Opcode.AND_INT_2ADDR -> {
                instruction as TwoRegisterInstruction
                state[instruction.registerA] = masked(state[instruction.registerA], state[instruction.registerB])
            }

            // A cast only narrows the type of the value already there.
            opcode == Opcode.CHECK_CAST -> {}

            instruction is OneRegisterInstruction && opcode.setsWideRegister() -> {
                state[instruction.registerA] = OTHER
                state[instruction.registerA + 1] = OTHER
            }

            instruction is OneRegisterInstruction && opcode.setsRegister() -> state[instruction.registerA] = OTHER
        }
        return state
    }

    private fun masked(a: Set<Abstract>, b: Set<Abstract>): Set<Abstract> {
        if (Abstract.Any in a || Abstract.Any in b) return ANY
        val values = mutableSetOf<Abstract>()
        for (x in a) for (y in b) {
            values += when {
                x is Abstract.Parameter && y is Abstract.Literal -> Abstract.Masked(x.index, y.value)
                x is Abstract.Literal && y is Abstract.Parameter -> Abstract.Masked(y.index, x.value)
                else -> Abstract.Other
            }
        }
        return if (values.isEmpty() || values.size > MAX_VALUES) OTHER else values
    }

    private companion object {
        const val MAX_VALUES = 32
        val OTHER: Set<Abstract> = setOf(Abstract.Other)

        /** Absorbing, so joins stay monotonic and the analysis terminates. */
        val ANY: Set<Abstract> = setOf(Abstract.Any)
    }
}

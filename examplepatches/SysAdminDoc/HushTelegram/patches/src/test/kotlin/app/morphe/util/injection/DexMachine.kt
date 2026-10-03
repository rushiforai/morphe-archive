package app.morphe.util.injection

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.PackedSwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Something the verifier would refuse, or a read of a register the hook borrowed. */
internal class Broken(message: String) : Exception(message)

/** What a hook placed at an instruction does on one arrival, for running the original as the oracle. */
internal sealed class Arrival {
    object Go : Arrival()
    class Jump(val index: Int) : Arrival()
    class Observe(val answer: Boolean) : Arrival()
}

/**
 * Runs a generated `run(II)I` from its instructions, the way ART would: register kinds are
 * checked on every read, wide pairs live in two halves, and a throw goes to the first handler
 * of the first try block covering it that takes it.
 *
 * @param guard the answer to the n-th call of the probe's guard
 * @param borrowed a register to poison after the instruction at [poisonAfter]: anything that
 *        reads it before writing it again is reading what the hook left there
 * @param arrive for the original method, what a hook at an instruction would do on its n-th
 *        arrival there, from any path
 */
internal class DexMachine(
    method: Method,
    private val trap: Int,
    private val guard: (Int) -> Boolean = { false },
    private val borrowed: Int = -1,
    private val poisonAfter: Int = -1,
    private val arrive: ((index: Int, count: Int) -> Arrival)? = null,
) {
    private val implementation = method.implementation!!
    private val instructions: List<Instruction> = implementation.instructions.toList()
    private val addresses = IntArray(instructions.size)
    private val atAddress = HashMap<Int, Int>()

    /** How many times the guard was asked in the last run. */
    var guardCalls = 0
        private set

    /** How many times each instruction was reached in the last run. */
    val arrivals = IntArray(instructions.size)

    init {
        var address = 0
        instructions.forEachIndexed { index, instruction ->
            addresses[index] = address
            atAddress[address] = index
            address += instruction.codeUnits
        }
    }

    fun run(first: Int, second: Int): Outcome {
        val size = implementation.registerCount
        val values = IntArray(size)
        val kinds = Array(size) { Kind.UNSET }
        val refs = arrayOfNulls<String>(size)
        val poisoned = BooleanArray(size)
        val trace = mutableListOf<String>()
        guardCalls = 0
        arrivals.fill(0)

        fun read(register: Int, index: Int) {
            if (poisoned[register]) throw Broken("instruction $index reads v$register, which the hook borrowed")
        }
        fun int(register: Int, index: Int): Int {
            read(register, index)
            if (kinds[register] != Kind.INT) throw Broken("instruction $index reads v$register as an int, it holds ${kinds[register]}")
            return values[register]
        }
        fun wide(register: Int, index: Int): Long {
            read(register, index)
            read(register + 1, index)
            if (kinds[register] != Kind.WIDE_LOW || kinds[register + 1] != Kind.WIDE_HIGH) {
                throw Broken("instruction $index reads v$register as a long, it holds ${kinds[register]} and ${kinds[register + 1]}")
            }
            return (values[register + 1].toLong() shl 32) or (values[register].toLong() and 0xffffffffL)
        }
        fun clear(register: Int) {
            when (kinds[register]) {
                Kind.WIDE_LOW -> kinds[register + 1] = Kind.UNSET
                Kind.WIDE_HIGH -> kinds[register - 1] = Kind.UNSET
                else -> Unit
            }
            kinds[register] = Kind.UNSET
            poisoned[register] = false
        }
        fun setInt(register: Int, value: Int) { clear(register); kinds[register] = Kind.INT; values[register] = value }
        fun setWide(register: Int, value: Long) {
            clear(register)
            clear(register + 1)
            kinds[register] = Kind.WIDE_LOW
            kinds[register + 1] = Kind.WIDE_HIGH
            values[register] = value.toInt()
            values[register + 1] = (value ushr 32).toInt()
        }

        setInt(size - 2, first)
        setInt(size - 1, second)
        var index = 0
        var steps = 0
        var result: Int? = null
        var exception: String? = null

        while (true) {
            if (++steps > 50_000) throw Broken("ran past 50000 instructions")
            if (index !in instructions.indices) throw Broken("ran off the end of the method")
            val count = arrivals[index]++
            when (val action = arrive?.invoke(index, count) ?: Arrival.Go) {
                is Arrival.Jump -> { index = action.index; continue }
                is Arrival.Observe -> trace += "seen:${action.answer}"
                Arrival.Go -> Unit
            }
            val instruction = instructions[index]
            val opcode = instruction.opcode
            val pending = result
            result = null
            var next = index + 1
            fun target() = atAddress[addresses[index] + (instruction as OffsetInstruction).codeOffset]
                ?: throw Broken("instruction $index branches between instructions")
            try {
                when (opcode) {
                    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST ->
                        setInt(instruction.a, (instruction as NarrowLiteralInstruction).narrowLiteral)
                    Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE ->
                        setWide(instruction.a, (instruction as WideLiteralInstruction).wideLiteral)
                    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16 -> setInt(instruction.a, int(instruction.b, index))
                    Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16, Opcode.MOVE_WIDE_16 -> setWide(instruction.a, wide(instruction.b, index))
                    Opcode.ADD_INT, Opcode.SUB_INT, Opcode.MUL_INT, Opcode.XOR_INT, Opcode.DIV_INT, Opcode.REM_INT ->
                        setInt(instruction.a, arithmetic(opcode, int(instruction.b, index), int((instruction as ThreeRegisterInstruction).registerC, index)))
                    Opcode.ADD_INT_LIT8, Opcode.MUL_INT_LIT8, Opcode.DIV_INT_LIT8, Opcode.REM_INT_LIT8 ->
                        setInt(instruction.a, arithmetic(opcode, int(instruction.b, index), (instruction as NarrowLiteralInstruction).narrowLiteral))
                    Opcode.ADD_LONG -> setWide(instruction.a, wide(instruction.b, index) + wide((instruction as ThreeRegisterInstruction).registerC, index))
                    Opcode.INT_TO_LONG -> setWide(instruction.a, int(instruction.b, index).toLong())
                    Opcode.LONG_TO_INT -> setInt(instruction.a, wide(instruction.b, index).toInt())
                    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ ->
                        if (holds(opcode, int(instruction.a, index), 0)) next = target()
                    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE ->
                        if (holds(opcode, int(instruction.a, index), int(instruction.b, index))) next = target()
                    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> next = target()
                    Opcode.PACKED_SWITCH -> {
                        val value = int(instruction.a, index)
                        val payload = instructions[target()] as PackedSwitchPayload
                        payload.switchElements.firstOrNull { it.key == value }?.let {
                            next = atAddress[addresses[index] + it.offset] ?: throw Broken("switch $index lands between instructions")
                        }
                    }
                    Opcode.INVOKE_STATIC -> {
                        val call = instruction as FiveRegisterInstruction
                        val method = (instruction as ReferenceInstruction).reference as MethodReference
                        if (method.definingClass != PROBE) throw Broken("instruction $index calls ${method.definingClass}")
                        when (method.name) {
                            "note" -> {
                                val value = int(call.registerC, index)
                                trace += "note:$value"
                                if (value == trap) throw Thrown(ILLEGAL_STATE)
                            }
                            "noteWide" -> {
                                if (call.registerD != call.registerC + 1) throw Broken("instruction $index passes a split pair")
                                trace += "wide:${wide(call.registerC, index)}"
                            }
                            "caught" -> {
                                read(call.registerC, index)
                                if (kinds[call.registerC] != Kind.REF) throw Broken("instruction $index passes v${call.registerC} as an exception")
                                trace += "caught:${refs[call.registerC]}"
                            }
                            "mix" -> {
                                val value = int(call.registerC, index)
                                trace += "mix:$value"
                                result = value * 31 + 7
                            }
                            "guard" -> result = if (guard(guardCalls++)) 1 else 0
                            "seen" -> trace += "seen:${int(call.registerC, index) != 0}"
                            else -> throw Broken("instruction $index calls the probe's ${method.name}")
                        }
                    }
                    Opcode.MOVE_RESULT -> setInt(instruction.a, pending ?: throw Broken("instruction $index moves a result no call left"))
                    Opcode.MOVE_EXCEPTION -> {
                        val caught = exception ?: throw Broken("instruction $index moves an exception outside a handler's start")
                        clear(instruction.a)
                        kinds[instruction.a] = Kind.REF
                        refs[instruction.a] = caught
                    }
                    Opcode.RETURN -> return Outcome("return:${int(instruction.a, index)}", trace)
                    Opcode.NOP -> Unit
                    else -> throw Broken("instruction $index is a $opcode, which generated code never uses")
                }
                exception = null
            } catch (thrown: Thrown) {
                next = handler(index, thrown.type) ?: return Outcome("throw:${thrown.type}", trace)
                exception = thrown.type
            }
            if (index == poisonAfter) {
                clear(borrowed)
                poisoned[borrowed] = true
            }
            index = next
        }
    }

    private fun handler(index: Int, type: String): Int? {
        val address = addresses[index]
        for (block in implementation.tryBlocks) {
            if (address < block.startCodeAddress || address >= block.startCodeAddress + block.codeUnitCount) continue
            for (handler in block.exceptionHandlers) {
                if (catches(handler.exceptionType, type)) {
                    return atAddress[handler.handlerCodeAddress] ?: throw Broken("a handler starts between instructions")
                }
            }
        }
        return null
    }

    private val Instruction.a get() = (this as OneRegisterInstruction).registerA
    private val Instruction.b get() = (this as TwoRegisterInstruction).registerB

    private fun arithmetic(opcode: Opcode, a: Int, b: Int): Int = when (opcode) {
        Opcode.ADD_INT, Opcode.ADD_INT_LIT8 -> a + b
        Opcode.SUB_INT -> a - b
        Opcode.MUL_INT, Opcode.MUL_INT_LIT8 -> a * b
        Opcode.XOR_INT -> a xor b
        Opcode.DIV_INT, Opcode.DIV_INT_LIT8 -> if (b == 0) throw Thrown(ARITHMETIC) else a / b
        Opcode.REM_INT, Opcode.REM_INT_LIT8 -> if (b == 0) throw Thrown(ARITHMETIC) else a % b
        else -> error(opcode)
    }

    private fun holds(opcode: Opcode, a: Int, b: Int) = when (opcode) {
        Opcode.IF_EQZ, Opcode.IF_EQ -> a == b
        Opcode.IF_NEZ, Opcode.IF_NE -> a != b
        Opcode.IF_LTZ, Opcode.IF_LT -> a < b
        Opcode.IF_GEZ, Opcode.IF_GE -> a >= b
        Opcode.IF_GTZ, Opcode.IF_GT -> a > b
        Opcode.IF_LEZ, Opcode.IF_LE -> a <= b
        else -> error(opcode)
    }
}

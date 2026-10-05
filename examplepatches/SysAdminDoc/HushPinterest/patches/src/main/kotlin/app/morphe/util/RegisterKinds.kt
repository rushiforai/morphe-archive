/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.util

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * What a register holds at an instruction, as far as ART's verifier is concerned. [Tag.UNUSABLE]
 * covers never written and two paths that disagree, which the verifier also refuses to read.
 * [Tag.ZERO] and [Tag.CONST] are untyped literals: zero can still become an int, a float or null,
 * and another constant an int or a float, the way the verifier keeps them until a use decides.
 */
data class RegisterKind(val tag: Tag, val type: String? = null, val site: Int = 0) {
    enum class Tag(val wide: Boolean = false) {
        UNUSABLE, ZERO, CONST, INT, FLOAT,
        /** An int or a float, from an array whose element type isn't known here. */
        NARROW,
        /** A reference, of [type] when every path agrees on the class, else of a class not known here. */
        REF,
        /** An object [site] made that its constructor hasn't run on yet. */
        UNINIT,
        WIDE_CONST_LOW(true), WIDE_CONST_HIGH(true), LONG_LOW(true), LONG_HIGH(true),
        DOUBLE_LOW(true), DOUBLE_HIGH(true),
        /** A long or a double from an array whose element type isn't known here. */
        WIDE_LOW(true), WIDE_HIGH(true),
    }

    val usable get() = tag != Tag.UNUSABLE

    override fun toString() = when (tag) {
        Tag.REF -> type ?: "a reference of unknown class"
        Tag.UNINIT -> "an unconstructed $type"
        Tag.UNUSABLE -> "nothing usable"
        else -> tag.name.lowercase().replace('_', ' ')
    }

    companion object {
        val UNUSABLE = RegisterKind(Tag.UNUSABLE)
        val ZERO = RegisterKind(Tag.ZERO)
        val CONST = RegisterKind(Tag.CONST)
        val INT = RegisterKind(Tag.INT)
        val FLOAT = RegisterKind(Tag.FLOAT)
        val NARROW = RegisterKind(Tag.NARROW)
        fun ref(type: String?) = RegisterKind(Tag.REF, type)

        /** What the verifier keeps where two paths meet. */
        fun merge(a: RegisterKind, b: RegisterKind): RegisterKind {
            if (a == b) return a
            if (!a.usable || !b.usable) return UNUSABLE
            val (x, y) = if (a.tag <= b.tag) a to b else b to a
            return when {
                x.tag.wide != y.tag.wide -> UNUSABLE
                x.tag == Tag.ZERO -> if (y.tag == Tag.UNINIT) UNUSABLE else y
                x.tag == Tag.CONST && y.tag in setOf(Tag.INT, Tag.FLOAT, Tag.NARROW) -> y
                x.tag == Tag.INT && y.tag == Tag.NARROW || x.tag == Tag.FLOAT && y.tag == Tag.NARROW -> NARROW
                x.tag == Tag.REF && y.tag == Tag.REF -> ref(null)
                x.tag == Tag.WIDE_CONST_LOW && y.tag in setOf(Tag.LONG_LOW, Tag.DOUBLE_LOW, Tag.WIDE_LOW) -> y
                x.tag == Tag.WIDE_CONST_HIGH && y.tag in setOf(Tag.LONG_HIGH, Tag.DOUBLE_HIGH, Tag.WIDE_HIGH) -> y
                x.tag in setOf(Tag.LONG_LOW, Tag.DOUBLE_LOW) && y.tag == Tag.WIDE_LOW -> y
                x.tag in setOf(Tag.LONG_HIGH, Tag.DOUBLE_HIGH) && y.tag == Tag.WIDE_HIGH -> y
                else -> UNUSABLE
            }
        }
    }
}

/** What an instruction needs a register it reads to hold, as ART's verifier checks it. */
enum class RegisterUse {
    INT, FLOAT, REF,
    /** A null check or an equality test, which takes an int or a reference. */
    INT_OR_REF,
    /** A plain move, which takes any one-register value but a reference. */
    NARROW,
    /** move-object, which can also carry an object its constructor hasn't run on. */
    ANY_REF,
    /** The object a constructor call runs on. */
    RECEIVER,
    /** The low register of a pair, with the high one after it. */
    LONG, DOUBLE, WIDE,
    /** A read this model doesn't type, which must hold what it held before. */
    OTHER;

    /** Whether [kinds] gives [register] what this use needs. */
    fun fits(kinds: List<RegisterKind>, register: Int): Boolean {
        val tag = kinds[register].tag
        val high = kinds.getOrNull(register + 1)?.tag
        return when (this) {
            INT -> tag in NUMBERS && tag != RegisterKind.Tag.FLOAT
            FLOAT -> tag in NUMBERS && tag != RegisterKind.Tag.INT
            REF -> tag == RegisterKind.Tag.ZERO || tag == RegisterKind.Tag.REF
            INT_OR_REF -> tag in NUMBERS && tag != RegisterKind.Tag.FLOAT || tag == RegisterKind.Tag.REF
            NARROW -> tag in NUMBERS
            ANY_REF -> tag == RegisterKind.Tag.ZERO || tag == RegisterKind.Tag.REF || tag == RegisterKind.Tag.UNINIT
            RECEIVER -> tag == RegisterKind.Tag.UNINIT || tag == RegisterKind.Tag.REF
            LONG -> tag in LONG_LOWS && high == RegisterKind.Tag.entries[tag.ordinal + 1]
            DOUBLE -> tag in DOUBLE_LOWS && high == RegisterKind.Tag.entries[tag.ordinal + 1]
            WIDE -> (tag in LONG_LOWS || tag in DOUBLE_LOWS) && high == RegisterKind.Tag.entries[tag.ordinal + 1]
            OTHER -> false
        }
    }

    private companion object {
        val NUMBERS = setOf(RegisterKind.Tag.ZERO, RegisterKind.Tag.CONST, RegisterKind.Tag.INT, RegisterKind.Tag.FLOAT, RegisterKind.Tag.NARROW)
        val LONG_LOWS = setOf(RegisterKind.Tag.WIDE_CONST_LOW, RegisterKind.Tag.LONG_LOW, RegisterKind.Tag.WIDE_LOW)
        val DOUBLE_LOWS = setOf(RegisterKind.Tag.WIDE_CONST_LOW, RegisterKind.Tag.DOUBLE_LOW, RegisterKind.Tag.WIDE_LOW)
    }
}

/**
 * The registers [instruction] reads and what each must hold. A pair is named once, by its low
 * register. Destinations an instruction only writes aren't listed.
 */
fun Method.registerReads(instruction: Instruction): List<Pair<Int, RegisterUse>> {
    val registers = instruction.namedRegisters()
    val name = instruction.opcode.name
    fun typed(type: String) = when (type) {
        "F" -> RegisterUse.FLOAT
        "Z", "B", "S", "C", "I" -> RegisterUse.INT
        "J" -> RegisterUse.LONG
        "D" -> RegisterUse.DOUBLE
        else -> RegisterUse.REF
    }
    fun byName(type: String) = when (type) {
        "int", "boolean", "byte", "char", "short" -> RegisterUse.INT
        "long" -> RegisterUse.LONG
        "float" -> RegisterUse.FLOAT
        "double" -> RegisterUse.DOUBLE
        else -> RegisterUse.OTHER
    }
    fun field() = typed(((instruction as ReferenceInstruction).reference as FieldReference).type)
    val shift = name.startsWith("shl-long") || name.startsWith("shr-long") || name.startsWith("ushr-long")
    return when {
        name.startsWith("move-result") || name == "move-exception" || name.startsWith("const") ||
            name == "new-instance" || name.startsWith("sget") || name == "return-void" || name == "nop" ||
            name.startsWith("goto") -> emptyList()
        name == "move" || name == "move/from16" || name == "move/16" -> listOf(registers[1] to RegisterUse.NARROW)
        name.startsWith("move-wide") -> listOf(registers[1] to RegisterUse.WIDE)
        name.startsWith("move-object") -> listOf(registers[1] to RegisterUse.ANY_REF)
        name == "return" || name == "return-wide" -> listOf(registers[0] to typed(returnType))
        name == "return-object" || name == "throw" || name.startsWith("monitor") || name == "check-cast" ||
            name == "fill-array-data" -> listOf(registers[0] to RegisterUse.REF)
        name == "instance-of" || name == "array-length" -> listOf(registers[1] to RegisterUse.REF)
        name == "new-array" -> listOf(registers[1] to RegisterUse.INT)
        name == "if-eqz" || name == "if-nez" -> listOf(registers[0] to RegisterUse.INT_OR_REF)
        name == "if-eq" || name == "if-ne" -> registers.map { it to RegisterUse.INT_OR_REF }
        name.startsWith("if-") || name.endsWith("-switch") -> registers.map { it to RegisterUse.INT }
        name.startsWith("iget") -> listOf(registers[1] to RegisterUse.REF)
        name.startsWith("iput") -> listOf(registers[0] to field(), registers[1] to RegisterUse.REF)
        name.startsWith("sput") -> listOf(registers[0] to field())
        name.startsWith("aget") || name.startsWith("aput") -> {
            val element = when {
                name.startsWith("aget") -> null
                "wide" in name -> RegisterUse.WIDE
                "object" in name -> RegisterUse.REF
                name == "aput" -> RegisterUse.NARROW
                else -> RegisterUse.INT
            }
            listOfNotNull(element?.let { registers[0] to it }, registers[1] to RegisterUse.REF, registers[2] to RegisterUse.INT)
        }
        name.startsWith("filled-new-array") -> {
            val element = ((instruction as ReferenceInstruction).reference as TypeReference).type.substring(1)
            registers.map { it to typed(element) }
        }
        name.startsWith("invoke-polymorphic") || name.startsWith("invoke-custom") -> registers.map { it to RegisterUse.OTHER }
        name.startsWith("invoke") -> {
            val called = (instruction as ReferenceInstruction).reference as MethodReference
            val slots = mutableListOf<RegisterUse?>()
            if (!name.startsWith("invoke-static")) {
                slots += if (name.startsWith("invoke-direct") && called.name == "<init>") RegisterUse.RECEIVER else RegisterUse.REF
            }
            called.parameterTypes.forEach { type ->
                slots += typed(type.toString())
                if (type == "J" || type == "D") slots += null
            }
            registers.indices.mapNotNull { slot -> slots.getOrNull(slot)?.let { registers[slot] to it } }
        }
        name.startsWith("cmp") -> registers.drop(1).map { it to byName(name.substringAfter('-')) }
        "-to-" in name -> listOf(registers[1] to byName(name.substringBefore("-to-")))
        else -> {
            val operand = byName(name.substringBefore('/').substringAfterLast('-'))
            // Only a 2addr form reads its destination too.
            val read = if (name.endsWith("/2addr")) registers else registers.drop(1)
            read.mapIndexed { n, register -> register to if (shift && n == read.lastIndex) RegisterUse.INT else operand }
        }
    }
}

/**
 * The kind of every register on entry to each instruction of a method, worked out forwards to a
 * fixed point the way ART's verifier does it, closely enough to say whether a new jump changes
 * what a register holds where it lands. Only instructions that can throw lead to their handlers,
 * with what the registers held before them.
 */
class RegisterKinds private constructor(private val entry: Array<Array<RegisterKind>?>) {
    /** The registers on entry to [index], or null when nothing reaches it. */
    fun at(index: Int): List<RegisterKind>? = entry[index]?.toList()

    companion object {
        fun of(method: Method): RegisterKinds {
            val implementation = requireNotNull(method.implementation) { "Method has no implementation: $method" }
            val flow = ControlFlow.of(method)
            val instructions = flow.instructions
            val count = implementation.registerCount
            val address = IntArray(instructions.size + 1)
            for (index in instructions.indices) address[index + 1] = address[index] + instructions[index].codeUnits
            val caught = HashMap<Int, MutableSet<String?>>()
            implementation.tryBlocks.forEach { block ->
                block.exceptionHandlers.forEach { caught.getOrPut(it.handlerCodeAddress) { mutableSetOf() } += it.exceptionType }
            }

            val start = Array(count) { RegisterKind.UNUSABLE }
            var parameter = count - method.parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 } -
                if (method.isStatic()) 0 else 1
            if (!method.isStatic()) {
                start[parameter++] = if (method.name == "<init>") RegisterKind(RegisterKind.Tag.UNINIT, method.definingClass, -1)
                    else RegisterKind.ref(method.definingClass)
            }
            method.parameters.forEach { type ->
                val kinds = kindsOf(type.type)
                kinds.forEach { start[parameter++] = it }
            }

            val entry = arrayOfNulls<Array<RegisterKind>>(instructions.size)
            val pending = ArrayDeque<Int>()
            fun flowInto(index: Int, state: Array<RegisterKind>) {
                val old = entry[index]
                val merged = if (old == null) state.copyOf() else Array(count) { RegisterKind.merge(old[it], state[it]) }
                if (old == null || !merged.contentEquals(old)) {
                    entry[index] = merged
                    pending += index
                }
            }
            if (instructions.isNotEmpty()) flowInto(0, start)
            while (pending.isNotEmpty()) {
                val index = pending.removeFirst()
                val before = entry[index]!!
                val instruction = instructions[index]
                if (instruction.opcode.canThrow()) flow.exceptional[index].forEach { flowInto(it, before) }
                val after = before.copyOf()
                step(method, instructions, index, after, caught[address[index]])
                flow.normal[index].forEach { flowInto(it, after) }
            }
            return RegisterKinds(entry)
        }

        private fun Method.isStatic() = accessFlags and com.android.tools.smali.dexlib2.AccessFlags.STATIC.value != 0

        private fun kindsOf(type: String): List<RegisterKind> = when (type) {
            "J" -> listOf(RegisterKind(RegisterKind.Tag.LONG_LOW), RegisterKind(RegisterKind.Tag.LONG_HIGH))
            "D" -> listOf(RegisterKind(RegisterKind.Tag.DOUBLE_LOW), RegisterKind(RegisterKind.Tag.DOUBLE_HIGH))
            "F" -> listOf(RegisterKind.FLOAT)
            "Z", "B", "S", "C", "I" -> listOf(RegisterKind.INT)
            else -> listOf(RegisterKind.ref(type))
        }

        private fun narrowOf(type: String?) = when (type) {
            "F" -> RegisterKind.FLOAT
            null -> RegisterKind.NARROW
            else -> RegisterKind.INT
        }

        private fun wideOf(type: String?) = when (type) {
            "J" -> kindsOf("J")
            "D" -> kindsOf("D")
            else -> listOf(RegisterKind(RegisterKind.Tag.WIDE_LOW), RegisterKind(RegisterKind.Tag.WIDE_HIGH))
        }

        /** Writes [kinds] from [register] up, breaking any pair the write lands half on. */
        private fun write(state: Array<RegisterKind>, register: Int, kinds: List<RegisterKind>) {
            val last = register + kinds.size - 1
            if (state[register].tag.isHigh() && register > 0) state[register - 1] = RegisterKind.UNUSABLE
            if (state[last].tag.isLow() && last + 1 < state.size) state[last + 1] = RegisterKind.UNUSABLE
            kinds.forEachIndexed { offset, kind -> state[register + offset] = kind }
        }

        private fun RegisterKind.Tag.isLow() = wide && name.endsWith("LOW")
        private fun RegisterKind.Tag.isHigh() = wide && name.endsWith("HIGH")

        private fun step(method: Method, instructions: List<Instruction>, index: Int, state: Array<RegisterKind>, caught: Set<String?>?) {
            val instruction = instructions[index]
            val opcode = instruction.opcode
            // dexlib2's Opcode carries its smali spelling in `name`, which Kotlin resolves here.
            val name = opcode.name
            if (opcode == Opcode.INVOKE_DIRECT || opcode == Opcode.INVOKE_DIRECT_RANGE) {
                val called = (instruction as ReferenceInstruction).reference as MethodReference
                val receiver = instruction.namedRegisters().firstOrNull()
                val made = receiver?.let { state[it] }
                if (called.name == "<init>" && made?.tag == RegisterKind.Tag.UNINIT) {
                    for (register in state.indices) if (state[register] == made) state[register] = RegisterKind.ref(made.type)
                }
                return
            }
            if (!opcode.setsRegister()) return
            val destination = (instruction as OneRegisterInstruction).registerA
            val source = (instruction as? TwoRegisterInstruction)?.registerB
            fun reference() = (instruction as ReferenceInstruction).reference
            fun returned(): String? = when (val previous = instructions.getOrNull(index - 1)?.let { (it as? ReferenceInstruction)?.reference }) {
                is MethodReference -> previous.returnType
                is TypeReference -> previous.type
                else -> null
            }
            val kinds: List<RegisterKind> = when {
                name == "move" || name == "move/from16" || name == "move/16" ||
                    name == "move-object" || name == "move-object/from16" || name == "move-object/16" -> listOf(state[source!!])
                name.startsWith("move-wide") -> listOf(state[source!!], state[source + 1])
                name == "move-result" -> listOf(narrowOf(returned()))
                name == "move-result-wide" -> wideOf(returned())
                name == "move-result-object" -> listOf(RegisterKind.ref(returned()))
                name == "move-exception" -> {
                    val types = caught.orEmpty().map { it ?: "Ljava/lang/Throwable;" }.toSet()
                    listOf(RegisterKind.ref(types.singleOrNull()))
                }
                name.startsWith("const-wide") -> listOf(RegisterKind(RegisterKind.Tag.WIDE_CONST_LOW), RegisterKind(RegisterKind.Tag.WIDE_CONST_HIGH))
                name.startsWith("const-string") -> listOf(RegisterKind.ref("Ljava/lang/String;"))
                name == "const-class" -> listOf(RegisterKind.ref("Ljava/lang/Class;"))
                name.startsWith("const-method-handle") -> listOf(RegisterKind.ref("Ljava/lang/invoke/MethodHandle;"))
                name.startsWith("const-method-type") -> listOf(RegisterKind.ref("Ljava/lang/invoke/MethodType;"))
                name.startsWith("const") -> listOf(if ((instruction as NarrowLiteralInstruction).narrowLiteral == 0) RegisterKind.ZERO else RegisterKind.CONST)
                name == "check-cast" || name == "new-array" -> listOf(RegisterKind.ref((reference() as TypeReference).type))
                name == "new-instance" -> listOf(RegisterKind(RegisterKind.Tag.UNINIT, (reference() as TypeReference).type, index))
                name == "instance-of" || name == "array-length" -> listOf(RegisterKind.INT)
                name.startsWith("iget") || name.startsWith("sget") -> {
                    val type = (reference() as FieldReference).type
                    when {
                        "wide" in name -> wideOf(type)
                        "object" in name -> listOf(RegisterKind.ref(type))
                        else -> listOf(narrowOf(type))
                    }
                }
                name.startsWith("aget") -> {
                    val array = state[source!!].takeIf { it.tag == RegisterKind.Tag.REF }?.type
                    val element = array?.takeIf { it.startsWith("[") }?.substring(1)
                    when {
                        "wide" in name -> wideOf(element)
                        "object" in name -> listOf(RegisterKind.ref(element))
                        name == "aget" -> listOf(narrowOf(element))
                        else -> listOf(RegisterKind.INT)
                    }
                }
                name.startsWith("cmp") -> listOf(RegisterKind.INT)
                "-to-" in name -> resultOf(name.substringAfter("-to-"))
                else -> resultOf(name.substringBefore('/').substringAfterLast('-'))
            }
            write(state, destination, kinds)
        }

        /** An arithmetic or conversion result by the type its name ends in. */
        private fun resultOf(type: String): List<RegisterKind> = when (type) {
            "long" -> kindsOf("J")
            "double" -> kindsOf("D")
            "float" -> listOf(RegisterKind.FLOAT)
            "int", "byte", "char", "short" -> listOf(RegisterKind.INT)
            else -> throw IllegalArgumentException("No register kind for a $type result")
        }
    }
}

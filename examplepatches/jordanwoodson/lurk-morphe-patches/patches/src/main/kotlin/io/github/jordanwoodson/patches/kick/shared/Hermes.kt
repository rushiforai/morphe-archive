package io.github.jordanwoodson.patches.kick.shared

import app.morphe.patcher.patch.PatchException
import io.github.jordanwoodson.patches.kick.shared.Constants.KICK_VERSION
import io.github.jordanwoodson.patches.kick.shared.HermesOp.GET_BY_ID
import io.github.jordanwoodson.patches.kick.shared.HermesOp.JMP_TRUE
import io.github.jordanwoodson.patches.kick.shared.HermesOp.LOAD_CONST_UNDEFINED
import io.github.jordanwoodson.patches.kick.shared.HermesOp.MOV
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_ARRAY_WITH_BUFFER
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_ARRAY_WITH_BUFFER_LONG
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_OBJECT_WITH_BUFFER
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_OBJECT_WITH_BUFFER_AND_PARENT
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_OBJECT_WITH_BUFFER_LONG
import io.github.jordanwoodson.patches.kick.shared.HermesOp.PUT_OWN_BY_SLOT_IDX
import io.github.jordanwoodson.patches.kick.shared.HermesOp.RET
import io.github.jordanwoodson.patches.kick.shared.HermesOp.STRING_SWITCH
import io.github.jordanwoodson.patches.kick.shared.HermesOp.UINT_SWITCH
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

/**
 * The small part of Hermes Static v99 needed for bounded edits. Format reference:
 * https://github.com/facebook/hermes/blob/static_h/include/hermes/BCGen/HBC/BytecodeFileFormat.h
 * Opcode reference: the same branch's BytecodeList.def. Older Hermes main has a different layout.
 * No disassembled JavaScript is compiled, and no table, function or branch is relocated.
 */
internal class HermesBundle(input: ByteArray) {
    private val bytes = input.copyOf()
    private val strings: List<String>
    /** The small string table (one 32-bit entry per string: UTF-16 flag, storage offset, length) and the storage. */
    private val stringTable: Int
    private val stringStorage: Int
    private val stringStorageSize: Int
    /** Per string: its storage offset and byte length, whether its table entry holds them (not the overflow table). */
    private val stringOffsets: IntArray
    private val stringByteLengths: IntArray
    private val stringSmall: BooleanArray
    private val stringWide: BooleanArray
    /** Per string: whether it is an identifier (a property name), from the string-kind runs. */
    private val identifiers: BooleanArray
    /** Every function, by ID. Selection goes through [function], [functionUsing] and [sequence]. */
    val functions: List<HermesFunction>
    /** File offset of the literal value buffer, where array and object literals keep their values. */
    val literalStart: Int
    val literalSize: Int
    /** The object key buffer, and the shape table whose entries (key offset, property count) index it. */
    private val keyStart: Int
    private val keySize: Int
    private val shapeTable: Int
    private val shapeCount: Int
    private val changes = mutableListOf<HermesEdit>()
    val edits: List<HermesEdit> get() = changes.toList()

    init {
        ensure(bytes.size >= 148, "truncated header")
        ensure(bytes.copyOfRange(0, 8).contentEquals(hex("c61fbc03c103191f")), "invalid magic")
        ensure(u32(8) == 99, "expected Hermes v99")
        ensure(u32(32) == bytes.size, "file length does not match header")
        ensure(digest("SHA-1", bytes.copyOfRange(0, bytes.size - 20))
            .contentEquals(bytes.copyOfRange(bytes.size - 20, bytes.size)), "invalid SHA-1 footer")
        ensure(bytes.sha256() == SOURCE_SHA256, "unrecognized Kick ${KICK_VERSION} bundle")
        val functionCount = u32(40)
        val stringCount = u32(52)
        val overflowCount = u32(56)
        val stringStorageSize = u32(60)
        ensure(functionCount in 1..bytes.size / 12, "invalid function count")
        ensure(stringCount in 1..bytes.size / 4, "invalid string count")
        var cursor = checkedEnd(128, functionCount, 12)
        val kindTable = align(cursor)
        cursor = checkedEnd(kindTable, u32(44), 4) // String-kind runs.
        cursor = checkedEnd(align(cursor), u32(48), 4) // Identifier hashes.
        stringTable = align(cursor)
        cursor = checkedEnd(stringTable, stringCount, 4)
        val overflowTable = align(cursor)
        cursor = checkedEnd(overflowTable, overflowCount, 8)
        stringStorage = align(cursor)
        this.stringStorageSize = stringStorageSize
        cursor = checkedEnd(stringStorage, stringStorageSize, 1)
        // Each run is a count (low 31 bits) of strings of one kind, identifiers with the top bit set.
        identifiers = BooleanArray(stringCount)
        var kindCursor = 0
        for (run in 0 until u32(44)) {
            val entry = u32Bits(kindTable + run * 4)
            val count = (entry and 0x7fffffff).toInt()
            ensure(kindCursor + count <= stringCount, "string kinds overrun the string table")
            if (entry and 0x80000000L != 0L) identifiers.fill(true, kindCursor, kindCursor + count)
            kindCursor += count
        }
        ensure(kindCursor == stringCount, "string kinds don't cover the string table")
        stringOffsets = IntArray(stringCount)
        stringByteLengths = IntArray(stringCount)
        stringSmall = BooleanArray(stringCount)
        stringWide = BooleanArray(stringCount)
        strings = List(stringCount) { index ->
            val entry = u32Bits(stringTable + index * 4)
            val utf16 = entry and 1L != 0L
            var offset = ((entry ushr 1) and 0x7fffff).toInt()
            var length = (entry ushr 24).toInt()
            stringSmall[index] = length != 255
            if (length == 255) {
                ensure(offset < overflowCount, "string overflow index outside table")
                length = u32(overflowTable + offset * 8 + 4)
                offset = u32(overflowTable + offset * 8)
            }
            val byteLength = length.toLong() * if (utf16) 2 else 1
            ensure(offset.toLong() + byteLength <= stringStorageSize, "string outside storage")
            stringOffsets[index] = offset
            stringByteLengths[index] = byteLength.toInt()
            stringWide[index] = utf16
            String(bytes, stringStorage + offset, byteLength.toInt(),
                if (utf16) StandardCharsets.UTF_16LE else StandardCharsets.ISO_8859_1)
        }
        literalStart = align(cursor)
        literalSize = u32(80)
        cursor = checkedEnd(literalStart, literalSize, 1)
        keyStart = align(cursor)
        keySize = u32(84)
        cursor = checkedEnd(keyStart, keySize, 1)
        shapeTable = align(cursor)
        shapeCount = u32(88)
        checkedEnd(shapeTable, shapeCount, 8)
        functions = List(functionCount) { id ->
            val position = 128 + id * 12
            val first = u32Bits(position)
            val second = u32Bits(position + 4)
            val flags = u8(position + 11)
            val large = flags and 32 != 0
            val header = if (large) {
                ((first and 0x1ffffff) or (((second ushr 14) and 0xff) shl 24)).toInt()
            } else position
            if (large) checkedEnd(header, 36, 1)
            val offset = if (large) u32(header) else (first and 0x1ffffff).toInt()
            val size = if (large) u32(header + 12) else (second and 0x3fff).toInt()
            val name = if (large) u32(header + 16) else ((second ushr 14) and 0xff).toInt()
            val numbers = if (large) u32(header + 20) else ((second ushr 22) and 31).toInt()
            val nonPointers = if (large) u32(header + 24) else ((second ushr 27) and 31).toInt()
            val frame = if (large) u32(header + 28) else u8(header + 8)
            val actualFlags = if (large) u8(header + 35) else flags
            ensure(name < stringCount, "invalid function name index")
            checkedEnd(offset, size, 1)
            HermesFunction(id, strings[name], offset, bytes.copyOfRange(offset, offset + size),
                frame, numbers, nonPointers, actualFlags)
        }
    }

    /** Discover a Metro registration from unique export signatures in its factory, never a portable ID. */
    fun metroModule(exports: List<String>, direct: Boolean = false): Int {
        ensure(exports.isNotEmpty(), "empty Metro signature")
        val exportIds = exports.map(::stringId)
        val global = instructions(function("global"))
        val candidates = mutableListOf<Int>()
        for (index in 0 until global.size - 4) {
            val load = global[index]
            if (load.propertyId() != stringId("__d")) continue
            val id = global[index + 1]
            val deps = global[index + 2]
            val closure = global[index + 3]
            val call = global[index + 4]
            if (id.opcode !in setOf(0x8b, 0x8c) || deps.opcode !in setOf(0x07, 0x08, 0x09) ||
                closure.opcode != 0x84 || call.opcode != 0x70) continue
            // __d(factory, numericId, dependencies): require exact register flow.
            if (call.u8(2) != load.u8(1) || call.u8(4) != closure.u8(1) ||
                call.u8(5) != id.u8(1) || call.u8(6) != deps.u8(1)) continue
            val factory = functions.getOrNull(closure.u16(3)) ?: continue
            val body = instructions(factory)
            if (exportIds.all { expected -> body.any { instruction ->
                    (!direct && instruction.stringLoaded() == expected) ||
                        (instruction.opcode == 0x4b && instruction.u16(4) == expected)
                } }) candidates += if (id.opcode == 0x8b) id.u8(2) else id.u32(2)
        }
        return candidates.singleOrNull() ?: fail("expected one Metro factory exporting ${exports.joinToString()}")
    }

    fun stringId(value: String): Int = strings.indexOf(value).also { ensure(it >= 0, "missing string $value") }

    fun function(name: String): HermesFunction = functions.filter { it.name == name }.singleOrNull()
        ?: fail("expected one function named $name")

    /**
     * The one function that reads every property in [reads] (GetById and its variants) and loads every
     * string in [loads], for anonymous functions. Built from string IDs, so it survives a reordered
     * string table, unlike a byte anchor.
     */
    fun functionUsing(what: String, reads: List<String> = emptyList(), loads: List<String> = emptyList()): HermesFunction {
        ensure(reads.isNotEmpty() || loads.isNotEmpty(), "empty function description")
        val properties = reads.map(::stringId)
        val constants = loads.map(::stringId)
        return functions.filter { function ->
            if (function.body.isEmpty()) return@filter false
            val instructions = runCatching { instructions(function) }.getOrNull() ?: return@filter false
            properties.all { id -> instructions.any { it.propertyId() == id } } &&
                constants.all { id -> instructions.any { it.stringLoaded() == id } }
        }.singleOrNull() ?: fail("expected one $what function")
    }

    /**
     * [function]'s instructions, decoded with the v99 length table, to the end of its declared bytecode. A switch's
     * jump table follows that bytecode, outside the function's size, and its entries become the switch's
     * [HermesInstruction.targets].
     */
    fun instructions(function: HermesFunction): List<HermesInstruction> {
        val body = function.body
        val result = mutableListOf<HermesInstruction>()
        var offset = 0
        while (offset < body.size) {
            val opcode = body[offset].toInt() and 255
            ensure(opcode < LENGTHS.length, "unknown opcode $opcode in ${function.label}")
            val length = LENGTHS[opcode].digitToInt(36)
            ensure(offset + length <= body.size, "truncated instruction in ${function.label}")
            val bytes = body.copyOfRange(offset, offset + length)
            result += if (opcode == UINT_SWITCH || opcode == STRING_SWITCH) {
                HermesInstruction(offset, opcode, bytes, switchTargets(function, HermesInstruction(offset, opcode, bytes)))
            } else HermesInstruction(offset, opcode, bytes)
            offset += length
        }
        return result
    }

    /**
     * A switch's default, then each case, from the function start. UIntSwitchImm is (value, table, default, min, max)
     * and its table one 32-bit offset per value from min to max; StringSwitchImm is (value, string set, table,
     * default, count) and its table a (string ID, offset) pair per case. Offsets count from the switch. The table
     * operand points past the function's declared bytecode, and the table starts at the next 4-byte boundary of the
     * file (the interpreter aligns the mapped address).
     */
    private fun switchTargets(function: HermesFunction, switch: HermesInstruction): List<Int> {
        val uint = switch.opcode == UINT_SWITCH
        val table = if (uint) switch.u32(2) else switch.u32(6)
        val default = if (uint) switch.u32(6) else switch.u32(10)
        val count = if (uint) switch.u32(14).toLong() - switch.u32(10) + 1 else switch.u32(14).toLong()
        val width = if (uint) 4 else 8
        ensure(table > 0 && count in 1..bytes.size / width.toLong(), "invalid switch table in ${function.label}")
        val start = align(function.offset + switch.offset + table)
        checkedEnd(start, count.toInt(), width)
        return listOf(switch.offset + default) + (0 until count.toInt()).map { case ->
            switch.offset + u32Bits(start + case * width + width - 4).toInt()
        }
    }

    /**
     * The property names of the object literal [instruction] creates (NewObjectWithBuffer or its long form),
     * in slot order, which is the order PutOwnBySlotIdx fills them. A key that isn't a string is null.
     */
    fun objectKeys(instruction: HermesInstruction): List<String?> {
        val shape = when (instruction.opcode) {
            NEW_OBJECT_WITH_BUFFER -> instruction.u16(2)
            NEW_OBJECT_WITH_BUFFER_LONG -> instruction.u32(2)
            else -> fail("not an object literal instruction")
        }
        ensure(shape in 0 until shapeCount, "object shape outside the table")
        var cursor = keyStart + u32(shapeTable + shape * 8)
        val count = u32(shapeTable + shape * 8 + 4)
        val keys = mutableListOf<String?>()
        // Serialized literals: a tag (type in bits 4-6, run length in the low bits, 12 bits if bit 7 is set),
        // then the run's values.
        while (keys.size < count) {
            ensure(cursor < keyStart + keySize, "object keys outside the key buffer")
            val tag = u8(cursor++)
            val run = if (tag and 0x80 != 0) ((tag and 0x0f) shl 8) or u8(cursor++) else tag and 0x0f
            val type = (tag ushr 4) and 7
            val width = intArrayOf(0, 0, 0, 8, 4, 2, 1, 4)[type]
            repeat(run) {
                ensure(cursor + width <= keyStart + keySize, "object keys outside the key buffer")
                keys += when (type) {
                    4 -> strings.getOrNull(u32(cursor))
                    5 -> strings.getOrNull(u8(cursor) or (u8(cursor + 1) shl 8))
                    6 -> strings.getOrNull(u8(cursor))
                    else -> null
                }
                cursor += width
            }
        }
        ensure(keys.size == count, "object key run overruns its shape")
        return keys
    }

    /** An anonymous function must be selected by a unique bytecode anchor, never its build-local ID. */
    fun matchingFunction(anchor: ByteArray): HermesFunction {
        ensure(anchor.isNotEmpty(), "empty function anchor")
        return functions.filter { it.body.positions(anchor).isNotEmpty() }.singleOrNull()
            ?: fail("expected one function with bytecode anchor ${anchor.toHex()}")
    }

    /**
     * GetById's encoding with the property's string ID of this bundle, for patterns and anchors. Registers
     * and the cache index come from the function; only the ID differs between app versions.
     */
    fun getById(result: Int, objectRegister: Int, cache: Int, property: String): ByteArray {
        val id = stringId(property)
        ensure(id <= 0xffff, "$property needs the long GetById form")
        return byteArrayOf(GET_BY_ID.toByte(), result.toByte(), objectRegister.toByte(), cache.toByte(),
            id.toByte(), (id ushr 8).toByte())
    }

    /** Functions with [name] and a body; a generator's wrapper and body share their name. */
    fun functionsNamed(name: String): List<HermesFunction> = functions.filter { it.name == name && it.body.isNotEmpty() }

    /** Matches an instruction reading [property] by any GetById variant. */
    fun reads(property: String): (HermesInstruction) -> Boolean {
        val id = stringId(property)
        return { it.propertyId() == id }
    }

    /** Matches an object literal instruction whose keys are exactly [keys]. */
    fun creates(vararg keys: String): (HermesInstruction) -> Boolean = {
        it.opcode in setOf(NEW_OBJECT_WITH_BUFFER, NEW_OBJECT_WITH_BUFFER_LONG) && objectKeys(it) == keys.toList()
    }

    /**
     * The one run of consecutive instructions in [candidates] that matches [steps] in order and passes
     * [accept] (register flow). Opcodes, registers, strings and object keys select it, never the shape
     * or literal numbers, which every app version renumbers.
     */
    fun sequence(what: String, candidates: List<HermesFunction>, steps: List<(HermesInstruction) -> Boolean>,
                 accept: (List<HermesInstruction>) -> Boolean = { true }): Pair<HermesFunction, List<HermesInstruction>> {
        ensure(steps.isNotEmpty(), "empty instruction sequence")
        val found = candidates.flatMap { function ->
            val instructions = instructions(function)
            (0..instructions.size - steps.size).mapNotNull { start ->
                val run = instructions.subList(start, start + steps.size)
                if (run.indices.all { steps[it](run[it]) } && accept(run)) function to run else null
            }
        }
        return found.singleOrNull() ?: fail("expected one $what, found ${found.size}")
    }

    /** Replaces one decoded instruction of [function] with [after], of the same length. */
    fun replaceInstruction(function: HermesFunction, key: String, instruction: HermesInstruction, after: ByteArray,
                           defaultEnabled: Boolean = true) =
        add(function, key, instruction.offset, instruction.bytes, after, defaultEnabled)

    /**
     * Every array and object literal instruction that reads the literal value buffer, with the bytes its
     * values occupy. Functions sharing one body are listed once. Fails if any function doesn't decode, so
     * a check over these readers can't miss one.
     */
    val literals: List<HermesLiteral> by lazy {
        val seen = HashSet<Int>()
        functions.filter { it.body.isNotEmpty() && seen.add(it.offset) }.flatMap { function ->
            instructions(function).mapNotNull { instruction ->
                val (count, start) = when (instruction.opcode) {
                    NEW_OBJECT_WITH_BUFFER -> shapeSize(instruction.u16(2)) to instruction.u16(4)
                    NEW_OBJECT_WITH_BUFFER_LONG -> shapeSize(instruction.u32(2)) to instruction.u32(6)
                    NEW_OBJECT_WITH_BUFFER_AND_PARENT -> shapeSize(instruction.u32(3)) to instruction.u32(7)
                    NEW_ARRAY_WITH_BUFFER -> instruction.u16(4) to instruction.u16(6)
                    NEW_ARRAY_WITH_BUFFER_LONG -> instruction.u16(4) to instruction.u32(6)
                    else -> return@mapNotNull null
                }
                val keys = when (instruction.opcode) {
                    NEW_OBJECT_WITH_BUFFER, NEW_OBJECT_WITH_BUFFER_LONG -> objectKeys(instruction)
                    else -> null
                }
                HermesLiteral(function, instruction, keys, start, valuesEnd(start, count))
            }
        }
    }

    /** The literals whose values cover any byte of the value-buffer range [start, end). */
    fun literalsReading(start: Int, end: Int): List<HermesLiteral> = literals.filter { it.start < end && start < it.end }

    /**
     * The array literals stored into [literal]'s slots right after the object is created: each a
     * NewArrayWithBuffer into a register, then PutOwnBySlotIdx of that register into the object. By slot.
     */
    fun slotArrays(literal: HermesLiteral): Map<Int, HermesLiteral> {
        val instructions = instructions(literal.function)
        val register = literal.instruction.u8(1)
        var index = instructions.indexOfFirst { it.offset == literal.instruction.offset } + 1
        ensure(index > 0, "literal outside its function")
        val result = mutableMapOf<Int, HermesLiteral>()
        while (index + 1 < instructions.size) {
            val array = instructions[index]
            val put = instructions[index + 1]
            if (array.opcode !in setOf(NEW_ARRAY_WITH_BUFFER, NEW_ARRAY_WITH_BUFFER_LONG) ||
                put.opcode != PUT_OWN_BY_SLOT_IDX || put.u8(1) != register || put.u8(2) != array.u8(1)) break
            val read = literals.single { it.function.offset == literal.function.offset && it.instruction.offset == array.offset }
            ensure(result.put(put.u8(3), read) == null, "slot ${put.u8(3)} assigned twice")
            index += 2
        }
        return result
    }

    /** How many properties object literals of [shape] have. */
    fun shapeSize(shape: Int): Int {
        ensure(shape in 0 until shapeCount, "object shape outside the table")
        return u32(shapeTable + shape * 8 + 4)
    }

    /**
     * Where [count] serialized literal values starting at [start] end, in value-buffer offsets. Value tags:
     * null, true, false, number (8 bytes), long string (4), short string (2), undefined, integer (4).
     */
    fun valuesEnd(start: Int, count: Int): Int {
        var cursor = start
        var items = 0
        while (items < count) {
            ensure(cursor < literalSize, "literal values outside the value buffer")
            val tag = u8(literalStart + cursor++)
            val run = if (tag and 0x80 != 0) ((tag and 0x0f) shl 8) or u8(literalStart + cursor++) else tag and 0x0f
            cursor += run * intArrayOf(0, 0, 0, 8, 4, 2, 0, 4)[(tag ushr 4) and 7]
            items += run
        }
        ensure(items == count && cursor <= literalSize, "literal value run overruns its count")
        return cursor
    }

    fun returnNull(functionName: String, key: String, defaultEnabled: Boolean = true) {
        val function = function(functionName)
        ensure(function.flags and 0x18 == 0, "$functionName has exception/debug metadata")
        val body = function.body
        ensure(body.size >= 9 && body[0].toInt() and 255 == 0x34,
            "$functionName has an unexpected prologue")
        val length = when (body[3].toInt() and 255) {
            0x40, 0x89 -> 6 // GetParentEnvironment, then CreateFunctionEnvironment or LoadParam.
            0x41 -> 9 // GetParentEnvironment, CreateTopLevelEnvironment.
            else -> fail("$functionName has an unexpected environment instruction")
        }
        // A jump into the replaced bytes would land on the Unreachable padding, which aborts the process. add()
        // checks every edit for that too; this keeps returnAtEntry's message.
        ensure(instructions(function).none { instruction -> instruction.targets().any { it in 1 until length } },
            "$functionName branches into its prologue")
        val register = generalRegister(function)
        val replacement = ByteArray(length)
        byteArrayOf(Constant.NULL.opcode, register.toByte(), RET.toByte(), register.toByte()).copyInto(replacement)
        // Unreachable (0) pads through the last replaced instruction boundary, after Ret.
        add(function, key, 0, body.copyOfRange(0, length), replacement, defaultEnabled)
    }

    /**
     * Returns [value] as the function's first instruction. Accepts any prologue made of environment,
     * parameter and property loads, which [returnNull] doesn't. Every call returns before any hook or
     * branch, so React hook order stays the same for the process (edits are restart-gated).
     */
    fun returnAtEntry(function: HermesFunction, key: String, value: Constant = Constant.NULL,
                      defaultEnabled: Boolean = true) {
        ensure(function.flags and 0x18 == 0, "${function.label} has exception/debug metadata")
        val instructions = instructions(function)
        var length = 0
        for (instruction in instructions) {
            if (length >= 4) break
            ensure(instruction.opcode in PROLOGUE, "${function.label} has an unexpected prologue instruction at $length")
            length += instruction.bytes.size
        }
        ensure(length >= 4, "${function.label} is too short")
        ensure(instructions.none { instruction -> instruction.targets().any { it in 1 until length } },
            "${function.label} branches into its prologue")
        val register = generalRegister(function)
        val replacement = ByteArray(length)
        byteArrayOf(value.opcode, register.toByte(), RET.toByte(), register.toByte()).copyInto(replacement)
        // Unreachable (0) pads through the last replaced instruction boundary, after Ret.
        add(function, key, 0, function.body.copyOfRange(0, length), replacement, defaultEnabled)
    }

    fun returnAtEntry(functionName: String, key: String, value: Constant = Constant.NULL, defaultEnabled: Boolean = true) =
        returnAtEntry(function(functionName), key, value, defaultEnabled)

    /**
     * For handlers that open with `if (!event) return;`. The guard's JmpTrue becomes a Mov of the tested
     * register onto itself, so the handler always reaches its `return undefined` and nothing after the
     * guard runs. The guard is the first JmpTrue: either followed by `LoadConstUndefined rU; Ret rU`, or
     * between those two instructions.
     */
    fun skipGuard(function: HermesFunction, key: String, defaultEnabled: Boolean = true) {
        ensure(function.flags and 0x18 == 0, "${function.label} has exception/debug metadata")
        val instructions = instructions(function)
        ensure(instructions.none { it.opcode == UINT_SWITCH || it.opcode == STRING_SWITCH }, "${function.label} has a switch")
        val index = instructions.indexOfFirst { it.opcode == JMP_TRUE }
        ensure(index >= 0, "${function.label} has no guard")
        val guard = instructions[index]
        val previous = instructions.getOrNull(index - 1)
        val next = instructions.getOrNull(index + 1)
        val after = instructions.getOrNull(index + 2)
        fun undefined(load: HermesInstruction?, ret: HermesInstruction?) = load?.opcode == LOAD_CONST_UNDEFINED &&
            ret?.opcode == RET && load.u8(1) == ret.u8(1)
        ensure(undefined(next, after) || undefined(previous, next), "${function.label} guard doesn't return undefined")
        ensure(guard.target()!! > guard.offset, "${function.label} guard jumps backwards")
        ensure(instructions.none { it !== guard && guard.offset in it.targets() }, "${function.label} branches to its guard")
        val tested = guard.bytes[2]
        add(function, key, guard.offset, guard.bytes, byteArrayOf(MOV.toByte(), tested, tested), defaultEnabled)
    }

    /**
     * A choice edit inside the literal value buffer, [offset] bytes from its start: a value array and object
     * literals read, such as a number or a string ID. Each choice value in [values] writes its bytes, and any
     * other value, normally "0", keeps [before]; the patched APK ships the bytes of [defaultValue]. Hermes shares
     * value bytes between literals, so the literals reading the edited bytes must be exactly [readers];
     * verify_literals.py checks the same.
     */
    fun dataChoice(offset: Int, key: String, before: ByteArray, values: Map<String, ByteArray>,
                   readers: Collection<HermesLiteral>, defaultValue: String = "0"): HermesEdit {
        ensure(values.isNotEmpty() && values.values.all { it.size == before.size }, "choice must preserve literal length")
        ensure((values.keys + defaultValue).all { it.matches(Regex("-?[0-9]+")) }, "choice values must be numbers")
        onlyReaders(offset, before.size, readers, key)
        val copies = values.mapValues { it.value.copyOf() }
        return record(HermesEdit(key, literal(offset, before), before.copyOf(), before.copyOf(), false, DATA,
            copies, defaultValue))
    }

    /**
     * A switch edit inside the literal value buffer, [offset] bytes from its start: while [key] is on, the literals
     * read [after] instead of [before]. The literals reading the edited bytes must be exactly [readers].
     */
    fun dataSwitch(offset: Int, key: String, before: ByteArray, after: ByteArray, readers: Collection<HermesLiteral>,
                   defaultEnabled: Boolean = true): HermesEdit {
        ensure(before.isNotEmpty() && before.size == after.size, "edit must preserve literal length")
        onlyReaders(offset, before.size, readers, key)
        return record(HermesEdit(key, literal(offset, before), before.copyOf(), after.copyOf(), defaultEnabled, DATA))
    }

    /**
     * The values of [literal] in slot order: each one's type tag (4 long string, 5 short string, 3 number, 7
     * integer, others without bytes), its value (a string ID for strings) and where its bytes are, as a
     * value-buffer offset and width.
     */
    fun literalValues(literal: HermesLiteral): List<HermesLiteralValue> {
        val values = mutableListOf<HermesLiteralValue>()
        var cursor = literal.start
        while (cursor < literal.end) {
            val tag = u8(literalStart + cursor++)
            val run = if (tag and 0x80 != 0) ((tag and 0x0f) shl 8) or u8(literalStart + cursor++) else tag and 0x0f
            val type = (tag ushr 4) and 7
            val width = intArrayOf(0, 0, 0, 8, 4, 2, 0, 4)[type]
            repeat(run) {
                val value = when (width) {
                    2 -> u8(literalStart + cursor).toLong() or (u8(literalStart + cursor + 1).toLong() shl 8)
                    4 -> u32Bits(literalStart + cursor)
                    else -> 0L
                }
                values += HermesLiteralValue(type, value, cursor, width)
                cursor += width
            }
        }
        ensure(cursor == literal.end, "literal values overrun")
        return values
    }

    /** The text of string [id]. */
    fun string(id: Int): String = strings.getOrNull(id) ?: fail("string $id outside the table")

    /**
     * Every instruction, in every function, that loads string [id] with LoadConstString, as (function, instruction).
     * Functions sharing one body are listed once.
     */
    fun stringLoads(id: Int): List<Pair<HermesFunction, HermesInstruction>> {
        val seen = HashSet<Int>()
        return functions.filter { it.body.isNotEmpty() && seen.add(it.offset) }.flatMap { function ->
            instructions(function).filter { it.stringLoaded() == id }.map { function to it }
        }
    }

    /**
     * Rewrites string [id] to [text] while [key] is on: its first bytes in the string storage and the length in its
     * string table entry, two equal-length edits. [text] must be ASCII and no longer than the string. Every use of
     * the string reads the new text, so only one that nothing else uses can be rewritten: no property name
     * (identifier), no function name, object key or string switch case, no storage byte shared with another
     * string (Hermes packs strings into each other), loaded by exactly [loads] and read by exactly [readers].
     */
    fun rewriteString(id: Int, text: String, key: String, loads: Collection<Pair<HermesFunction, HermesInstruction>>,
                      readers: Collection<HermesLiteral>, defaultEnabled: Boolean = true) {
        val original = string(id)
        val label = "string \"$original\""
        ensure(text.isNotEmpty() && text.length <= original.length && text.all { it.code in 0x20..0x7e },
            "$label can't hold \"$text\"")
        ensure(!identifiers[id] && stringSmall[id] && !stringWide[id], "$label is not a short one-byte literal string")
        val start = stringOffsets[id]
        val end = start + stringByteLengths[id]
        ensure(stringOffsets.indices.none { other ->
            other != id && stringOffsets[other] < end && start < stringOffsets[other] + stringByteLengths[other]
        }, "$label shares storage with another string")
        ensure(functions.none { it.name == original }, "$label names a function")
        ensure((0 until shapeCount).none { shape -> id in shapeKeyIds(shape) }, "$label is an object key")
        ensure(functions.filter { it.body.isNotEmpty() }.none { function ->
            instructions(function).any { it.opcode == STRING_SWITCH && id in stringSwitchCases(function, it) }
        }, "$label is a string switch case")
        fun position(load: Pair<HermesFunction, HermesInstruction>) = load.first.offset + load.second.offset
        ensure(stringLoads(id).map(::position).toSet() == loads.map(::position).toSet(), "$label is loaded elsewhere")
        val read = literals.filter { literal ->
            literalValues(literal).any { it.type in setOf(4, 5) && it.value == id.toLong() }
        }.map { it.function.offset + it.instruction.offset }.toSet()
        ensure(read == readers.map { it.function.offset + it.instruction.offset }.toSet(), "$label is read by other literals")
        val entry = stringTable + id * 4 + 3
        record(HermesEdit(key, entry, byteArrayOf(bytes[entry]), byteArrayOf(text.length.toByte()), defaultEnabled, DATA))
        val storage = stringStorage + start
        record(HermesEdit(key, storage, bytes.copyOfRange(storage, storage + text.length),
            text.toByteArray(StandardCharsets.ISO_8859_1), defaultEnabled, DATA))
    }

    /** The string IDs of the keys of object [shape]. */
    private fun shapeKeyIds(shape: Int): List<Int> {
        var cursor = keyStart + u32(shapeTable + shape * 8)
        val count = u32(shapeTable + shape * 8 + 4)
        val ids = mutableListOf<Int>()
        var items = 0
        while (items < count) {
            ensure(cursor < keyStart + keySize, "object keys outside the key buffer")
            val tag = u8(cursor++)
            val run = if (tag and 0x80 != 0) ((tag and 0x0f) shl 8) or u8(cursor++) else tag and 0x0f
            val type = (tag ushr 4) and 7
            val width = intArrayOf(0, 0, 0, 8, 4, 2, 1, 4)[type]
            repeat(run) {
                when (type) {
                    4 -> ids += u32(cursor)
                    5 -> ids += u8(cursor) or (u8(cursor + 1) shl 8)
                    6 -> ids += u8(cursor)
                }
                cursor += width
            }
            items += run
        }
        return ids
    }

    /** The string IDs of a StringSwitchImm's cases, from its (string ID, offset) jump table. */
    private fun stringSwitchCases(function: HermesFunction, switch: HermesInstruction): List<Int> {
        val start = align(function.offset + switch.offset + switch.u32(6))
        return (0 until switch.u32(14)).map { case -> u32(start + case * 8) }
    }

    /**
     * Replaces the consecutive instructions [run] of [function] with [after], of the same total length. The usual
     * branch checks apply: nothing may jump into the replaced bytes past their first instruction.
     */
    fun replaceInstructions(function: HermesFunction, key: String, run: List<HermesInstruction>, after: ByteArray,
                            defaultEnabled: Boolean = true): HermesEdit {
        ensure(run.isNotEmpty() && run.zipWithNext().all { (a, b) -> a.offset + a.bytes.size == b.offset },
            "instructions to replace are not consecutive")
        val before = run.fold(ByteArray(0)) { all, instruction -> all + instruction.bytes }
        return add(function, key, run.first().offset, before, after, defaultEnabled)
    }

    private fun onlyReaders(offset: Int, length: Int, readers: Collection<HermesLiteral>, key: String) {
        ensure(readers.isNotEmpty(), "$key names no literal readers")
        fun HermesLiteral.position() = function.offset + instruction.offset
        val actual = literalsReading(offset, offset + length).map { it.position() }.toSet()
        ensure(actual == readers.map { it.position() }.toSet(), "$key: other literals share the edited values")
    }

    /** The literal value buffer's bytes at [offset], for checking a value before editing it. */
    fun literal(offset: Int, length: Int): ByteArray {
        ensure(offset >= 0 && length > 0 && offset.toLong() + length <= literalSize, "range outside the literal buffer")
        return bytes.copyOfRange(literalStart + offset, literalStart + offset + length)
    }

    private fun literal(offset: Int, before: ByteArray): Int {
        literal(offset, before.size)
        return literalStart + offset
    }

    fun replace(functionName: String, key: String, before: ByteArray, after: ByteArray,
                defaultEnabled: Boolean = true) = replace(function(functionName), key, before, after, defaultEnabled)

    fun replaceMatchingFunction(anchor: ByteArray, key: String, before: ByteArray, after: ByteArray,
                                defaultEnabled: Boolean = true) =
        replace(matchingFunction(anchor), key, before, after, defaultEnabled)

    fun replace(function: HermesFunction, key: String, before: ByteArray, after: ByteArray,
                defaultEnabled: Boolean = true) {
        ensure(before.isNotEmpty(), "empty bytecode pattern")
        val offset = function.body.positions(before).singleOrNull()
            ?: fail("expected one pattern in ${function.name.ifEmpty { "anonymous function" }}")
        add(function, key, offset, before, after, defaultEnabled)
    }

    fun replaceBody(functionName: String, key: String, body: ByteArray, defaultEnabled: Boolean = true): HermesEdit {
        val function = function(functionName)
        return add(function, key, 0, function.body, body, defaultEnabled)
    }

    private fun add(function: HermesFunction, key: String, relative: Int, before: ByteArray,
                    after: ByteArray, defaultEnabled: Boolean): HermesEdit {
        ensure(before.size == after.size && before.isNotEmpty(), "edit must preserve bytecode length")
        ensure(functions.count { it.offset == function.offset && it.body.isNotEmpty() } == 1,
            "function bytecode is shared")
        ensure(relative >= 0 && relative.toLong() + before.size <= function.body.size, "edit outside function")
        checkBranches(function, relative, before, after)
        return record(HermesEdit(key, function.offset + relative, before.copyOf(), after.copyOf(), defaultEnabled,
            function.id))
    }

    /**
     * Fails unless replacing [before] at [relative] with [after] keeps every branch landing where it did. The edit
     * must start and end on instruction boundaries, the code after it must decode as before, and no jump or switch
     * case may land after the first changed byte and on or before the last one: that would run the replacement from
     * its middle, or from Unreachable padding, which aborts the process. Equal-length edits keep every other byte, so
     * a branch elsewhere still finds the instructions it found before.
     */
    private fun checkBranches(function: HermesFunction, relative: Int, before: ByteArray, after: ByteArray) {
        val label = "${function.label} (function ${function.id})"
        val end = relative + before.size
        val original = instructions(function).map { it.offset }.toSet() + function.body.size
        ensure(relative in original && end in original, "$label: edit at $relative splits an instruction")
        val changed = before.indices.filter { before[it] != after[it] }
        if (changed.isEmpty()) return
        val first = relative + changed.first()
        val last = relative + changed.last()
        val editedBody = function.body.copyOf().also { after.copyInto(it, relative) }
        val edited = instructions(function.copy(body = editedBody))
        val boundaries = edited.map { it.offset }.toSet() + function.body.size
        ensure(end in boundaries, "$label: edit at $relative changes how the code after it decodes")
        for (instruction in edited) for (target in instruction.targets()) {
            ensure(target in 0 until function.body.size, "$label: branch at ${instruction.offset} leaves the function")
            ensure(target !in (first + 1)..last, "$label: branch at ${instruction.offset} lands inside the edited bytes at $target")
            ensure(target != first || first in boundaries,
                "$label: branch at ${instruction.offset} lands inside an edited instruction at $target")
        }
    }

    private fun record(edit: HermesEdit): HermesEdit {
        val offset = edit.offset
        val size = edit.original.size
        ensure(edit.key.matches(Regex("[a-z][a-z0-9_]*")), "invalid setting key")
        ensure(size > 0, "empty edit")
        ensure(bytes.copyOfRange(offset, offset + size).contentEquals(edit.original), "original bytes differ")
        ensure(changes.none { offset < it.offset + it.original.size && it.offset < offset + size },
            "overlapping Hermes edits")
        // The runtime loader keeps one value per key: a switch or a choice, with one default.
        ensure(changes.filter { it.key == edit.key }.all {
            (it.values == null) == (edit.values == null) && it.defaultEnabled == edit.defaultEnabled &&
                it.defaultValue == edit.defaultValue
        }, "${edit.key} mixes edit kinds or defaults")
        changes += edit
        return edit
    }

    /**
     * Full original function bodies make Morphe's first-match byte replacement unambiguous. Literal
     * edits get the shortest window around them, in steps of 8 bytes, whose original bytes are unique.
     */
    fun replacements(): Set<Pair<String, String>> {
        val code = changes.filter { it.functionId != DATA }.groupBy { it.functionId }.map { (id, edits) ->
            val function = functions[id]
            ensure(bytes.positions(function.body).singleOrNull() == function.offset,
                "function pattern is not globally unique")
            val replacement = function.body.copyOf()
            edits.forEach { it.embedded.copyInto(replacement, it.offset - function.offset) }
            function.body.toHex() to replacement.toHex()
        }
        val data = dataWindows().map { window ->
            val original = bytes.copyOfRange(window.first, window.last + 1)
            val replacement = original.copyOf()
            changes.filter { it.functionId == DATA && it.offset in window }
                .forEach { it.embedded.copyInto(replacement, it.offset - window.first) }
            original.toHex() to replacement.toHex()
        }
        return (code + data).toSet()
    }

    private fun dataWindows(): List<IntRange> {
        // Data edits are literal values or strings (table entries and storage); a window stays in its edit's region.
        val regions = listOf(
            literalStart until literalStart + literalSize,
            stringTable until stringTable + strings.size * 4,
            stringStorage until stringStorage + stringStorageSize,
        )
        fun region(window: IntRange) = regions.singleOrNull { window.first in it && window.last in it }
            ?: fail("data edit outside the literal buffer and string tables")
        var windows = changes.filter { it.functionId == DATA }.sortedBy { it.offset }
            .map { it.offset until it.offset + it.original.size }
        while (true) {
            // Merge windows that touch, then widen each one whose bytes also occur elsewhere.
            windows = windows.fold(mutableListOf<IntRange>()) { merged, window ->
                val last = merged.lastOrNull()
                if (last != null && window.first <= last.last + 1) {
                    merged[merged.size - 1] = last.first..maxOf(last.last, window.last)
                } else merged += window
                merged
            }
            val ambiguous = windows.indexOfFirst { bytes.positions(bytes.copyOfRange(it.first, it.last + 1)).size != 1 }
            if (ambiguous < 0) return windows
            val window = windows[ambiguous]
            ensure(window.last - window.first < 256, "no unique window around data edit at ${window.first}")
            val bounds = region(window)
            windows = windows.toMutableList().also {
                it[ambiguous] = maxOf(bounds.first, window.first - 8)..minOf(bounds.last, window.last + 8)
            }
        }
    }

    fun preview(): ByteArray = bytes.copyOf().also { result ->
        changes.forEach { it.embedded.copyInto(result, it.offset) }
        digest("SHA-1", result.copyOfRange(0, result.size - 20)).copyInto(result, result.size - 20)
    }

    /**
     * The runtime loader's edit list. A switch edit has `replacement` and a boolean `default`; a choice
     * edit has `values` (choice value to bytes) and the choice value it ships with as `default`.
     */
    fun manifest(): String {
        val entries = changes.sortedBy { it.offset }.joinToString(",") {
            "{\"key\":\"${it.key}\",\"offset\":${it.offset},\"original\":\"${it.original.toHex()}\"," +
                if (it.values == null) {
                    "\"replacement\":\"${it.replacement.toHex()}\",\"default\":${it.defaultEnabled}}"
                } else {
                    it.values.entries.joinToString(",", "\"values\":{", "}") { (value, replacement) ->
                        "\"$value\":\"${replacement.toHex()}\""
                    } + ",\"default\":\"${it.defaultValue}\"}"
                }
        }
        return "{\"format\":2,\"version\":99,\"sourceSha256\":\"$SOURCE_SHA256\"," +
            "\"embeddedSha256\":\"${preview().sha256()}\",\"edits\":[$entries]}"
    }

    private fun u8(offset: Int): Int = bytes[offset].toInt() and 255
    private fun u32Bits(offset: Int): Long {
        checkedEnd(offset, 4, 1)
        return (0..3).fold(0L) { value, index -> value or (u8(offset + index).toLong() shl (8 * index)) }
    }
    private fun u32(offset: Int): Int = u32Bits(offset).also {
        ensure(it <= Int.MAX_VALUE, "integer outside supported file size")
    }.toInt()
    private fun checkedEnd(offset: Int, count: Int, size: Int): Int {
        val end = offset.toLong() + count.toLong() * size
        ensure(offset >= 0 && count >= 0 && end <= bytes.size - 20, "table or function outside bundle")
        return end.toInt()
    }
    private fun align(offset: Int) = (offset + 3) and -4

    private fun generalRegister(function: HermesFunction): Int {
        val register = function.numberRegisters + function.nonPointerRegisters
        ensure(register in 0..255 && register < function.frameSize, "${function.label} has no general register")
        return register
    }

    /** A loaded constant: the opcode that writes it into a register. */
    enum class Constant(val opcode: Byte) {
        UNDEFINED(HermesOp.LOAD_CONST_UNDEFINED.toByte()),
        NULL(HermesOp.LOAD_CONST_NULL.toByte()),
        TRUE(HermesOp.LOAD_CONST_TRUE.toByte()),
        FALSE(HermesOp.LOAD_CONST_FALSE.toByte()),
    }

    companion object {
        const val SOURCE_SHA256 = "46ff7cd5b249c28ea9fdf7063e7113818abb83c159525fbed488db112927109e"

        /** [HermesEdit.functionId] of an edit outside function bytecode: a literal value or a string. */
        const val DATA = -1

        /**
         * Byte length of each v99 instruction, by opcode, in base 36. Generated from hermes-dec 0.1.7's
         * hbc99 definitions (BytecodeList.def of the static_h branch).
         */
        private const val LENGTHS =
            "16abc238a4434433393333444444444444444444444444334455343454545223367556896866886688474768474554454465" +
            "45565644455675747322423321136879574543636a464622222232333336443223eii5734332536363684747474747474747" +
            "47474747474747474747"

        /** Instructions a replaced prologue may contain: environment, global, parameter and property loads. */
        private val PROLOGUE = setOf(
            0x34, // GetParentEnvironment
            0x3b, // LoadFromEnvironment
            0x3d, // GetGlobalObject
            0x40, // CreateFunctionEnvironment
            0x41, // CreateTopLevelEnvironment
            0x44, // GetByIdShort
            0x45, // GetById
            0x48, // TryGetById
            0x89, // LoadParam
            0x99, // LoadThisNS
        )
    }
}

/** v99 opcodes that the helper and the patches match or write (BytecodeList.def of the static_h branch). */
internal object HermesOp {
    const val NEW_OBJECT_WITH_BUFFER = 0x01
    const val NEW_OBJECT_WITH_BUFFER_LONG = 0x02
    const val NEW_OBJECT_WITH_BUFFER_AND_PARENT = 0x03
    const val NEW_OBJECT = 0x05
    const val NEW_ARRAY_WITH_BUFFER = 0x07
    const val NEW_ARRAY_WITH_BUFFER_LONG = 0x08
    const val MOV = 0x10
    const val LOAD_FROM_ENVIRONMENT = 0x3b
    const val GET_BY_ID_SHORT = 0x44
    const val GET_BY_ID = 0x45
    const val PUT_OWN_BY_SLOT_IDX = 0x52
    const val GET_BY_INDEX = 0x5e
    const val PUT_BY_VAL_STRICT = 0x61
    const val CALL2 = 0x6e
    const val CALL3 = 0x6f
    const val RET = 0x76
    const val LOAD_CONST_UINT8 = 0x8b
    const val LOAD_CONST_STRING = 0x90
    const val LOAD_CONST_STRING_LONG_INDEX = 0x91
    const val LOAD_CONST_UNDEFINED = 0x93
    const val LOAD_CONST_NULL = 0x94
    const val LOAD_CONST_TRUE = 0x95
    const val LOAD_CONST_FALSE = 0x96
    const val UINT_SWITCH = 0xa7
    const val STRING_SWITCH = 0xa8
    const val ITERATOR_NEXT = 0xac
    const val JMP_TRUE = 0xb1
    const val JMP_TRUE_LONG = 0xb2
    const val JMP_FALSE = 0xb3
}

/** An array or object literal [instruction] in [function], whose values occupy value-buffer bytes [start, end). */
internal class HermesLiteral(val function: HermesFunction, val instruction: HermesInstruction, val keys: List<String?>?,
    val start: Int, val end: Int)

/** One value of a literal: its type tag, its value (a string ID for strings), and its bytes' value-buffer offset and width. */
internal data class HermesLiteralValue(val type: Int, val value: Long, val offset: Int, val width: Int)

internal data class HermesFunction(val id: Int, val name: String, val offset: Int, val body: ByteArray,
    val frameSize: Int, val numberRegisters: Int, val nonPointerRegisters: Int, val flags: Int) {
    val label get() = name.ifEmpty { "anonymous function" }
}

/**
 * One edit the runtime loader can switch. A switch edit writes [replacement] while its setting is on;
 * a choice edit writes the [values] entry of the setting's value, or keeps [original].
 */
internal data class HermesEdit(val key: String, val offset: Int, val original: ByteArray,
    val replacement: ByteArray, val defaultEnabled: Boolean, val functionId: Int,
    val values: Map<String, ByteArray>? = null, val defaultValue: String? = null) {
    /** The bytes the patched APK ships, which a fresh install with default settings runs. */
    val embedded: ByteArray get() = when {
        values != null -> values[defaultValue] ?: original
        defaultEnabled -> replacement
        else -> original
    }
}

/**
 * One decoded instruction at [offset] from its function's start. A switch carries [switchTargets]: its default, then
 * every case, from the function start, read from its jump table by [HermesBundle.instructions].
 */
internal class HermesInstruction(val offset: Int, val opcode: Int, val bytes: ByteArray,
                                 val switchTargets: List<Int> = emptyList()) {
    fun u8(index: Int) = bytes[index].toInt() and 255
    fun u16(index: Int) = u8(index) or (u8(index + 1) shl 8)
    fun u32(index: Int) = u16(index) or (u16(index + 2) shl 16)

    /** Where a plain jump goes, from the function start, or null for anything else, switches included. */
    fun target(): Int? = when (opcode) {
        in LONG_JUMPS -> offset + u32(1)
        in 0xaf..0xdb -> offset + bytes[1]
        else -> null
    }

    /** Every place this instruction can transfer control to other than the next instruction: a jump's or a switch's. */
    fun targets(): List<Int> = listOfNotNull(target()) + switchTargets

    /** The string ID of the property a GetById variant reads, or null. */
    fun propertyId(): Int? = when (opcode) {
        0x44 -> u8(4) // GetByIdShort
        0x45, 0x48 -> u16(4) // GetById, TryGetById
        0x46, 0x49 -> u32(4) // GetByIdLong, TryGetByIdLong
        else -> null
    }

    /** The string ID a LoadConstString variant loads, or null. */
    fun stringLoaded(): Int? = when (opcode) {
        0x90 -> u16(2)
        0x91 -> u32(2)
        else -> null
    }

    private companion object {
        /** Jumps with a 32-bit offset; the others in 0xaf..0xdb have an 8-bit one. */
        val LONG_JUMPS = setOf(0xb0, 0xb2, 0xb4, 0xb6, 0xb7, 0xb9, 0xbb, 0xbd, 0xbf, 0xc1, 0xc3, 0xc5, 0xc7, 0xc9,
            0xcb, 0xcd, 0xcf, 0xd1, 0xd3, 0xd5, 0xd7, 0xd9, 0xdb)
    }
}

internal fun hex(value: String): ByteArray {
    val compact = value.filterNot { it.isWhitespace() }
    ensure(compact.length % 2 == 0, "odd hexadecimal string")
    return compact.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

private fun ByteArray.toHex() = joinToString("") { "%02x".format(it.toInt() and 255) }
private fun ByteArray.sha256() = digest("SHA-256", this).toHex()
private fun digest(name: String, value: ByteArray) = MessageDigest.getInstance(name).digest(value)
private fun ensure(condition: Boolean, message: String) { if (!condition) fail(message) }
private fun fail(message: String): Nothing = throw PatchException("Kick Hermes: $message")
private fun ByteArray.positions(pattern: ByteArray): List<Int> {
    if (pattern.isEmpty() || pattern.size > size) return emptyList()
    val matches = mutableListOf<Int>()
    for (offset in 0..size - pattern.size) {
        if (this[offset] != pattern[0]) continue
        var index = 1
        while (index < pattern.size && this[offset + index] == pattern[index]) index++
        if (index == pattern.size) matches += offset
    }
    return matches
}

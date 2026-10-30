package io.github.jordanwoodson.patches.twitch.shared

import app.morphe.patcher.patch.PatchException
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

/**
 * The small part of Hermes Static v98 needed for bounded edits. Format reference:
 * https://github.com/facebook/hermes/blob/static_h/include/hermes/BCGen/HBC/BytecodeFileFormat.h
 * Opcode reference: the same branch's BytecodeList.def. Older Hermes main has a different layout.
 * Existing edits preserve their byte lengths. The separately compiled delayed-moderation predicate
 * uses one bounded append with explicit header/branch/exception relocation and exact off restoration.
 */
internal class HermesBundle(input: ByteArray, compiledPredicate: Boolean = false) {
    private val bytes = input.copyOf()
    internal val strings: List<String>
    internal val functions: List<HermesFunction>
    private val literalStart: Int
    private val literalSize: Int
    private val changes = mutableListOf<HermesEdit>()
    val edits: List<HermesEdit> get() = changes.toList()
    internal var delayedAppend: DelayedAppend? = null
        private set

    init {
        ensure(bytes.size >= 148, "truncated header")
        ensure(bytes.copyOfRange(0, 8).contentEquals(hex("c61fbc03c103191f")), "invalid magic")
        ensure(u32(8) == 98, "expected Hermes v98")
        ensure(u32(32) == bytes.size, "file length does not match header")
        ensure(digest("SHA-1", bytes.copyOfRange(0, bytes.size - 20))
            .contentEquals(bytes.copyOfRange(bytes.size - 20, bytes.size)), "invalid SHA-1 footer")
        if (compiledPredicate) ensure(bytes.size <= 65536, "oversized compiled predicate")
        else ensure(bytes.sha256() == SOURCE_SHA256, "unrecognized bundle: the supported Twitch version's has SHA-256 $SOURCE_SHA256")
        val functionCount = u32(40)
        val stringCount = u32(52)
        val overflowCount = u32(56)
        val stringStorageSize = u32(60)
        ensure(functionCount in 1..bytes.size / 12, "invalid function count")
        ensure(stringCount in 1..bytes.size / 4, "invalid string count")
        var cursor = checkedEnd(128, functionCount, 12)
        cursor = checkedEnd(align(cursor), u32(44), 4) // String-kind runs.
        cursor = checkedEnd(align(cursor), u32(48), 4) // Identifier hashes.
        val stringTable = align(cursor)
        cursor = checkedEnd(stringTable, stringCount, 4)
        val overflowTable = align(cursor)
        cursor = checkedEnd(overflowTable, overflowCount, 8)
        val stringStorage = align(cursor)
        cursor = checkedEnd(stringStorage, stringStorageSize, 1)
        strings = List(stringCount) { index ->
            val entry = u32Bits(stringTable + index * 4)
            val utf16 = entry and 1L != 0L
            var offset = ((entry ushr 1) and 0x7fffff).toInt()
            var length = (entry ushr 24).toInt()
            if (length == 255) {
                ensure(offset < overflowCount, "string overflow index outside table")
                length = u32(overflowTable + offset * 8 + 4)
                offset = u32(overflowTable + offset * 8)
            }
            val byteLength = length.toLong() * if (utf16) 2 else 1
            ensure(offset.toLong() + byteLength <= stringStorageSize, "string outside storage")
            String(bytes, stringStorage + offset, byteLength.toInt(),
                if (utf16) StandardCharsets.UTF_16LE else StandardCharsets.ISO_8859_1)
        }
        literalStart = align(cursor)
        literalSize = u32(80)
        checkedEnd(literalStart, literalSize, 1)
        functions = List(functionCount) { id ->
            val position = 128 + id * 12
            val first = u32Bits(position)
            val second = u32Bits(position + 4)
            val flags = u8(position + 11)
            val large = flags and 32 != 0
            val header = if (large) {
                ((first and 0x1ffffff) or (((second ushr 14) and 0xff) shl 24)).toInt()
            } else position
            if (large) checkedEnd(header, 37, 1)
            val offset = if (large) u32(header) else (first and 0x1ffffff).toInt()
            val size = if (large) u32(header + 12) else (second and 0x3fff).toInt()
            val name = if (large) u32(header + 16) else ((second ushr 14) and 0xff).toInt()
            val numbers = if (large) u32(header + 20) else ((second ushr 22) and 31).toInt()
            val nonPointers = if (large) u32(header + 24) else ((second ushr 27) and 31).toInt()
            val frame = if (large) u32(header + 28) else u8(header + 8)
            val actualFlags = if (large) u8(header + 36) else flags
            ensure(name < stringCount, "invalid function name index")
            checkedEnd(offset, size, 1)
            HermesFunction(id, strings[name], offset, bytes.copyOfRange(offset, offset + size),
                frame, numbers, nonPointers, actualFlags, header, large)
        }
    }

    internal fun predicateHeader(function: HermesFunction): ByteArray {
        ensure(function.largeHeader, "compiled predicate needs an exception header")
        return bytes.copyOfRange(function.headerOffset, function.headerOffset + 37)
    }

    internal fun predicateExceptions(function: HermesFunction): List<IntArray> {
        ensure(function.largeHeader && function.flags and 8 != 0, "compiled predicate has no catch table")
        val offset = align(function.headerOffset + 37)
        val count = u32(offset)
        ensure(count in 1..4, "unexpected predicate catch count")
        checkedEnd(offset + 4, count, 12)
        return List(count) { i -> IntArray(3) { j -> u32(offset + 4 + i * 12 + j * 4) } }
    }

    /** The only supported append: the guarded delayed-moderation predicate, preserving its function ID. */
    internal fun appendDelayed(function: HermesFunction, body: ByteArray, header: ByteArray, exceptions: List<IntArray>) {
        ensure(delayedAppend == null && body.size in 1..1024 && header.size == 37, "invalid/duplicate predicate append")
        val start = align(bytes.size - 20)
        val fullHeader = align(start + body.size)
        val table = align(fullHeader + 37)
        val end = table + 4 + exceptions.size * 12
        val tail = ByteArray(end - (bytes.size - 20))
        body.copyInto(tail, start - (bytes.size - 20))
        val actualHeader = header.copyOf()
        actualHeader.put32(0,start)
        actualHeader.put32(12,body.size)
        actualHeader.put32(16,stringId(function.name))
        actualHeader[36] = (actualHeader[36].toInt() and 0x10.inv()).toByte() // No donor debug-table references.
        actualHeader.copyInto(tail,fullHeader - (bytes.size - 20))
        tail.put32(table - (bytes.size - 20),exceptions.size)
        exceptions.forEachIndexed { i, entry -> entry.forEachIndexed { j, value ->
            tail.put32(table - (bytes.size - 20) + 4 + i * 12 + j * 4,value)
        } }
        val compact = ByteArray(12)
        compact.put32(0,fullHeader and 0xffffff)
        compact.put32(4,((fullHeader ushr 24) and 255) shl 14)
        compact[11] = 0x20
        val at = 128 + function.id * 12
        delayedAppend = DelayedAppend(at,bytes.copyOfRange(at,at+12),compact,tail,bytes.size)
    }

    fun stringId(value: String): Int = strings.indexOf(value).also { ensure(it >= 0, "missing string $value") }

    /**
     * A string's ID as the operand bytes of an instruction pattern, so patterns survive the string
     * table being renumbered between app versions: one byte for the short forms (GetByIdShort),
     * two little-endian bytes for the 16-bit forms (GetById, TryGetById, LoadConstString).
     */
    fun id8(value: String): String = stringId(value).let { id ->
        ensure(id < 256, "$value has no 8-bit string ID")
        "%02x".format(id)
    }

    fun id16(value: String): String = stringId(value).let { id ->
        ensure(id < 65536, "$value has no 16-bit string ID")
        "%02x %02x".format(id and 255, id ushr 8)
    }

    fun function(name: String): HermesFunction = functions.filter { it.name == name }.singleOrNull()
        ?: fail("expected one function named $name")

    /** An anonymous function must be selected by a unique bytecode anchor, never its build-local ID. */
    fun matchingFunction(anchor: ByteArray): HermesFunction {
        ensure(anchor.isNotEmpty(), "empty function anchor")
        return functions.filter { it.body.positions(anchor).isNotEmpty() }.singleOrNull()
            ?: fail("expected one function with bytecode anchor ${anchor.toHex()}")
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
        val register = function.numberRegisters + function.nonPointerRegisters
        ensure(register in 0..255 && register < function.frameSize, "$functionName has no general register")
        val replacement = ByteArray(length)
        byteArrayOf(0x94.toByte(), register.toByte(), 0x76, register.toByte()).copyInto(replacement)
        // Unreachable (0) pads through the last replaced instruction boundary, after Ret.
        add(function, key, 0, body.copyOfRange(0, length), replacement, defaultEnabled)
    }

    fun returnUndefined(function: HermesFunction, key: String) {
        ensure(function.body.size >= 6 && function.body[0].toInt() and 255 == 0x34,
            "unexpected synchronous function prologue")
        val next = function.body[3].toInt() and 255
        ensure(next == 0x89 || next == 0x93, "unexpected second instruction")
        val length = if (next == 0x89) 6 else 5
        val register = function.numberRegisters + function.nonPointerRegisters
        ensure(register in 0..255 && register < function.frameSize, "no general register")
        val replacement = ByteArray(length)
        byteArrayOf(0x93.toByte(), register.toByte(), 0x76, register.toByte()).copyInto(replacement)
        add(function, key, 0, function.body.copyOfRange(0, length), replacement, true)
    }

    /**
     * Returns null (or undefined) as the function's first instruction, for components and services that
     * render or subscribe nothing then, and for class methods whose result is discarded. Covers any
     * prologue made of the instructions below, such as `LoadThisNS` + `GetById` in class methods,
     * which [returnNull] and [returnUndefined] don't accept. Every call returns before any hook or
     * branch, so React hook order stays the same for the process (edits are restart-gated).
     */
    fun returnAtEntry(functionName: String, key: String, undefined: Boolean = false, defaultEnabled: Boolean = true) {
        val function = function(functionName)
        ensure(function.flags and 0x18 == 0, "$functionName has exception/debug metadata")
        val body = function.body
        var length = 0
        while (length < 4) {
            ensure(length < body.size, "$functionName is too short")
            length += PROLOGUE_LENGTHS[body[length].toInt() and 255]
                ?: fail("$functionName has an unexpected prologue instruction at $length")
        }
        val register = function.numberRegisters + function.nonPointerRegisters
        ensure(register in 0..255 && register < function.frameSize, "$functionName has no general register")
        val replacement = ByteArray(length)
        byteArrayOf(if (undefined) 0x93.toByte() else 0x94.toByte(), register.toByte(), 0x76, register.toByte())
            .copyInto(replacement)
        // Unreachable (0) pads through the last replaced instruction boundary, after Ret.
        add(function, key, 0, body.copyOfRange(0, length), replacement, defaultEnabled)
    }

    /**
     * Turns the function's single read of [property] (GetById) into `false` in the same register, so
     * a prop such as `onShare` or `hasBoards` reads as false while every other prop and hook stays.
     */
    fun falseProperty(functionName: String, property: String, key: String, defaultEnabled: Boolean = true) {
        val function = function(functionName)
        val id = stringId(property)
        ensure(id in 0..65535, "$property needs a larger Hermes instruction")
        val matches = (0..function.body.size - 6).filter { offset ->
            (function.body[offset].toInt() and 255) == 0x45 &&
                (function.body[offset + 4].toInt() and 255) == (id and 255) &&
                (function.body[offset + 5].toInt() and 255) == (id ushr 8)
        }
        val offset = matches.singleOrNull() ?: fail("expected one $property read in $functionName")
        val register = function.body[offset + 1]
        ensure((register.toInt() and 255) >= function.numberRegisters + function.nonPointerRegisters,
            "$property result has no general register")
        replace(function, key, function.body.copyOfRange(offset, offset + 6),
            byteArrayOf(0x96.toByte(), register, 0x96.toByte(), register, 0x96.toByte(), register), defaultEnabled)
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
        ensure(key.matches(Regex("[a-z][a-z0-9_]*")), "invalid setting key")
        ensure(before.size == after.size && before.isNotEmpty(), "edit must preserve bytecode length")
        ensure(functions.count { it.offset == function.offset && it.body.isNotEmpty() } == 1,
            "function bytecode is shared")
        val offset = function.offset + relative
        ensure(relative >= 0 && relative.toLong() + before.size <= function.body.size, "edit outside function")
        ensure(bytes.copyOfRange(offset, offset + before.size).contentEquals(before), "original bytes differ")
        ensure(changes.none { offset < it.offset + it.original.size && it.offset < offset + before.size },
            "overlapping Hermes edits")
        requireSafeEdit(function, key, relative, after)
        return HermesEdit(key, offset, before.copyOf(), after.copyOf(), defaultEnabled, function.id)
            .also { changes += it }
    }

    /**
     * Fails unless replacing [function]'s bytes at [relative] with [after] keeps its control flow intact:
     * the edit starts and ends on instruction boundaries, [after] decodes to whole instructions whose own
     * jumps land on instruction boundaries, and nothing outside the edit (a jump, a switch case or
     * default, an exception range or handler) leads into its interior, unless it lands on an instruction
     * from which the replacement is byte for byte the original. The padding the helpers use is
     * Unreachable (0x00), which aborts the process when executed, so a jump into it must be ruled out.
     */
    internal fun requireSafeEdit(function: HermesFunction, key: String, relative: Int, after: ByteArray) {
        val what = function.name.ifEmpty { "anonymous function" }
        val code = decode(function)
        val boundaries = code.instructions.map { it.offset }.toSet() + code.end
        val edit = Span(this, function, relative, after, what)
        ensure(relative in boundaries && edit.end in boundaries, "edit in $what does not start and end on instructions")
        val entries = code.instructions.filter { it.offset < relative || it.offset >= edit.end }.flatMap { it.targets } +
            code.exceptionOffsets
        entries.forEach { edit.requireEntry(it, "$what jumps") }
        edit.targets.forEach { target ->
            ensure(edit.inside(target) || target == edit.end || target in boundaries,
                "replacement in $what jumps off an instruction boundary")
            ensure(!edit.inside(target) || target in edit.boundaries, "replacement in $what jumps into itself mid-instruction")
        }
        // Edits under one key are switched together; under different keys, in any combination.
        changes.filter { it.functionId == function.id }.forEach { other ->
            val span = Span(this, function, other.offset - function.offset, other.replacement, what)
            val together = other.key == key
            span.targets.forEach { edit.requireEntry(it, "another edit in $what jumps", together) }
            edit.targets.forEach { span.requireEntry(it, "the edit in $what jumps", together) }
        }
    }

    /** An edit's bytes [relative] until [end] of [function], decoded as its [replacement]. */
    private class Span(bundle: HermesBundle, val function: HermesFunction, val relative: Int, val replacement: ByteArray,
                       what: String) {
        val end = relative + replacement.size
        private val decoded = bundle.decode(replacement, replacement.size, function.offset + relative, what, inFile = false)
        val boundaries = decoded.instructions.map { relative + it.offset }.toSet()
        /** Where the replacement's own jumps go, from the function start. */
        val targets = decoded.instructions.flatMap { it.targets }.map { relative + it }

        init {
            ensure(decoded.end == replacement.size, "replacement in $what does not decode to whole instructions")
        }

        fun inside(target: Int) = target > relative && target < end

        /**
         * A jump from outside to [target] is safe unless it lands inside, where it must find an instruction
         * of the replacement from which the bytes are the original's. A jump that is itself part of an edit
         * switched [together] with this one only runs with the replacement, so an instruction start there
         * is enough.
         */
        fun requireEntry(target: Int, who: String, together: Boolean = false) {
            if (!inside(target)) return
            val unchanged = target in boundaries && (together || function.body.copyOfRange(target, end)
                .contentEquals(replacement.copyOfRange(target - relative, replacement.size)))
            ensure(unchanged, "$who into the edited bytes at ${target - relative} of ${replacement.size}")
        }
    }

    /** [function]'s instruction offsets, each with where it can jump; for tests and diagnostics. */
    internal fun controlFlow(function: HermesFunction): List<Pair<Int, List<Int>>> =
        decode(function).instructions.map { it.offset to it.targets }

    private class Step(val offset: Int, val opcode: Int, val targets: List<Int>)

    private class Decoded(val instructions: List<Step>, val end: Int, val exceptionOffsets: List<Int>)

    /** [function]'s instructions up to its first switch table, with every jump, switch and handler target. */
    private fun decode(function: HermesFunction): Decoded {
        val what = function.name.ifEmpty { "anonymous function" }
        val code = decode(function.body, function.body.size, function.offset, what, inFile = true)
        val exceptions = when {
            function.flags and 8 == 0 -> emptyList()
            function.largeHeader -> {
                // The catch table follows the large header: a count, then (start, end, handler) offsets.
                val table = align(function.headerOffset + 37)
                val count = u32(table)
                checkedEnd(table + 4, count, 12)
                List(count * 3) { u32(table + 4 + it * 4) }.onEach {
                    ensure(it in 0..function.body.size, "catch offset outside $what")
                }
            }
            else -> fail("$what has exception handlers without a large header")
        }
        return Decoded(code.instructions, code.end, exceptions)
    }

    /**
     * Decodes [body] with the v98 length table until [limit] or the first switch's jump table, which
     * follows the instructions. [absolute] is the body's file offset. Only code [inFile] (a function of
     * this bundle, not an edit's replacement) may hold a switch: its table is read from the file, where
     * Hermes aligns it to 4 bytes.
     */
    private fun decode(body: ByteArray, limit: Int, absolute: Int, what: String, inFile: Boolean): Decoded {
        val instructions = mutableListOf<Step>()
        var end = limit
        var offset = 0
        while (offset < end) {
            val opcode = body[offset].toInt() and 255
            ensure(opcode < V98_LENGTHS.length, "unknown opcode $opcode in $what")
            val length = V98_LENGTHS[opcode].digitToInt(36)
            ensure(offset + length <= limit, "truncated instruction in $what")
            fun s32(at: Int) = (0..3).fold(0) { value, i -> value or ((body[offset + at + i].toInt() and 255) shl (8 * i)) }
            val targets = mutableListOf<Int>()
            V98_JUMPS[opcode]?.let { (at, size) -> targets += offset + if (size == 1) body[offset + at].toInt() else s32(at) }
            when (opcode) {
                UINT_SWITCH -> {
                    // The jump table: (max - min + 1) offsets from the switch, 4-byte aligned in the file. It
                    // usually follows the instructions, but may lie past the function's recorded size.
                    ensure(inFile, "switch in an edit's replacement of $what")
                    val table = (absolute + offset + s32(2) + 3) and -4
                    val count = s32(14).toLong() - s32(10).toLong() + 1
                    ensure(count in 1..65536 && table >= absolute + offset + length && table + count * 4 <= bytes.size - 20,
                        "switch table outside $what")
                    for (i in 0 until count.toInt()) targets += offset + u32Bits(table + i * 4).toInt()
                    end = minOf(end, table - absolute)
                }
                STRING_SWITCH -> fail("$what has a string switch, which the decoder doesn't read")
            }
            instructions += Step(offset, opcode, targets)
            offset += length
        }
        return Decoded(instructions, offset, emptyList())
    }

    /** Full original function bodies make Morphe's first-match byte replacement unambiguous. */
    fun replacements(): Set<Pair<String, String>> = changes.groupBy { it.functionId }.map { (id, edits) ->
        val function = functions[id]
        ensure(bytes.positions(function.body).singleOrNull() == function.offset,
            "function pattern is not globally unique")
        val replacement = function.body.copyOf()
        edits.filter { it.defaultEnabled }.forEach { it.replacement.copyInto(replacement, it.offset - function.offset) }
        function.body.toHex() to replacement.toHex()
    }.toSet()

    fun preview(): ByteArray = previewEqualLength().let { equal ->
        val append = delayedAppend ?: return@let equal
        val result = equal.copyOf(append.originalLength + append.tail.size)
        append.tail.copyInto(result,append.originalLength - 20)
        append.replacementHeader.copyInto(result,append.headerOffset)
        result.put32(32,result.size)
        digest("SHA-1", result.copyOfRange(0,result.size-20)).copyInto(result,result.size-20)
        result
    }

    fun previewEqualLength(): ByteArray = bytes.copyOf().also { result ->
        changes.filter { it.defaultEnabled }.forEach { it.replacement.copyInto(result, it.offset) }
        digest("SHA-1", result.copyOfRange(0, result.size - 20)).copyInto(result, result.size - 20)
    }

    fun manifest(): String {
        val entries = changes.sortedBy { it.offset }.joinToString(",") {
            "{\"key\":\"${it.key}\",\"offset\":${it.offset},\"original\":\"${it.original.toHex()}\"," +
                "\"replacement\":\"${it.replacement.toHex()}\",\"default\":${it.defaultEnabled}}"
        }
        val append = delayedAppend?.let {
            ",\"append\":{\"key\":\"chat_show_deleted\",\"default\":true,\"originalLength\":${it.originalLength}," +
                "\"headerOffset\":${it.headerOffset},\"originalHeader\":\"${it.originalHeader.toHex()}\"," +
                "\"replacementHeader\":\"${it.replacementHeader.toHex()}\",\"tail\":\"${it.tail.toHex()}\"}"
        } ?: ""
        return "{\"format\":1,\"version\":98,\"sourceSha256\":\"$SOURCE_SHA256\"," +
            "\"embeddedSha256\":\"${preview().sha256()}\",\"edits\":[$entries]$append}"
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

    companion object {
        const val SOURCE_SHA256 = "059f4713e0cea80b58e68b675fb05d63053056869e2ac60c79f5d57567a3e583"

        /**
         * Byte length of each v98 instruction, by opcode, in base 36. Generated from hermes-dec 0.1.7's
         * hbc98 definitions (BytecodeList.def at bytecode version 98).
         */
        private const val V98_LENGTHS =
            "16ab238a4434433839333344444444444444444444444433445534345454522336755689686688668847476847455445" +
                "446545565644455675747322423321136879574543636a46462222223233336443223eii573433253636368474747474" +
                "747474747474747474747474747474"
        private const val UINT_SWITCH = 166 // UIntSwitchImm: Reg8, table offset, default Addr32, min, max.
        private const val STRING_SWITCH = 167 // StringSwitchImm

        /** Opcode to the (byte offset, size) of its jump operand, relative to the instruction start. */
        private val V98_JUMPS: Map<Int, Pair<Int, Int>> = buildMap {
            put(UINT_SWITCH, 6 to 4) // The default target.
            put(STRING_SWITCH, 10 to 4)
            // Jmp (174) through JmpBuiltinIsNotLong (218) take the target first: an Addr8 in the short forms
            // (2 to 4 bytes long) and an Addr32 in the long forms and JmpTypeOfIs (5 to 8 bytes).
            for (opcode in 174..218) put(opcode, 1 to if (V98_LENGTHS[opcode].digitToInt(36) >= 5) 4 else 1)
        }

        /** Byte lengths of the v98 instructions accepted in a replaced prologue (BytecodeList.def). */
        private val PROLOGUE_LENGTHS = mapOf(
            0x34 to 3, // GetParentEnvironment
            0x3b to 4, // LoadFromEnvironment
            0x40 to 3, // CreateFunctionEnvironment
            0x41 to 6, // CreateTopLevelEnvironment
            0x44 to 5, // GetByIdShort
            0x45 to 6, // GetById
            0x89 to 3, // LoadParam
            0x99 to 2, // LoadThisNS
        )
    }
}

internal data class HermesFunction(val id: Int, val name: String, val offset: Int, val body: ByteArray,
    val frameSize: Int, val numberRegisters: Int, val nonPointerRegisters: Int, val flags: Int,
    val headerOffset: Int = 0, val largeHeader: Boolean = false)

internal data class DelayedAppend(val headerOffset: Int, val originalHeader: ByteArray,
    val replacementHeader: ByteArray, val tail: ByteArray, val originalLength: Int)

internal fun ByteArray.put32(offset: Int, value: Int) {
    for (i in 0..3) this[offset+i] = (value ushr (8*i)).toByte()
}

internal data class HermesEdit(val key: String, val offset: Int, val original: ByteArray,
    val replacement: ByteArray, val defaultEnabled: Boolean, val functionId: Int)

internal fun hex(value: String): ByteArray {
    val compact = value.filterNot { it.isWhitespace() }
    ensure(compact.length % 2 == 0, "odd hexadecimal string")
    return compact.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

private fun ByteArray.toHex() = joinToString("") { "%02x".format(it.toInt() and 255) }
private fun ByteArray.sha256() = digest("SHA-256", this).toHex()
private fun digest(name: String, value: ByteArray) = MessageDigest.getInstance(name).digest(value)
private fun ensure(condition: Boolean, message: String) { if (!condition) fail(message) }
private fun fail(message: String): Nothing = throw PatchException("Twitch Hermes: $message")
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

package app.custom.patches.sevengrid

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

internal fun checkHermes(condition: Boolean, message: String) {
    if (!condition) throw PatchException("Unsupported SevenGrid Hermes bytecode: $message")
}

/**
 * The v96 fields used by this patch, from Hermes' BytecodeFileFormat.h and
 * BytecodeList.def. All edits retain the original file and function sizes.
 * https://github.com/facebook/hermes/tree/v0.13.0/include/hermes/BCGen/HBC
 */
internal class HermesBytecode(private val data: ByteArray) {
    data class Function(
        val id: Int,
        val offset: Int,
        val size: Int,
        val name: String,
        val parameters: Int,
        val frameSize: Int,
        val flags: Int,
    )

    data class Instruction(val offset: Int, val opcode: Int, val size: Int)

    private val bodyEnd = data.size - 20
    private val keyStart: Int
    private val keySize: Int
    private val valueStart: Int
    private val valueSize: Int
    private val strings: List<String>
    val functions: List<Function>

    init {
        checkHermes(data.size >= 148, "The bundle is truncated.")
        checkHermes(
            word(0) == 0x03bc1fc6 && word(4) == 0x1f1903c1,
            "assets/index.android.bundle is not a Hermes bundle.",
        )
        checkHermes(uint(8) == 96, "Expected Hermes v96; found v${uint(8)}.")
        checkHermes(uint(32) == data.size, "The declared bundle length does not match the file.")
        checkHermes(digest().contentEquals(data.copyOfRange(bodyEnd, data.size)), "Invalid SHA-1 footer.")

        var cursor = 128L
        fun section(size: Long): Int {
            val start = (cursor + 3) and -4L
            checkHermes(size >= 0 && start + size <= bodyEnd, "A header table exceeds the bundle.")
            cursor = start + size
            return start.toInt()
        }

        val functionCount = uint(40)
        val stringCount = uint(52)
        val overflowCount = uint(56)
        checkHermes(functionCount > 0 && stringCount > 0, "Missing function or string table.")
        val functionTable = section(functionCount * 16L)
        section(uint(44) * 4L) // String-kind runs.
        section(uint(48) * 4L) // Identifier hashes.
        val stringTable = section(stringCount * 4L)
        val overflowTable = section(overflowCount * 8L)
        val storageSize = uint(60)
        val storage = section(storageSize.toLong())
        section(uint(80).toLong()) // Array literals.
        keySize = uint(84)
        keyStart = section(keySize.toLong())
        valueSize = uint(88)
        valueStart = section(valueSize.toLong())

        strings = List(stringCount) { index ->
            val entry = word(stringTable + index * 4)
            val utf16 = entry and 1 != 0
            var offset = (entry ushr 1) and 0x7fffff
            var length = entry ushr 24
            if (length == 255) {
                checkHermes(offset < overflowCount, "Invalid overflow-string index.")
                val overflow = overflowTable + offset * 8
                offset = uint(overflow)
                length = uint(overflow + 4)
            }
            val bytes = length.toLong() * if (utf16) 2 else 1
            checkHermes(offset.toLong() + bytes <= storageSize, "A string exceeds its storage table.")
            String(data, storage + offset, bytes.toInt(), if (utf16) Charsets.UTF_16LE else Charsets.ISO_8859_1)
        }

        functions = List(functionCount) { id ->
            val header = functionTable + id * 16
            var offset = word(header) and 0x1ffffff
            var size = word(header + 4) and 0x7fff
            var name = word(header + 4) ushr 15
            var parameters = word(header) ushr 25
            var frame = word(header + 8) ushr 25
            var flags = byte(header + 15)
            if (flags and 0x20 != 0) {
                val large = ((word(header + 8).toLong() and 0x1ffffff) shl 16) or offset.toLong()
                checkHermes(large + 31 <= bodyEnd, "Invalid extended function header.")
                val position = large.toInt()
                offset = uint(position)
                parameters = uint(position + 4)
                size = uint(position + 8)
                name = uint(position + 12)
                frame = uint(position + 20)
                flags = byte(position + 30)
            }
            checkHermes(name < strings.size, "Invalid function-name index.")
            checkHermes(offset >= cursor && size > 0, "Invalid function body location.")
            bounds(offset, size)
            Function(id, offset, size, strings[name], parameters, frame, flags)
        }
    }

    fun byte(offset: Int): Int {
        bounds(offset, 1)
        return data[offset].toInt() and 255
    }

    fun ushort(offset: Int): Int = byte(offset) or (byte(offset + 1) shl 8)

    private fun word(offset: Int): Int = ushort(offset) or (ushort(offset + 2) shl 16)

    fun uint(offset: Int): Int = word(offset).also {
        checkHermes(it >= 0, "An index or size exceeds the supported range.")
    }

    private fun bounds(offset: Int, size: Int) {
        checkHermes(offset >= 0 && size >= 0 && offset.toLong() + size <= bodyEnd, "Out-of-bounds data.")
    }

    fun bytes(offset: Int, size: Int): ByteArray {
        bounds(offset, size)
        return data.copyOfRange(offset, offset + size)
    }

    fun stringId(value: String): Int {
        val matches = strings.indices.filter { strings[it] == value }
        checkHermes(matches.size == 1, "Expected one '$value' identifier; found ${matches.size}.")
        return matches.single()
    }

    fun namedFunction(name: String): Function {
        val matches = functions.filter { it.name == name }
        checkHermes(matches.size == 1, "Expected one '$name' function; found ${matches.size}.")
        return matches.single()
    }

    fun forEachInstruction(function: Function, action: (Instruction) -> Unit) {
        var offset = function.offset
        val end = offset + function.size
        while (offset < end) {
            val opcode = byte(offset)
            checkHermes(opcode < instructionSizes.size, "Unknown opcode in function #${function.id}.")
            val size = instructionSizes[opcode]
            checkHermes(offset + size <= end, "Truncated instruction in function #${function.id}.")
            action(Instruction(offset, opcode, size))
            offset += size
        }
    }

    fun instructions(function: Function): List<Instruction> = buildList {
        forEachInstruction(function) { add(it) }
    }

    fun property(instruction: Instruction): String? {
        val offset = instruction.offset
        val id = when (instruction.opcode) {
            54 -> byte(offset + 4)
            55, 57, 59, 61 -> ushort(offset + 4)
            56, 58, 60, 62 -> uint(offset + 4)
            63 -> byte(offset + 3)
            64, 66 -> ushort(offset + 3)
            65, 67 -> uint(offset + 3)
            else -> return null
        }
        checkHermes(id < strings.size, "Invalid property identifier.")
        return strings[id]
    }

    fun closureFunction(instruction: Instruction): Int? = when (instruction.opcode) {
        100 -> ushort(instruction.offset + 3)
        101 -> uint(instruction.offset + 3)
        else -> null
    }

    private fun literals(start: Int, size: Int, offset: Int, count: Int): List<Any?> {
        checkHermes(offset in 0 until size && count >= 0, "Invalid literal-buffer range.")
        var cursor = start + offset
        fun take(width: Int): Int {
            checkHermes(cursor.toLong() + width <= start.toLong() + size, "Truncated literal buffer.")
            val position = cursor
            cursor += width
            return position
        }
        return buildList {
            while (this.size < count) {
                val header = byte(take(1))
                val tag = (header ushr 4) and 7
                val run = if (header and 128 != 0) {
                    ((header and 15) shl 8) or byte(take(1))
                } else header and 15
                checkHermes(run > 0, "Empty literal run.")
                repeat(minOf(run, count - this.size)) {
                    add(when (tag) {
                        0 -> null
                        1 -> true
                        2 -> false
                        3 -> {
                            val position = take(8)
                            Double.fromBits((word(position).toLong() and 0xffffffffL) or (word(position + 4).toLong() shl 32))
                        }
                        4, 5, 6 -> {
                            val id = when (tag) {
                                4 -> uint(take(4))
                                5 -> ushort(take(2))
                                else -> byte(take(1))
                            }
                            checkHermes(id < strings.size, "Invalid literal string identifier.")
                            strings[id]
                        }
                        else -> word(take(4))
                    })
                }
            }
        }
    }

    fun objectKeys(instruction: Instruction): List<Any?>? {
        if (instruction.opcode !in 1..2) return null
        val offset = instruction.offset
        val count = ushort(offset + 4)
        if (count != 3) return null
        val keyOffset = if (instruction.opcode == 1) ushort(offset + 6) else uint(offset + 6)
        return literals(keyStart, keySize, keyOffset, count)
    }

    fun objectValues(instruction: Instruction): List<Any?> {
        checkHermes(instruction.opcode in 1..2, "Expected an object literal.")
        val offset = instruction.offset
        val valueOffset = if (instruction.opcode == 1) ushort(offset + 8) else uint(offset + 10)
        return literals(valueStart, valueSize, valueOffset, ushort(offset + 4))
    }

    fun proStateValuesOffset(): Int {
        // Serialized true, false, false. Reuse immutable storage instead of
        // altering pooled literals that may also be referenced by unrelated code.
        val offset = (0..minOf(valueSize - 2, 65535)).firstOrNull {
            byte(valueStart + it) == 0x11 && byte(valueStart + it + 1) == 0x22
        }
        checkHermes(offset != null, "No reusable Pro-state literal found.")
        return offset!!
    }

    fun requireExclusiveBody(function: Function) {
        checkHermes(functions.none {
            it.id != function.id && it.offset < function.offset + function.size && function.offset < it.offset + it.size
        }, "Function '${function.name}' shares bytecode with another function.")
    }

    fun replaceBody(function: Function, replacement: ByteArray) {
        checkHermes(replacement.size <= function.size, "Replacement exceeds function '${function.name}'.")
        // Opcode zero is Unreachable; padding is strictly after the final Ret.
        data.fill(0, function.offset, function.offset + function.size)
        replacement.copyInto(data, function.offset)
    }

    fun replaceObjectValues(instruction: Instruction, valueOffset: Int) {
        val width = if (instruction.opcode == 1) 2 else 4
        val offset = instruction.offset + if (width == 2) 8 else 10
        checkHermes(valueOffset in 0..65535, "The literal offset cannot fit a short instruction.")
        repeat(width) { data[offset + it] = (valueOffset ushr (it * 8)).toByte() }
    }

    private fun digest(): ByteArray = MessageDigest.getInstance("SHA-1").run {
        update(data, 0, bodyEnd)
        digest()
    }

    fun finish(): ByteArray = data.also { digest().copyInto(it, bodyEnd) }

    private companion object {
        // Encoded instruction widths for the 206 Hermes v96 opcodes.
        val instructionSizes = intArrayOf(
            1, 10, 14, 2, 3, 8, 10, 4, 3, 9, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4,
            4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 4,
            4, 3, 4, 5, 4, 5, 4, 5, 2, 2, 2, 7, 5, 5, 5, 6, 8, 6, 8, 6,
            8, 6, 8, 4, 5, 7, 5, 7, 4, 7, 5, 5, 7, 4, 4, 4, 6, 5, 6, 4,
            4, 4, 5, 5, 6, 7, 7, 7, 7, 4, 7, 3, 2, 2, 4, 2, 3, 1, 1, 3,
            5, 7, 5, 7, 5, 7, 4, 4, 3, 6, 3, 6, 10, 4, 6, 4, 6, 2, 2, 2,
            2, 2, 2, 3, 2, 3, 3, 3, 3, 4, 3, 2, 14, 18, 1, 3, 1, 5, 7, 3,
            4, 3, 2, 5, 3, 6, 3, 6, 3, 6, 2, 5, 4, 7, 4, 7, 4, 7, 4, 7,
            4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 7,
            4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 7, 4, 4, 4, 4, 4, 4, 4, 4,
            4, 4, 4, 4, 4, 4,
        )
    }
}

package app.mix.native

import java.io.File

/**
 * A [NativeLibrary] that records architecture-neutral instruction replacements.
 * Fingerprints continue to observe the original instructions until changes are written.
 */
abstract class MutableNativeLibrary(
    name: String,
    originalBytes: ByteArray,
) : NativeLibrary(name) {
    abstract val architecture: NativeArchitecture

    private val originalBytes = originalBytes.copyOf()
    private val replacements = linkedMapOf<Long, ByteArray>()

    /** True when at least one instruction replacement has been recorded. */
    val hasChanges: Boolean get() = replacements.isNotEmpty()

    internal fun replaceInstructions(
        function: NativeFunction,
        startIndex: Int,
        opcodes: Array<out NativeOpcode>,
    ) {
        require(function.library === this) { "Function does not belong to $name" }
        require(startIndex >= 0) { "Instruction index must be non-negative" }
        require(opcodes.isNotEmpty()) { "At least one replacement instruction is required" }

        opcodes.forEachIndexed { relativeIndex, opcode ->
            val index = startIndex + relativeIndex
            val instruction = function.instructions.getOrNull(index)
                ?: throw IndexOutOfBoundsException("Instruction index $index is outside $function")
            val encoded = architecture.encode(opcode, instruction.address)
            require(encoded.isNotEmpty()) { "${architecture.abi} encoded $opcode as an empty instruction" }
            require(encoded.size <= instruction.size) {
                "Encoded $opcode is ${encoded.size} bytes but instruction at " +
                        "0x${instruction.address.toString(16)} is ${instruction.size} bytes"
            }

            val offset = vaToFileOffset(instruction.address)
            require(offset >= 0 && offset <= originalBytes.size.toLong() - encoded.size) {
                "Replacement offset 0x${offset.toString(16)} is outside $name"
            }
            require(replacements.keys.none { existing ->
                val existingSize = replacements.getValue(existing).size
                offset < existing + existingSize && existing < offset + encoded.size
            }) {
                "Replacement at 0x${offset.toString(16)} overlaps an existing replacement"
            }
            replacements[offset] = encoded
        }
    }

    /** Returns the library bytes with all recorded instruction replacements applied. */
    fun toByteArray(): ByteArray = originalBytes.copyOf().also { output ->
        replacements.forEach { (offset, replacement) ->
            replacement.copyInto(output, destinationOffset = offset.toInt())
        }
    }

    /** Writes all recorded instruction replacements to [file]. */
    fun writeTo(file: File) = file.writeBytes(toByteArray())
}

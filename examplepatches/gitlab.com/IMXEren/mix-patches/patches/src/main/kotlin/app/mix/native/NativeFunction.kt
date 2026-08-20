package app.mix.native

/**
 * A discovered function (or function-like region) inside a native library.
 *
 * Unlike dex methods, native functions have no reliable name or signature -
 * they are discovered by prologue heuristics and symbol table entries, and are
 * fingerprinted by their instruction content (string refs, constants, patterns).
 */
class NativeFunction(
    /** The library this function belongs to. */
    val library: NativeLibrary,
    /** Entry virtual address. */
    val entryAddress: Long,
    /** Exit virtual address (exclusive end of the function body). */
    val endAddress: Long,
    /** Symbol name if this function came from the symbol table, else null. */
    val symbolName: String?,
) {
    /** Decoded instructions of this function body. */
    val instructions: List<NativeInstruction> by lazy {
        library.decodeRange(entryAddress, endAddress)
    }

    /** The file offset of the function entry - where an entry patch (e.g. `ret`) would be written. */
    val entryFileOffset: Long get() = library.vaToFileOffset(entryAddress)

    /** Address range as a LongRange. */
    val addressRange: LongRange get() = entryAddress until endAddress

    /** True if [address] falls inside this function's body. */
    fun contains(address: Long): Boolean = address in addressRange

    /**
     * Replaces instructions starting at [index] with semantic [opcodes].
     * Encoding and persistence are delegated to this function's architecture backend.
     */
    fun replaceInstructions(index: Int, vararg opcodes: NativeOpcode) {
        val mutableLibrary = library as? MutableNativeLibrary
            ?: throw UnsupportedOperationException("Library ${library.name} is not mutable")
        mutableLibrary.replaceInstructions(this, index, opcodes)
    }

    /**
     * Replaces the function entry with an immediate return.
     * Additional overloads can later provide architecture-neutral return values.
     */
    fun returnEarly() {
        replaceInstructions(0, NativeOpcode.RETURN)
    }

    /**
     * All string references made by this function: every adr/adrp whose target
     * lands in a data section, mapped to the (possibly decoded) string bytes.
     */
    val stringReferences: List<NativeStringReference> by lazy {
        val refs = mutableListOf<NativeStringReference>()
        for (instruction in instructions) {
            if (instruction.mnemonic != "adr" && instruction.mnemonic != "adrp") continue
            val target = instruction.branchTarget ?: continue
            val bytes = library.readStringBytes(target) ?: continue
            refs += NativeStringReference(instruction, target, bytes, library)
        }
        refs
    }

    /**
     * All 32/64-bit constants materialized by movz/movk chains in this function.
     * Tracks each destination register across the whole body.
     */
    val constants: List<NativeConstant> by lazy {
        data class ConstantState(
            var value: Long,
            val widthMask: Long,
            val fromMovn: Boolean,
            val instructions: MutableList<NativeInstruction>,
        )

        val registerState = HashMap<Int, ConstantState>()
        val result = mutableListOf<NativeConstant>()

        fun flush(register: Int) {
            val state = registerState.remove(register) ?: return
            result += NativeConstant(state.value and state.widthMask, state.fromMovn, state.instructions.toList())
        }

        for (instruction in instructions) {
            when (instruction.mnemonic) {
                "movz", "movn" -> {
                    flush(instruction.rd)
                    val widthMask = if (instruction.word < 0) -1L else 0xFFFF_FFFFL
                    val initial = if (instruction.mnemonic == "movn") {
                        instruction.immediate.inv() and widthMask
                    } else {
                        instruction.immediate and widthMask
                    }
                    registerState[instruction.rd] = ConstantState(
                        value = initial,
                        widthMask = widthMask,
                        fromMovn = instruction.mnemonic == "movn",
                        instructions = mutableListOf(instruction),
                    )
                }

                "movk" -> {
                    val state = registerState[instruction.rd] ?: continue
                    val laneMask = 0xFFFFL shl instruction.shift
                    state.value = (state.value and laneMask.inv()) or (instruction.immediate and laneMask)
                    state.instructions += instruction
                }

                else -> writtenRegisters(instruction).forEach(::flush)
            }
        }
        registerState.keys.toList().forEach(::flush)
        result
    }

    private fun writtenRegisters(instruction: NativeInstruction): IntArray = when (instruction.mnemonic) {
        "adr", "adrp", "add", "sub", "mov", "ldr" -> intArrayOf(instruction.rd)
        "ldp" -> intArrayOf(instruction.rt, instruction.rt2)
        "bl", "blr" -> IntArray(19) { it }
        else -> IntArray(0)
    }

    override fun toString(): String {
        val name = symbolName ?: ""
        return "NativeFunction(entry=0x${entryAddress.toString(16)}, end=0x${endAddress.toString(16)}, $name)"
    }
}

/**
 * A decoded string referenced by an adr/adrp instruction.
 */
data class NativeStringReference(
    /** The adr/adrp instruction making the reference. */
    val instruction: NativeInstruction,
    /** Virtual address of the referenced string. */
    val stringAddress: Long,
    /** Raw string bytes (before decoding). */
    val rawBytes: ByteArray,
    /** The library this reference belongs to (for string decoding). */
    val library: NativeLibrary,
) {
    /** Raw bytes decoded using the library's string decoder. */
    val decodedString: String? by lazy { library.stringDecoder(rawBytes) }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is NativeStringReference) return false
        return instruction == other.instruction && stringAddress == other.stringAddress && library === other.library
    }

    override fun hashCode(): Int = 31 * (31 * instruction.hashCode() + stringAddress.hashCode()) + library.hashCode()
}

/**
 * A constant materialized in a function body.
 */
data class NativeConstant(
    /** The final value of the register (possibly partial for multi-part chains). */
    val value: Long,
    /** True when built via movn (bitwise-not) chains. */
    val fromMovn: Boolean,
    /** The instructions that built this constant. */
    val instructions: List<NativeInstruction>,
)

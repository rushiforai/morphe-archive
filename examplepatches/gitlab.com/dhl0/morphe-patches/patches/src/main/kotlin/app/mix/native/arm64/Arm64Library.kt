package app.mix.native.arm64

import app.mix.native.NativeFunction
import app.mix.native.NativeInstruction
import app.mix.native.MutableNativeLibrary
import app.mix.native.NativeLibraryBackend
import java.io.File

/**
 * Concrete arm64 implementation of [MutableNativeLibrary].
 *
 * Parses an ELF (arm64-v8a), discovers functions via symbol table entries and
 * prologue heuristics, decodes instructions with [Arm64Decoder], and maps VAs
 * to file offsets (VA = file offset + [DEFAULT_BASE_ADDRESS]).
 */
class Arm64Library private constructor(
    /** The parsed ELF. */
    val elf: Elf,
    /** The executable code section used for function discovery. */
    val codeSection: Elf.Section,
    name: String,
    private val baseAddress: Long,
) : MutableNativeLibrary(name, elf.bytes) {

    companion object : NativeLibraryBackend {
        /** Default load bias for libraries without program headers (VA = file offset + 0x100000). */
        const val DEFAULT_BASE_ADDRESS: Long = 0x100000L

        /** Window size for reading referenced string bytes. */
        const val STRING_WINDOW: Int = 128

        override val architecture = Arm64Architecture

        /** Parses an arm64 library from raw bytes. */
        override fun parse(bytes: ByteArray, name: String): Arm64Library =
            parse(bytes, name, DEFAULT_BASE_ADDRESS)

        /** Parses an arm64 library with an explicit fallback [baseAddress]. */
        fun parse(bytes: ByteArray, name: String, baseAddress: Long): Arm64Library {
            val elf = Elf.parse(bytes)
            require(elf.machine == architecture.elfMachine) {
                "$name uses ELF machine ${elf.machine}, expected ${architecture.elfMachine} for ${architecture.abi}"
            }
            val code = elf.codeSection() ?: elf.codeSections.maxByOrNull { it.size }
            ?: error("No executable section in $name")
            return Arm64Library(elf, code, name, baseAddress)
        }

        /** Parses an arm64 library from a file. */
        @Suppress("unused")
        fun parse(file: File, name: String = file.name, baseAddress: Long = DEFAULT_BASE_ADDRESS): Arm64Library =
            parse(file.readBytes(), name, baseAddress)
    }

    override val architecture = Arm64Architecture

    override val codeStartAddress: Long = codeSection.address

    override val functions: List<NativeFunction> by lazy { discoverFunctions() }

    override val symbolFunctions: List<NativeFunction> by lazy {
        val byEntry = HashMap<Long, NativeFunction>()
        functions.forEach { byEntry[it.entryAddress] = it }
        val result = mutableListOf<NativeFunction>()
        (elf.dynamicSymbols + elf.staticSymbols).distinctBy { it.name to it.value }.forEach { symbol ->
            if (symbol.isFunction && !symbol.isUndefined && codeSection.address <= symbol.value &&
                symbol.value < codeSection.address + codeSection.size
            ) {
                val existing = byEntry[symbol.value]
                if (existing != null) {
                    if (existing.symbolName == null) result += NativeFunction(
                        this,
                        symbol.value,
                        existing.endAddress,
                        symbol.name
                    )
                } else {
                    // Symbol not caught by prologue discovery: use symbol size when available.
                    val end = symbol.value + (symbol.size.takeIf { it > 0 } ?: 0x40)
                    result += NativeFunction(this, symbol.value, end, symbol.name)
                }
            }
        }
        result
    }

    override fun decodeRange(startAddress: Long, endAddress: Long): List<NativeInstruction> {
        val length = endAddress - startAddress
        if (length <= 0 || length > Int.MAX_VALUE) return emptyList()
        val bytes = elf.readBytes(startAddress, length.toInt()) ?: return emptyList()
        return Arm64Decoder.decodeRange(bytes, startAddress)
    }

    override fun readStringBytes(va: Long): ByteArray? = elf.readAvailableBytes(va, STRING_WINDOW)

    override fun vaToFileOffset(va: Long): Long = elf.vaToFileOffset(va)
        ?: (va - baseAddress).takeIf { it >= 0 }
        ?: throw IllegalArgumentException("Address 0x${va.toString(16)} is not file-backed in $name")

    /**
     * Discovers functions in the code section.
     *
     * Heuristics, in order:
     * 1. Defined function symbols from the symbol table are authoritative starts.
     * 2. Strong entry patterns: `sub sp, sp, #N`, `bti c`, and `paciasp`.
     * 3. Branch targets are retained as overlapping function-like candidates without
     *    splitting the stronger enclosing region.
     */
    private fun discoverFunctions(): List<NativeFunction> {
        val codeStart = codeSection.address
        val codeSize = codeSection.size
        if (codeSize <= 0 || codeSize > Int.MAX_VALUE) return emptyList()
        val codeBytes = elf.readBytes(codeStart, codeSize.toInt()) ?: return emptyList()
        val instructions = Arm64Decoder.decodeRange(codeBytes, codeStart)

        val strongStarts = sortedSetOf<Long>()
        // Symbol table entries.
        (elf.dynamicSymbols + elf.staticSymbols).forEach { symbol ->
            if (symbol.isFunction && !symbol.isUndefined &&
                symbol.value in (codeStart until codeStart + codeSize)
            ) {
                strongStarts += symbol.value
            }
        }
        // Prologue heuristics.
        var i = 0
        while (i < instructions.size) {
            val insn = instructions[i]
            val isPrologue = when (insn.mnemonic) {
                "bti", "paciasp" -> true
                "sub" -> insn.rd == 31 && insn.rn == 31 && insn.immediate != 0L
                else -> false
            }
            if (isPrologue) strongStarts += insn.address
            i++
        }
        if (strongStarts.isEmpty()) {
            strongStarts += codeStart
        }

        // Strong starts partition the code section. Branch targets are additional,
        // potentially overlapping candidates and must not split their containing function.
        val sortedStrongStarts = strongStarts.sorted()
        val functions = sortedStrongStarts.mapIndexed { index, start ->
            val end = sortedStrongStarts.getOrNull(index + 1) ?: (codeStart + codeSize)
            NativeFunction(this, start, end, symbolNameFor(start))
        }.toMutableList()

        val existingStarts = strongStarts.toMutableSet()
        instructions.asSequence()
            .filter { it.mnemonic == "b" || it.mnemonic == "bl" }
            .mapNotNull { it.branchTarget }
            .filter { it in (codeStart until codeStart + codeSize) && it !in existingStarts }
            .distinct()
            .forEach { target ->
                val containingEnd = sortedStrongStarts.firstOrNull { it > target } ?: (codeStart + codeSize)
                if (target < containingEnd) {
                    functions += NativeFunction(this, target, containingEnd, symbolNameFor(target))
                    existingStarts += target
                }
            }

        return functions.sortedBy { it.entryAddress }
    }

    private fun symbolNameFor(address: Long): String? =
        (elf.dynamicSymbols + elf.staticSymbols).firstOrNull {
            it.isFunction && it.value == address
        }?.name

    override fun toString(): String = "Arm64Library($name)"
}

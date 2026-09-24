package app.mix.native

/**
 * Controls how much space is allowed between a previous [NativeInstructionFilter]
 * match and the current filter.
 */
fun interface NativeInstructionLocation {
    /**
     * @param previouslyMatchedIndex the index of the previously matched instruction, or -1 for the first filter.
     * @param currentIndex the index about to be checked.
     */
    fun indexIsValidForMatching(previouslyMatchedIndex: Int, currentIndex: Int): Boolean

    /** Matching can occur anywhere after the previous filter match (default). */
    class MatchAfterAnywhere : NativeInstructionLocation {
        override fun indexIsValidForMatching(previouslyMatchedIndex: Int, currentIndex: Int) = true
    }

    /** Matches the first instruction of a function. Only valid for the first filter. */
    class MatchFirst : NativeInstructionLocation {
        override fun indexIsValidForMatching(previouslyMatchedIndex: Int, currentIndex: Int): Boolean {
            require(previouslyMatchedIndex < 0) {
                "MatchFirst can only be used for the first instruction filter"
            }
            return currentIndex == 0
        }
    }

    /** Matches the instruction immediately after the previous filter. */
    class MatchAfterImmediately : NativeInstructionLocation {
        override fun indexIsValidForMatching(previouslyMatchedIndex: Int, currentIndex: Int): Boolean {
            require(previouslyMatchedIndex >= 0) {
                "MatchAfterImmediately cannot be used for the first instruction filter"
            }
            return currentIndex - 1 == previouslyMatchedIndex
        }
    }

    /**
     * Matches within a range of instructions after the previous filter.
     *
     * @param matchDistance the number of unmatched instructions allowed between this and the previous match.
     */
    @Suppress("unused")
    class MatchAfterWithin(val matchDistance: Int) : NativeInstructionLocation {
        init {
            require(matchDistance >= 0) { "matchDistance must be non-negative" }
        }

        override fun indexIsValidForMatching(previouslyMatchedIndex: Int, currentIndex: Int): Boolean =
            currentIndex - previouslyMatchedIndex - 1 <= matchDistance
    }
}

/**
 * A single instruction predicate for native fingerprints.
 */
fun interface NativeInstructionFilter {
    /** Where this filter is allowed to match relative to the previous filter. */
    val location: NativeInstructionLocation get() = NativeInstructionLocation.MatchAfterAnywhere()

    /** Returns true when [instruction] satisfies this filter. */
    fun matches(instruction: NativeInstruction): Boolean

    /**
     * Matches [instruction] within the context of [function], allowing filters
     * that need the whole function (e.g. resolving a branch target to a symbol).
     */
    fun matches(function: NativeFunction, instruction: NativeInstruction): Boolean = matches(instruction)
}

/** Matches any instruction. */
class AnyInstructionFilter(override val location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere()) :
    NativeInstructionFilter {
    override fun matches(instruction: NativeInstruction) = true
}

/**
 * Matches an instruction by its mnemonic (e.g. "adr", "bl", "ret", "movz").
 */
class MnemonicFilter(
    val mnemonic: String,
    override val location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) : NativeInstructionFilter {
    init {
        require(mnemonic.isNotBlank()) { "Mnemonic must not be blank" }
    }

    override fun matches(instruction: NativeInstruction) = instruction.mnemonic == mnemonic

    override fun toString() = "MnemonicFilter($mnemonic)"
}

/**
 * Matches an instruction from a set of mnemonics. Pass `null` entries to match any mnemonic.
 */
class MnemonicsFilter(
    val mnemonics: Set<String?>,
    override val location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) : NativeInstructionFilter {
    override fun matches(instruction: NativeInstruction) = null in mnemonics || instruction.mnemonic in mnemonics

    override fun toString() = "MnemonicsFilter($mnemonics)"
}

/**
 * Matches an adr/adrp instruction whose target lands inside a data section
 * and whose decoded string contains [content].
 */
class StringReferenceFilter(
    val content: String,
    override val location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) : NativeInstructionFilter {
    init {
        require(content.isNotBlank()) { "String content must not be blank" }
    }

    override fun matches(instruction: NativeInstruction) =
        (instruction.mnemonic == "adr" || instruction.mnemonic == "adrp")

    override fun matches(function: NativeFunction, instruction: NativeInstruction): Boolean {
        if (!matches(instruction)) return false
        val target = instruction.branchTarget ?: return false
        val bytes = function.library.readStringBytes(target) ?: return false
        val decoded = function.library.stringDecoder(bytes) ?: return false
        return decoded.contains(content)
    }

    override fun toString() = "StringReferenceFilter(\"$content\")"
}

/**
 * Matches a branch instruction (bl / b) whose target resolves to the given symbol
 * name or VA. Use [symbol] to match PLT imports by name (e.g. "abort"), or
 * [targetAddress] to match a specific target.
 */
class CallFilter(
    val symbol: String? = null,
    val targetAddress: Long? = null,
    override val location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) : NativeInstructionFilter {
    init {
        require(symbol != null || targetAddress != null) { "CallFilter requires a symbol or target address" }
    }

    override fun matches(instruction: NativeInstruction) = instruction.mnemonic == "bl" || instruction.mnemonic == "b"

    override fun matches(function: NativeFunction, instruction: NativeInstruction): Boolean {
        if (!matches(instruction)) return false
        val target = instruction.branchTarget ?: return false
        if (targetAddress != null) return target == targetAddress
        val resolved = function.library.symbolFunctions.firstOrNull {
            it.entryAddress == target
        }?.symbolName
        return resolved == symbol
    }

    override fun toString() = "CallFilter(${symbol ?: "0x${targetAddress?.toString(16)}"})"
}

/**
 * Matches an instruction whose constant materialization equals [value].
 * Applies to movz/movk/movn chains.
 */
class ConstantFilter(
    val value: Long,
    override val location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) : NativeInstructionFilter {
    init {
        require(value != 0L) { "Constant must be non-zero" }
    }

    override fun matches(instruction: NativeInstruction) =
        instruction.mnemonic == "movz" || instruction.mnemonic == "movk" || instruction.mnemonic == "movn"

    override fun matches(function: NativeFunction, instruction: NativeInstruction): Boolean {
        return matches(instruction) && function.constants.any {
            it.value == value && it.instructions.contains(instruction)
        }
    }

    override fun toString() = "ConstantFilter(0x${value.toString(16)})"
}

/** Matches an instruction by mnemonic. */
fun mnemonic(
    mnemonic: String,
    location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) = MnemonicFilter(mnemonic, location)

/** Matches an instruction whose mnemonic is one of the given values. `null` matches any. */
@Suppress("unused")
fun anyOf(
    vararg mnemonics: String?,
    location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) = MnemonicsFilter(mnemonics.toSet(), location)

/** Matches an adr/adrp referencing a data-section string containing [content]. */
@Suppress("unused")
fun stringReference(
    content: String,
    location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) = StringReferenceFilter(content, location)

/** Matches a bl/b to a symbol (by name) or exact VA. */
@Suppress("unused")
fun call(
    symbol: String? = null,
    targetAddress: Long? = null,
    location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) = CallFilter(symbol, targetAddress, location)

/** Matches an instruction materializing the given constant. */
@Suppress("unused")
fun constant(
    value: Long,
    location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) = ConstantFilter(value, location)

/** Matches any instruction. */
@Suppress("unused")
fun anyInstruction(
    location: NativeInstructionLocation = NativeInstructionLocation.MatchAfterAnywhere(),
) = AnyInstructionFilter(location)

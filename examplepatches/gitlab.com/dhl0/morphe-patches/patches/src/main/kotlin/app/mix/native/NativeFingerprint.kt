package app.mix.native

/**
 * A [NativeFingerprint] is a partial, declarative description of a function in a
 * native library, used to uniquely match it by its characteristics:
 *
 * - [definingLibrary]: which library (by name) the function lives in
 * - [name]: exact symbol name (if the function is exported)
 * - [filters]: an ordered list of [NativeInstructionFilter]s matching instructions
 * - [strings]: strings that must appear (via adr/adrp) anywhere in the function
 * - [constants]: constants materialized anywhere in the function
 * - [custom]: a custom predicate over the whole function
 *
 * Resolution runs against a [NativeLibPatchContext] (which holds the parsed libraries)
 * and yields a [NativeMatch] carrying the matched function and instruction matches.
 *
 * ```
 * val fingerprint = NativeFingerprint(
 *     definingLibrary = "libexample.so",
 *     strings = listOf("sensitiveApi"),
 * )
 * val match = fingerprint.match(context)   // NativeMatch
 * val offset = match.function.entryFileOffset  // where an entry patch goes
 * ```
 */
open class NativeFingerprint(
    /** Name of the library this function must be found in (by NativeLibrary.name). */
    val definingLibrary: String? = null,
    /** Exact symbol name of the function (for exported functions). */
    val name: String? = null,
    /**
     * A fingerprint that resolves to a function; this fingerprint then matches
     * against the functions that the resolved function branches to (bl/b targets).
     */
    val caller: NativeFingerprint? = null,
    /** Ordered instruction filters. First filter may match anywhere, subsequent ones per their location. */
    val filters: List<NativeInstructionFilter>? = null,
    /** Strings that must be referenced (via adr/adrp) anywhere in the function, in any order. */
    val strings: List<String>? = null,
    /** Constants that must be materialized anywhere in the function, in any order. */
    val constants: List<Long>? = null,
    /** Custom predicate over the whole function body. */
    val custom: ((function: NativeFunction) -> Boolean)? = null,
) {
    init {
        require(
            definingLibrary != null || name != null || caller != null || filters != null || strings != null ||
                    constants != null || custom != null
        ) { "At least one field must be set" }
    }

    /** Retained for source compatibility. Fingerprint matches are context-local and are not cached. */
    fun clearMatch() = Unit

    /**
     * Resolves this fingerprint against every library in the context.
     * Returns the first matching function, or null if none match.
     */
    fun matchOrNull(context: NativeLibPatchContext): NativeMatch? {
        val callerLocal = caller
        if (callerLocal != null) {
            val callerFunction = callerLocal.matchOrNull(context)?.function ?: return null
            val library = callerFunction.library
            val functionsByEntry = (library.functions + library.symbolFunctions)
                .distinctBy { it.entryAddress }
                .associateBy { it.entryAddress }

            val visited = mutableSetOf<Long>()
            val queue = ArrayDeque<Long>()
            callerFunction.instructions.forEach { instruction ->
                if (instruction.mnemonic == "b") {
                    instruction.branchTarget?.let(queue::addLast)
                }
            }

            while (queue.isNotEmpty()) {
                val target = queue.removeFirst()
                if (!visited.add(target)) continue

                // Match exact discovered starts first. If a tail-call target falls inside
                // a function-like region, retain that exact target as the candidate entry.
                val containing = library.functions.firstOrNull { it.contains(target) }
                val candidate = functionsByEntry[target] ?: containing?.let {
                    NativeFunction(
                        library, target, it.endAddress, library.symbolFunctions
                        .firstOrNull { symbol -> symbol.entryAddress == target }?.symbolName
                    )
                } ?: continue

                // A small entry made entirely from a branch is a tail-call trampoline.
                // Follow it only when no fingerprint constraints identify this exact entry.
                val meaningful = candidate.instructions
                    .dropWhile { it.mnemonic == "bti" || it.mnemonic == "paciasp" || it.mnemonic == "nop" }
                val leadingBranch = meaningful.firstOrNull()
                if (leadingBranch?.mnemonic == "b" && leadingBranch.branchTarget != null) {
                    queue.addLast(leadingBranch.branchTarget)
                    continue
                }
                // Some import-style trampolines load a target and immediately branch.
                val firstBranch = meaningful.take(4).firstOrNull { it.mnemonic == "b" }
                if (firstBranch?.branchTarget != null) {
                    queue.addLast(firstBranch.branchTarget)
                    continue
                }
                matchOrNull(context, candidate)?.let { return it }
            }
            return null
        }

        val libraries = definingLibrary?.let { requiredName ->
            context.libraries.filter { it.name == requiredName }
        } ?: context.libraries

        for (library in libraries) {
            val candidates = (library.functions + library.symbolFunctions).distinctBy { it.entryAddress }
            for (function in candidates) {
                matchOrNull(context, function)?.let { return it }
            }
        }
        return null
    }

    /**
     * Resolves this fingerprint against a specific [function].
     */
    fun matchOrNull(context: NativeLibPatchContext, function: NativeFunction): NativeMatch? {
        if (function.library !in context.libraries) return null
        if (definingLibrary != null && function.library.name != definingLibrary) return null

        val nameLocal = name
        if (nameLocal != null) {
            val functionName = function.symbolName
            if (functionName == null || functionName != nameLocal) return null
        }

        val customLocal = custom
        if (customLocal != null && !customLocal.invoke(function)) return null

        // String matches (unordered, anywhere in function).
        val stringMatches = matchStrings(function)

        // Constant matches (unordered, anywhere in function).
        val constantMatches = matchConstants(function)

        // Ordered instruction filter matches.
        val instructionMatches = matchFilters(function)

        if (strings != null && stringMatches == null) return null
        if (constants != null && constantMatches == null) return null
        if (filters != null && instructionMatches == null) return null

        return NativeMatch(this, function, instructionMatches, stringMatches, constantMatches)
    }

    /** Matches all functions in the context; returns all matches, or null if none. */
    fun matchAllOrNull(context: NativeLibPatchContext): List<NativeMatch>? {
        val result = mutableListOf<NativeMatch>()
        val libraries = if (definingLibrary != null) {
            context.libraries.filter { it.name == definingLibrary }
        } else {
            context.libraries
        }
        for (library in libraries) {
            val candidates = (library.functions + library.symbolFunctions).distinctBy { it.entryAddress }
            for (function in candidates) {
                val match = matchOrNull(context, function) ?: continue
                result += match
                clearMatch()
            }
        }
        return result.ifEmpty { null }
    }

    fun match(context: NativeLibPatchContext) =
        matchOrNull(context) ?: throw NativePatchException("Failed to match the fingerprint: $this")

    /** Resolves this fingerprint against a specific [function]. */
    @Suppress("unused")
    fun match(context: NativeLibPatchContext, function: NativeFunction) =
        matchOrNull(context, function) ?: throw NativePatchException("Failed to match: $this")

    /** Resolves this fingerprint against every matching function. */
    @Suppress("unused")
    fun matchAll(context: NativeLibPatchContext) =
        matchAllOrNull(context) ?: throw NativePatchException("Failed to match any function: $this")

    /** The matched function, or null. */
    @Suppress("unused")
    fun originalFunctionOrNull(context: NativeLibPatchContext): NativeFunction? = matchOrNull(context)?.function

    /** The matched function. */
    @Suppress("unused")
    fun originalFunction(context: NativeLibPatchContext): NativeFunction = match(context).function

    private fun matchStrings(function: NativeFunction): List<NativeMatch.StringMatch>? {
        val stringsLocal = strings ?: return null
        if (stringsLocal.isEmpty()) return null

        val matched = mutableListOf<NativeMatch.StringMatch>()
        val remaining = stringsLocal.toMutableList()
        for (reference in function.stringReferences) {
            val decoded = reference.decodedString ?: continue
            val index = remaining.indexOfFirst { decoded.contains(it) }
            if (index < 0) continue
            matched += NativeMatch.StringMatch(decoded, reference.instruction)
            remaining.removeAt(index)
            if (remaining.isEmpty()) break
        }
        return if (remaining.isEmpty()) matched else null
    }

    private fun matchConstants(function: NativeFunction): List<NativeMatch.ConstantMatch>? {
        val constantsLocal = constants ?: return null
        if (constantsLocal.isEmpty()) return null

        val matched = mutableListOf<NativeMatch.ConstantMatch>()
        val remaining = constantsLocal.toMutableList()
        for (constant in function.constants) {
            val index = remaining.indexOf(constant.value)
            if (index < 0) continue
            matched += NativeMatch.ConstantMatch(constant)
            remaining.removeAt(index)
            if (remaining.isEmpty()) break
        }
        return if (remaining.isEmpty()) matched else null
    }

    private fun matchFilters(function: NativeFunction): List<NativeMatch.InstructionMatch>? {
        val filtersLocal = filters ?: return null
        if (filtersLocal.isEmpty()) return null

        val instructions = function.instructions
        if (instructions.isEmpty()) return null

        fun findSequence(
            filterIndex: Int,
            previousMatchIndex: Int,
            searchStartIndex: Int,
        ): List<NativeMatch.InstructionMatch>? {
            if (filterIndex == filtersLocal.size) return emptyList()
            val filter = filtersLocal[filterIndex]
            var currentIndex = searchStartIndex
            while (currentIndex < instructions.size &&
                filter.location.indexIsValidForMatching(previousMatchIndex, currentIndex)
            ) {
                val instruction = instructions[currentIndex]
                if (filter.matches(function, instruction)) {
                    val remainder = findSequence(filterIndex + 1, currentIndex, currentIndex + 1)
                    if (remainder != null) {
                        return listOf(NativeMatch.InstructionMatch(filter, currentIndex, instruction)) + remainder
                    }
                }
                currentIndex++
            }
            return null
        }

        return findSequence(filterIndex = 0, previousMatchIndex = -1, searchStartIndex = 0)
    }

    override fun toString(): String =
        "NativeFingerprint(lib=$definingLibrary, name=$name, caller=$caller, strings=$strings, constants=${
            constants?.joinToString {
                "0x${
                    it.toString(
                        16
                    )
                }"
            }
        })"
}

/**
 * A match of a [NativeFingerprint] against a native function.
 */
class NativeMatch internal constructor(
    /** The fingerprint that produced this match. */
    val fingerprint: NativeFingerprint,
    /** The matched function. */
    val function: NativeFunction,
    private val _instructionMatches: List<InstructionMatch>?,
    private val _stringMatches: List<StringMatch>?,
    private val _constantMatches: List<ConstantMatch>?,
) {
    /** Matches for the [NativeInstructionFilter]s declared in the fingerprint. */
    val instructionMatches: List<InstructionMatch>
        get() = _instructionMatches ?: throw NativePatchException("Fingerprint declared no instruction filters")
    val instructionMatchesOrNull: List<InstructionMatch>? = _instructionMatches

    @Suppress("unused")
    val stringMatches: List<StringMatch>
        get() = _stringMatches ?: throw NativePatchException("Fingerprint declared no strings")

    @Suppress("unused")
    val stringMatchesOrNull: List<StringMatch>? = _stringMatches

    @Suppress("unused")
    val constantMatches: List<ConstantMatch>
        get() = _constantMatches ?: throw NativePatchException("Fingerprint declared no constants")

    @Suppress("unused")
    val constantMatchesOrNull: List<ConstantMatch>? = _constantMatches

    /** The file offset of the function entry - where an entry patch is written. */
    @Suppress("unused")
    val entryFileOffset: Long get() = function.entryFileOffset

    class InstructionMatch internal constructor(
        @Suppress("unused") val filter: NativeInstructionFilter,
        val index: Int,
        val instruction: NativeInstruction,
    )

    class StringMatch internal constructor(
        val string: String,
        val instruction: NativeInstruction,
    )

    class ConstantMatch internal constructor(
        @Suppress("unused") val constant: NativeConstant,
    )

    override fun toString(): String = "NativeMatch(function=$function, instructionMatches=$instructionMatchesOrNull)"
}

class NativePatchException(message: String) : Exception(message)

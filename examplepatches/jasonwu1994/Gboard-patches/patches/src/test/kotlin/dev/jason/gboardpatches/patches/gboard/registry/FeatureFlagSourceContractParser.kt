package dev.jason.gboardpatches.patches.gboard.registry

internal class FeatureFlagSource private constructor(
    private val tokens: List<Token>,
) {
    val strings: List<String>
        get() = tokens.filter { token -> token.kind == TokenKind.STRING }
            .map { token -> token.text }

    fun resourcePatch(propertyName: String): ResourcePatch {
        val patches = mutableListOf<ResourcePatch>()
        forEachTopLevelToken { index, token ->
            if (
                token.text != "val" ||
                tokens.getOrNull(index + 1)?.text != propertyName ||
                tokens.getOrNull(index + 2)?.text != "=" ||
                tokens.getOrNull(index + 3)?.text != "resourcePatch" ||
                tokens.getOrNull(index + 4)?.text != "("
            ) {
                return@forEachTopLevelToken
            }

            val argumentsEnd = matchingDelimiter(index + 4, "(", ")")
            val bodyStart = argumentsEnd + 1
            checkToken(bodyStart, "{")
            val bodyEnd = matchingDelimiter(bodyStart, "{", "}")
            patches += ResourcePatch(
                body = slice(bodyStart + 1, bodyEnd),
            )
        }
        if (patches.size != 1) {
            throw AssertionError(
                "Expected one top-level resourcePatch declaration for $propertyName, " +
                    "found ${patches.size}",
            )
        }
        return patches.single()
    }

    fun functionBody(functionName: String): FeatureFlagSource {
        val bodies = mutableListOf<FeatureFlagSource>()
        forEachTokenAtBraceDepth(1) { index, token ->
            if (token.kind != TokenKind.IDENTIFIER || token.text != functionName) {
                return@forEachTokenAtBraceDepth
            }
            if (tokens.getOrNull(index + 1)?.text != "(") return@forEachTokenAtBraceDepth
            val parametersEnd = matchingDelimiter(index + 1, "(", ")")
            if (parametersEnd != index + 2) return@forEachTokenAtBraceDepth
            val bodyStart = parametersEnd + 1
            if (tokens.getOrNull(bodyStart)?.text != "{") return@forEachTokenAtBraceDepth
            val bodyEnd = matchingDelimiter(bodyStart, "{", "}")
            bodies += slice(bodyStart + 1, bodyEnd)
        }
        if (bodies.size != 1) {
            throw AssertionError(
                "Expected one class-member zero-argument function body for $functionName, " +
                    "found ${bodies.size}",
            )
        }
        return bodies.single()
    }

    fun directCalls(functionName: String): List<Call> = buildList {
        forEachTopLevelToken { index, token ->
            if (token.kind != TokenKind.IDENTIFIER || token.text != functionName) return@forEachTopLevelToken
            if (tokens.getOrNull(index + 1)?.text != "(") return@forEachTopLevelToken
            val argumentsEnd = matchingDelimiter(index + 1, "(", ")")
            val receiver = if (
                index >= 2 &&
                tokens[index - 1].text == "." &&
                tokens[index - 2].kind == TokenKind.IDENTIFIER
            ) {
                tokens[index - 2].text
            } else {
                null
            }
            add(
                Call(
                    receiver = receiver,
                    arguments = splitArguments(index + 2, argumentsEnd),
                ),
            )
        }
    }

    fun directLambda(functionName: String): FeatureFlagSource {
        val bodies = mutableListOf<FeatureFlagSource>()
        forEachTopLevelToken { index, token ->
            if (token.kind != TokenKind.IDENTIFIER || token.text != functionName) return@forEachTopLevelToken
            val bodyStart = index + 1
            if (tokens.getOrNull(bodyStart)?.text != "{") return@forEachTopLevelToken
            val bodyEnd = matchingDelimiter(bodyStart, "{", "}")
            bodies += slice(bodyStart + 1, bodyEnd)
        }
        if (bodies.size != 1) {
            throw AssertionError("Expected one direct $functionName lambda, found ${bodies.size}")
        }
        return bodies.single()
    }

    fun assertExactExecutableTokens(expectedSource: String) {
        val actual = if (
            tokens.lastOrNull()?.let { token ->
                token.kind == TokenKind.SYMBOL && token.text == ";"
            } == true
        ) {
            tokens.dropLast(1)
        } else {
            tokens
        }
        val expected = lex(expectedSource)
        if (actual != expected) {
            throw AssertionError(
                "Expected executable tokens ${expected.map { token -> token.text }}, " +
                    "found ${actual.map { token -> token.text }}",
            )
        }
    }

    fun kotlinConstString(name: String): String = declaredString(
        listOf("private", "const", "val", name, "="),
    )

    fun javaStaticFinalString(name: String): String = declaredString(
        listOf("public", "static", "final", "String", name, "="),
    )

    fun qualifiedName(): String {
        if (tokens.isEmpty() || tokens.indices.any { index ->
                if (index % 2 == 0) {
                    tokens[index].kind != TokenKind.IDENTIFIER
                } else {
                    tokens[index].text != "."
                }
            }
        ) {
            throw AssertionError("Expected qualified name, found ${tokens.map { it.text }}")
        }
        return tokens.joinToString(separator = "") { token -> token.text }
    }

    private fun declaredString(prefix: List<String>): String {
        val matches = tokens.indices.filter { index ->
            prefix.indices.all { offset -> tokens.getOrNull(index + offset)?.text == prefix[offset] } &&
                tokens.getOrNull(index + prefix.size)?.kind == TokenKind.STRING
        }
        if (matches.size != 1) {
            throw AssertionError("Expected one declaration for ${prefix[prefix.size - 2]}")
        }
        return tokens[matches.single() + prefix.size].text
    }

    private fun splitArguments(start: Int, end: Int): List<FeatureFlagSource> {
        if (start == end) return emptyList()
        val arguments = mutableListOf<FeatureFlagSource>()
        var argumentStart = start
        var parentheses = 0
        var braces = 0
        var brackets = 0
        for (index in start until end) {
            if (tokens[index].kind != TokenKind.SYMBOL) continue
            when (tokens[index].text) {
                "(" -> parentheses++
                ")" -> parentheses--
                "{" -> braces++
                "}" -> braces--
                "[" -> brackets++
                "]" -> brackets--
                "," -> if (parentheses == 0 && braces == 0 && brackets == 0) {
                    arguments += slice(argumentStart, index)
                    argumentStart = index + 1
                }
            }
        }
        arguments += slice(argumentStart, end)
        return arguments
    }

    private fun matchingDelimiter(openingIndex: Int, opening: String, closing: String): Int {
        checkToken(openingIndex, opening)
        var depth = 0
        for (index in openingIndex until tokens.size) {
            if (tokens[index].kind != TokenKind.SYMBOL) continue
            when (tokens[index].text) {
                opening -> depth++
                closing -> {
                    depth--
                    if (depth == 0) return index
                }
            }
        }
        throw AssertionError("Unclosed delimiter $opening")
    }

    private inline fun forEachTopLevelToken(crossinline action: (Int, Token) -> Unit) {
        forEachTokenAtBraceDepth(0) { index, token -> action(index, token) }
    }

    private inline fun forEachTokenAtBraceDepth(
        expectedBraceDepth: Int,
        action: (Int, Token) -> Unit,
    ) {
        var parentheses = 0
        var braces = 0
        var brackets = 0
        tokens.forEachIndexed { index, token ->
            if (token.kind == TokenKind.SYMBOL) {
                when (token.text) {
                    "(" -> parentheses++
                    ")" -> parentheses--
                    "{" -> braces++
                    "}" -> braces--
                    "[" -> brackets++
                    "]" -> brackets--
                }
                return@forEachIndexed
            }
            if (parentheses == 0 && braces == expectedBraceDepth && brackets == 0) {
                action(index, token)
            }
        }
    }

    private fun checkToken(index: Int, expected: String) {
        if (tokens.getOrNull(index)?.text != expected) {
            throw AssertionError("Expected token $expected at $index")
        }
    }

    private fun slice(start: Int, end: Int): FeatureFlagSource =
        FeatureFlagSource(tokens.subList(start, end))

    data class ResourcePatch(
        val body: FeatureFlagSource,
    )

    data class Call(
        val receiver: String?,
        val arguments: List<FeatureFlagSource>,
    )

    private data class Token(
        val kind: TokenKind,
        val text: String,
    )

    private enum class TokenKind {
        IDENTIFIER,
        STRING,
        CHARACTER,
        SYMBOL,
    }

    companion object {
        fun parse(source: String): FeatureFlagSource = FeatureFlagSource(lex(source))

        private fun lex(source: String): List<Token> {
            val tokens = mutableListOf<Token>()
            var index = 0
            while (index < source.length) {
                when {
                    source[index].isWhitespace() -> index++
                    source.startsWith("//", index) -> {
                        index = source.indexOf('\n', index + 2).takeIf { it >= 0 } ?: source.length
                    }
                    source.startsWith("/*", index) -> index = skipBlockComment(source, index)
                    source.startsWith("\"\"\"", index) -> {
                        val end = source.indexOf("\"\"\"", index + 3)
                        if (end < 0) throw AssertionError("Unclosed triple-quoted string")
                        tokens += Token(
                            TokenKind.STRING,
                            source.substring(index + 3, end),
                        )
                        index = end + 3
                    }
                    source[index] == '"' -> {
                        val (value, end) = readQuoted(source, index, '"')
                        tokens += Token(TokenKind.STRING, value)
                        index = end
                    }
                    source[index] == '\'' -> {
                        val (value, end) = readQuoted(source, index, '\'')
                        tokens += Token(TokenKind.CHARACTER, value)
                        index = end
                    }
                    source[index] == '_' || source[index].isLetter() -> {
                        val start = index
                        index++
                        while (
                            index < source.length &&
                            (source[index] == '_' || source[index].isLetterOrDigit())
                        ) {
                            index++
                        }
                        tokens += Token(
                            TokenKind.IDENTIFIER,
                            source.substring(start, index),
                        )
                    }
                    else -> {
                        tokens += Token(
                            TokenKind.SYMBOL,
                            source[index].toString(),
                        )
                        index++
                    }
                }
            }
            return tokens
        }

        private fun skipBlockComment(source: String, start: Int): Int {
            var depth = 1
            var index = start + 2
            while (index < source.length && depth > 0) {
                when {
                    source.startsWith("/*", index) -> {
                        depth++
                        index += 2
                    }
                    source.startsWith("*/", index) -> {
                        depth--
                        index += 2
                    }
                    else -> index++
                }
            }
            if (depth != 0) throw AssertionError("Unclosed block comment")
            return index
        }

        private fun readQuoted(source: String, start: Int, quote: Char): Pair<String, Int> {
            val value = StringBuilder()
            var index = start + 1
            while (index < source.length) {
                val current = source[index]
                when {
                    current == '\\' -> {
                        if (index + 1 >= source.length) throw AssertionError("Unclosed quoted literal")
                        value.append(source[index + 1])
                        index += 2
                    }
                    current == quote -> return value.toString() to index + 1
                    else -> {
                        value.append(current)
                        index++
                    }
                }
            }
            throw AssertionError("Unclosed quoted literal")
        }
    }
}

internal data class FeatureFlagMarkerRuntimeContract(
    val markerPatchPropertyName: String,
    val markerConstantName: String,
    val markerLiteral: String,
    val availabilityConstantName: String,
    val runtimeFlagConstantName: String,
    val runtimeFlagLiteral: String,
    val siblingMarkerLiterals: List<String>,
)

internal fun assertFeatureFlagMarkerRuntimeContract(
    markerSource: String,
    availabilitySource: String,
    runtimeSource: String,
    contract: FeatureFlagMarkerRuntimeContract,
) {
    val markerFile = FeatureFlagSource.parse(markerSource)
    val markerPatch = markerFile.resourcePatch(contract.markerPatchPropertyName)
    val availabilityFile = FeatureFlagSource.parse(availabilitySource)
    val runtimeFile = FeatureFlagSource.parse(runtimeSource)
    val runtimeMapFactory = runtimeFile.functionBody("createFlagToFeatureKeyMap")

    assertContractEquals(
        contract.markerLiteral,
        markerFile.kotlinConstString(contract.markerConstantName),
        "marker producer literal",
    )
    assertContractEquals(
        contract.markerLiteral,
        availabilityFile.javaStaticFinalString(contract.availabilityConstantName),
        "availability consumer literal",
    )
    assertContractEquals(
        contract.runtimeFlagLiteral,
        runtimeFile.javaStaticFinalString(contract.runtimeFlagConstantName),
        "runtime flag literal",
    )

    val mapEntries = runtimeMapFactory.directCalls("put")
        .filter { call -> call.receiver == "featureKeys" }
        .map { call ->
            if (call.arguments.size != 2) {
                throw AssertionError("Expected two featureKeys.put arguments")
            }
            call.arguments[0].qualifiedName() to call.arguments[1].qualifiedName()
        }
        .filter { entry -> entry.first == contract.runtimeFlagConstantName }
        .toList()
    assertContractEquals(
        listOf(
            contract.runtimeFlagConstantName to
                "GboardPatchesFeatureAvailability.${contract.availabilityConstantName}",
        ),
        mapEntries,
        "runtime flag-to-feature map",
    )

    markerPatch.body.assertExactExecutableTokens(
        """
        compatibleWith(COMPATIBILITY_GBOARD)
        finalize {
            applyFeatureMarker(${contract.markerConstantName})
        }
        """.trimIndent(),
    )
    markerPatch.body.directLambda("finalize").assertExactExecutableTokens(
        "applyFeatureMarker(${contract.markerConstantName})",
    )
    contract.siblingMarkerLiterals.forEach { siblingMarker ->
        if (markerFile.strings.contains(siblingMarker)) {
            throw AssertionError("Marker source contains sibling marker $siblingMarker")
        }
    }
}

private fun assertContractEquals(expected: Any?, actual: Any?, label: String) {
    if (actual != expected) {
        throw AssertionError("Expected $label <$expected>, found <$actual>")
    }
}

package app.morphe.jadx.eval

import app.morphe.jadx.Log

// Directives with a body that is not made of instructions.
private val BLOCK_DIRECTIVES = listOf(".annotation", ".packed-switch", ".sparse-switch", ".array-data")

/**
 * Finds the text positions of the matched instructions, by counting the instruction lines
 * of the method in the smali text. Each line found is checked against the matched opcode.
 *
 * @return The positions, or null if the method is not in the smali text.
 */
fun findInstructionPositions(smaliText: String, match: FingerprintMatch): List<Int>? {
    val wanted = match.matchedInstructions.associateBy(MatchedInstruction::index)
    val lastWantedIndex = wanted.keys.max()
    val positions = mutableListOf<Int>()

    var inClass = false
    var inMethod = false
    var blockEnd: String? = null
    var instructionIndex = 0

    for ((lineStart, line) in smaliText.linesWithStart()) {
        val trimmed = line.trim()

        if (!inMethod) {
            if (trimmed.startsWith(".class ")) {
                inClass = trimmed.endsWith(" ${match.definingClass}")
            } else if (inClass && trimmed.startsWith(".method ") && trimmed.endsWith(" ${match.methodShortId}")) {
                inMethod = true
            }
            continue
        }

        if (blockEnd != null) {
            if (trimmed.startsWith(blockEnd)) blockEnd = null
            continue
        }
        if (trimmed.startsWith(".end method")) break

        val blockDirective = BLOCK_DIRECTIVES.firstOrNull { trimmed.startsWith(it) }
        if (blockDirective != null) {
            blockEnd = ".end ${blockDirective.removePrefix(".")}"
            continue
        }
        if (trimmed.isEmpty() || trimmed[0] in ".:#") continue

        wanted[instructionIndex]?.let { instruction ->
            val lineOpcode = trimmed.substringBefore(' ')
            if (normalizeOpcode(lineOpcode) == normalizeOpcode(instruction.opcodeName)) {
                positions.add(lineStart + line.indexOf(lineOpcode))
            } else {
                Log.warn {
                    "Smali line of instruction $instructionIndex is $lineOpcode," +
                        " expected ${instruction.opcodeName}: ${match.definingClass}->${match.methodShortId}"
                }
            }
        }
        if (instructionIndex == lastWantedIndex) break
        instructionIndex++
    }

    return if (inMethod) positions else null
}

/**
 * Each line with its start position in the text. The line ending is not assumed to be
 * a single character, as jadx uses the line separator of the platform.
 */
private fun String.linesWithStart(): Sequence<Pair<Int, String>> = sequence {
    var lineStart = 0
    while (lineStart <= length) {
        val newline = indexOf('\n', lineStart)
        val lineEnd = if (newline >= 0) newline else length
        yield(lineStart to substring(lineStart, lineEnd))
        lineStart = lineEnd + 1
    }
}

private fun normalizeOpcode(name: String) = name.uppercase().replace('-', '_').replace('/', '_')

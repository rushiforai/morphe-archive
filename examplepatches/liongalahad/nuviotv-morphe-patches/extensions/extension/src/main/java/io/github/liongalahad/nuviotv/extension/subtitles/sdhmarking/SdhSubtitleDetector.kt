package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking

/** Conservative, source-agnostic SDH evidence scorer. */
object SdhSubtitleDetector {
    private val squareBlock = Regex("(?:\\[[^\\r\\n]{1,80}]|［[^\\r\\n]{1,80}］)")
    private val parentheticalBlock = Regex("\\([^()\\r\\n]{1,60}\\)")
    private val speakerPrefix = Regex(
        "^(?:[-–—]\\s*)?(?:[\\p{L}\\p{N}][\\p{L}\\p{N}'’.-]*)(?:\\s+[\\p{L}\\p{N}][\\p{L}\\p{N}'’.-]*){0,2}\\s*:",
        RegexOption.IGNORE_CASE
    )
    private val musicMarker = Regex("[♪♫]|(?:\\u00E2\\u2122[\\u00AA\\u00AB])")
    private val sdhWords = Regex(
        "\\b(?:music|instrumental|singing|sings|applause|laughs?|laughing|sighs?|sighing|" +
            "whispers?|whispering|shouts?|shouting|screams?|screaming|gasps?|gasping|" +
            "door|phone|ringing|footsteps?|gunshots?|thunder|inaudible|indistinct)\\b",
        RegexOption.IGNORE_CASE
    )

    data class Evidence(val score: Int, val signalLines: Int, val bracketedAnnotations: Int) {
        val isSdh: Boolean get() =
            score >= MIN_SCORE &&
                signalLines >= MIN_SIGNAL_LINES &&
                bracketedAnnotations >= MIN_BRACKETED_ANNOTATIONS
    }

    /** Requires several bracketed annotations across separate lines. */
    fun inspect(text: CharSequence?): Evidence {
        if (text.isNullOrBlank()) return Evidence(0, 0, 0)
        var score = 0
        var signalLines = 0
        var bracketedAnnotations = 0
        text.toString().lineSequence().forEach { rawLine ->
            val line = rawLine.trim()
            if (line.isEmpty() || isSubtitleControlLine(line)) return@forEach

            var lineScore = 0
            val squareMatches = squareBlock.findAll(line).toList()
            val parentheticalMatches = parentheticalBlock.findAll(line).toList()
            bracketedAnnotations += squareMatches.size + parentheticalMatches.size
            lineScore += squareMatches.size
            lineScore += parentheticalMatches.size
            if (speakerPrefix.containsMatchIn(line)) lineScore += 1
            if (musicMarker.containsMatchIn(line)) lineScore += 2
            if ((squareMatches.isNotEmpty() || parentheticalMatches.isNotEmpty()) &&
                sdhWords.containsMatchIn(line)
            ) {
                lineScore += 1
            }

            if (lineScore > 0) {
                signalLines += 1
                score += lineScore.coerceAtMost(4)
            }
        }
        return Evidence(score, signalLines, bracketedAnnotations)
    }

    fun isSdh(text: CharSequence?): Boolean = inspect(text).isSdh

    private fun isSubtitleControlLine(line: String): Boolean {
        if (line.matches(Regex("\\d+"))) return true
        if (line.contains("-->") || line.startsWith("WEBVTT", ignoreCase = true)) return true
        if (line.startsWith("STYLE", ignoreCase = true) || line.startsWith("NOTE", ignoreCase = true)) return true
        if (line.startsWith("Format:", ignoreCase = true)) return true
        return false
    }

    private const val MIN_SCORE = 4
    private const val MIN_SIGNAL_LINES = 3
    private const val MIN_BRACKETED_ANNOTATIONS = 20
}

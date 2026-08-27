package io.github.liongalahad.nuviotv.extension.subtitles.sdh

import android.text.SpannableStringBuilder
import android.text.Spanned

/** SDH marker normalizer and cleaner with lyric-preserving and full-cleanup modes. */
object SdhSubtitleCleaner {
    private const val CORRUPTED_EIGHTH_NOTE = "\u00E2\u2122\u00AA"
    private const val CORRUPTED_BEAMED_NOTES = "\u00E2\u2122\u00AB"
    private const val MUSIC_MARKER_REGEX =
        "(?:[\u266A\u266B]|$CORRUPTED_EIGHTH_NOTE|$CORRUPTED_BEAMED_NOTES)"

    private val corruptedMusicMarkerPattern = Regex(
        "(?:$CORRUPTED_EIGHTH_NOTE|$CORRUPTED_BEAMED_NOTES)"
    )
    private val musicMarkerTokenPattern = Regex("""^(?:$MUSIC_MARKER_REGEX)+$""")
    private val pairedNotesPattern = Regex(
        """(?:$MUSIC_MARKER_REGEX)+\s*((?:(?!$MUSIC_MARKER_REGEX)[^\r\n]){0,80}?)\s*(?:$MUSIC_MARKER_REGEX)+"""
    )
    private val leadingNotesPattern = Regex("""^\s*(?:$MUSIC_MARKER_REGEX)+""")
    private val trailingNotesPattern = Regex("""(?:$MUSIC_MARKER_REGEX)+\s*$""")
    private val notesOnlyPattern = Regex("""^(?:\s|$MUSIC_MARKER_REGEX)+$""")
    private val quotedSongTitlePattern = Regex("""[\"“”][^\"“”\r\n]{1,60}[\"“”]""")
    private val whitespacePattern = Regex("""\s+""")
    private val dialogueWordPattern = Regex(
        """\b(?:i|i'm|i’m|me|my|mine|we|our|ours|you|your|yours|he|him|his|she|her|hers|they|them|their|this|that|who|what|where|when|why|how|please)\b""",
        RegexOption.IGNORE_CASE
    )
    private val speakerPrefixPattern = Regex("""^(\s*(?:[-–—]\s*)?)([\p{L}\p{N}][\p{L}\p{N}'’\- ]{0,31}(?:\s*\([^()\r\n]{1,24}\))?)\s*:\s*""")
    private val parentheticalQualifierPattern = Regex("""\s*\([^()]{1,24}\)\s*$""")
    private val musicWordPattern = Regex("""\b(?:music|instrumental|melody|theme|score|soundtrack|song|singing|sings|choir|orchestra|drums?|guitar|piano|violin|jazz|rock|classical)\b""", RegexOption.IGNORE_CASE)
    private val actionPattern = Regex("""\b(?:plays?|playing|continues?|continuing|starts?|starting|stops?|stopping|fades?|fading|swells?|swelling)\b""", RegexOption.IGNORE_CASE)
    private val musicMoodPattern = Regex("""\b(?:ominous|tense|dramatic|soft|quiet|loud|upbeat|somber|sad|romantic|suspenseful|eerie|gentle|background|sinister)\b""", RegexOption.IGNORE_CASE)
    private val speakerRolePattern = Regex("""^(?:man|woman|boy|girl|child|narrator|announcer|tv announcer|radio announcer|reporter|interviewer|host|operator|dispatcher|caller|spouse|husband|wife|mother|father|lawyer|attorney|judge|waiter|waitress|doctor|nurse|officer|detective|teacher|student|crowd|all|voice|voices|tom|john|mike|sarah)$""", RegexOption.IGNORE_CASE)
    private val speakerBlocklist = setOf("at", "chapter", "http", "https", "note", "ratio", "rule", "scene", "time", "visit", "warning")
    private val dialogueMarkers = setOf("-", "–", "—")

    private data class TextRange(val start: Int, val endExclusive: Int)
    private data class Replacement(val range: IntRange, val value: String)
    private data class BoundaryWrapper(
        val token: String,
        val leading: IntRange,
        val trailing: IntRange
    )

    @JvmStatic
    fun clean(
        text: CharSequence,
        mode: SdhCleanupMode = SdhCleanupMode.KEEP_LYRICS
    ): CharSequence? = cleanWithInferredTokens(text, mode, emptySet())

    internal fun cleanWithInferredTokens(
        text: CharSequence,
        mode: SdhCleanupMode,
        inferredTokens: Set<String>
    ): CharSequence? {
        if (mode == SdhCleanupMode.OFF) return text
        val normalizedMarkers = normalizeMusicSymbols(text, inferredTokens)
        if (mode == SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS) return normalizedMarkers
        if (text.isEmpty()) return null
        if (mode.removesMusicLyrics && isFullyMusicBoundedCue(normalizedMarkers.toString())) return null
        if (isMusicOnlyCue(normalizedMarkers.toString())) return null
        val withoutBlocks = if (mode.removesAnnotations) {
            removeDelimitedBlocks(normalizedMarkers)
        } else normalizedMarkers
        val lines = ArrayList<CharSequence>()
        var changed = withoutBlocks.toString() != text.toString()
        splitLines(withoutBlocks).forEach { line ->
            val cleaned = cleanLine(line, mode)
            if (cleaned == null) changed = true else {
                if (cleaned.toString() != line.toString()) changed = true
                lines += cleaned
            }
        }
        if (lines.isEmpty()) return null
        if (!changed) return text
        return joinLines(lines, withoutBlocks is Spanned)
    }

    private fun cleanLine(line: CharSequence, mode: SdhCleanupMode): CharSequence? {
        val original = line.toString()
        if (original.isBlank() || isMusicOnlyLine(original)) return null
        val removals = ArrayList<IntRange>()
        pairedNotesPattern.findAll(original).forEach { match ->
            if (mode.removesMusicLyrics || isMusicDescription(match.groups[1]?.value.orEmpty())) {
                removals += match.range
            }
        }

        var current = removeRanges(line, removals)
        var modified = removals.isNotEmpty()
        if (modified) current = normalizeSpacing(current)
        val withoutSpeaker = removeSpeakerPrefix(current) ?: return null
        if (withoutSpeaker.toString() != current.toString()) {
            current = normalizeSpacing(withoutSpeaker)
            modified = true
        }
        val visible = current.toString().trim()
        if (visible.isEmpty() || visible in dialogueMarkers || notesOnlyPattern.matches(current.toString())) return null
        return if (!modified && current.toString() == original) line else current
    }

    private fun normalizeMusicSymbols(
        source: CharSequence,
        inferredTokens: Set<String>
    ): CharSequence {
        val plain = source.toString()
        val replacements = ArrayList<Replacement>()
        corruptedMusicMarkerPattern.findAll(plain).forEach { match ->
            val note = if (match.value == CORRUPTED_BEAMED_NOTES) "♫" else "♪"
            replacements += Replacement(match.range, note)
        }
        replacements += standaloneMusicMarkerReplacements(plain)
        val wrappers = inferredBoundaryWrappers(plain, inferredTokens)
        wrappers.forEach { wrapper ->
            val notes = "♪".repeat(standaloneMusicMarkerNoteCount(wrapper.token) ?: 1)
            replacements += Replacement(wrapper.leading, notes)
            replacements += Replacement(wrapper.trailing, notes)
        }
        return replaceRanges(source, replacements)
    }

    private fun standaloneMusicMarkerReplacements(value: String): List<Replacement> =
        lineRanges(value).mapNotNull { line ->
            var start = line.start
            var end = line.endExclusive
            while (start < end && value[start].isWhitespace()) start++
            while (end > start && value[end - 1].isWhitespace()) end--
            if (start >= end) return@mapNotNull null
            val token = value.substring(start, end)
            val noteCount = standaloneMusicMarkerNoteCount(token) ?: return@mapNotNull null
            Replacement(start until end, "♪".repeat(noteCount))
        }

    private fun standaloneMusicMarkerNoteCount(token: String): Int? {
        if (token.any(Char::isWhitespace) || musicMarkerTokenPattern.matches(token)) return null
        val normalized = normalizeBoundaryToken(token)
        val core = normalized.filterNot { character ->
            character == '\'' || character == '"'
        }
        val codePoints = core.codePoints().toArray()
        if (codePoints.isEmpty() || codePoints.size > 6 || codePoints.any(Character::isDigit)) return null
        if (codePoints.any { codePoint -> codePoint != codePoints[0] }) return null

        val repeated = codePoints.size >= 2
        val codePoint = codePoints[0]
        val asciiLegacyGlyph = codePoint in 'a'.code..'z'.code && codePoint !in setOf('a'.code, 'i'.code)
        val unicodeSymbol = when (Character.getType(codePoint)) {
            Character.MATH_SYMBOL.toInt(),
            Character.CURRENCY_SYMBOL.toInt(),
            Character.MODIFIER_SYMBOL.toInt(),
            Character.OTHER_SYMBOL.toInt() -> true
            else -> false
        }
        if (!asciiLegacyGlyph && !unicodeSymbol) return null
        if (!repeated && asciiLegacyGlyph && normalized.length > 2) return null
        return codePoints.size
    }

    private fun inferredBoundaryWrappers(
        value: String,
        inferredTokens: Set<String>
    ): List<BoundaryWrapper> {
        val candidates = boundaryWrapperCandidates(value)
        val repeated = candidates.groupingBy(BoundaryWrapper::token).eachCount()
            .filterValues { count -> count >= 3 }
            .keys
        return candidates.filter { wrapper ->
            wrapper.token in inferredTokens || wrapper.token in repeated ||
                standaloneMusicMarkerNoteCount(wrapper.token) != null
        }
    }

    /** Ordered wrapper tokens used by the per-playback evidence tracker. */
    internal fun boundaryWrapperTokens(value: String): List<String> =
        boundaryWrapperCandidates(value).map(BoundaryWrapper::token)

    internal fun isSelfEvidentBoundaryToken(token: String): Boolean =
        standaloneMusicMarkerNoteCount(token) != null

    private fun boundaryWrapperCandidates(value: String): List<BoundaryWrapper> {
        val lineCandidates = lineRanges(value).mapNotNull { range ->
            boundaryWrapper(value, range)
        }
        if (lineCandidates.isNotEmpty() || !value.containsAnyLineBreak()) return lineCandidates
        return listOfNotNull(boundaryWrapper(value, TextRange(0, value.length)))
    }

    private fun boundaryWrapper(value: String, line: TextRange): BoundaryWrapper? {
        var start = line.start
        var end = line.endExclusive
        while (start < end && value[start].isWhitespace()) start++
        while (end > start && value[end - 1].isWhitespace()) end--
        if (start >= end) return null

        var leadingEnd = start
        while (leadingEnd < end && !value[leadingEnd].isWhitespace()) leadingEnd++
        if (leadingEnd >= end) return null
        var trailingStart = end
        while (trailingStart > leadingEnd && !value[trailingStart - 1].isWhitespace()) trailingStart--
        if (trailingStart <= leadingEnd) return null

        var bodyStart = leadingEnd
        while (bodyStart < trailingStart && value[bodyStart].isWhitespace()) bodyStart++
        var bodyEnd = trailingStart
        while (bodyEnd > bodyStart && value[bodyEnd - 1].isWhitespace()) bodyEnd--
        if (bodyStart >= bodyEnd) return null

        val leadingToken = value.substring(start, leadingEnd)
        val trailingToken = value.substring(trailingStart, end)
        val normalized = normalizeBoundaryToken(leadingToken)
        if (normalized != normalizeBoundaryToken(trailingToken) ||
            normalized.isEmpty() || normalized.any(Char::isDigit) ||
            normalized.codePointCount(0, normalized.length) > 4 ||
            normalized.all(::isExcludedBoundaryCharacter) ||
            musicMarkerTokenPattern.matches(leadingToken)
        ) return null
        return BoundaryWrapper(
            normalized,
            start until leadingEnd,
            trailingStart until end
        )
    }

    private fun normalizeBoundaryToken(token: String): String =
        token
            .replace('’', '\'')
            .replace('‘', '\'')
            .replace('“', '"')
            .replace('”', '"')
            .lowercase()

    private fun isExcludedBoundaryCharacter(character: Char): Boolean =
        character == '\'' || character == '"' || character.isWhitespace() ||
            character in "-–—[]［］(){}<>"

    private fun String.containsAnyLineBreak(): Boolean = any { character ->
        character == '\r' || character == '\n'
    }

    private fun lineRanges(value: String): List<TextRange> {
        val ranges = ArrayList<TextRange>()
        var start = 0
        var index = 0
        while (index < value.length) {
            if (value[index] == '\n' || value[index] == '\r') {
                ranges += TextRange(start, index)
                if (value[index] == '\r' && index + 1 < value.length && value[index + 1] == '\n') index++
                start = index + 1
            }
            index++
        }
        ranges += TextRange(start, value.length)
        return ranges
    }

    private fun removeDelimitedBlocks(source: CharSequence): CharSequence {
        val plain = source.toString()
        val removals = ArrayList<IntRange>()
        var index = 0
        while (index < plain.length) {
            val closing = when (plain[index]) {
                '[' -> ']'
                '［' -> '］'
                '(' -> ')'
                else -> null
            }
            if (closing == null) {
                index++
                continue
            }
            val closeIndex = matchingDelimiter(plain, index, plain[index], closing)
            if (closeIndex < 0) {
                index++
                continue
            }
            removals += extendBlockRange(plain, index..closeIndex)
            index = closeIndex + 1
        }
        return removeRanges(source, removals)
    }

    private fun matchingDelimiter(value: String, start: Int, opening: Char, closing: Char): Int {
        var depth = 1
        var index = start + 1
        while (index < value.length) {
            when (value[index]) {
                opening -> depth++
                closing -> {
                    depth--
                    if (depth == 0) return index
                }
            }
            index++
        }
        return -1
    }

    private fun extendBlockRange(value: String, range: IntRange): IntRange {
        val separated = extendLeadingSeparator(value, range)
        var start = separated.first
        var end = separated.last + 1
        val lineStart = value.lastIndexOfAny(charArrayOf('\r', '\n'), startIndex = start - 1) + 1
        val prefix = value.substring(lineStart, start)
        if (prefix.isBlank() || prefix.trim() in dialogueMarkers) {
            while (end < value.length && value[end].isHorizontalWhitespace()) end++
        } else if (start > lineStart && value[start - 1].isHorizontalWhitespace()) {
            while (end < value.length && value[end].isHorizontalWhitespace()) end++
        }
        if (end == separated.last + 1) {
            val lineEnd = value.indexOfAny(charArrayOf('\r', '\n'), startIndex = end)
                .let { found -> if (found < 0) value.length else found }
            if (value.substring(end, lineEnd).isBlank()) {
                while (start > lineStart && value[start - 1].isHorizontalWhitespace()) start--
            }
        }
        return start until end
    }

    private fun isMusicDescription(body: String): Boolean {
        val normalized = normalize(stripBoundaryMusicMarkers(body))
        if (normalized.isEmpty()) return true
        if (dialogueWordPattern.containsMatchIn(normalized)) return false
        val hasMusicWord = musicWordPattern.containsMatchIn(normalized)
        val describesQuotedSongPlaying =
            quotedSongTitlePattern.containsMatchIn(normalized) && actionPattern.containsMatchIn(normalized)
        return describesQuotedSongPlaying || hasMusicWord && (
            normalized == "music" || normalized == "instrumental" ||
                actionPattern.containsMatchIn(normalized) || musicMoodPattern.containsMatchIn(normalized) ||
                normalized.split(' ').size <= 3
            )
    }

    private fun isMusicOnlyLine(line: String) = isMusicOnlyCue(line)

    private fun isMusicOnlyCue(cue: String): Boolean {
        val trimmed = cue.trim()
        if (trimmed.isEmpty()) return false
        if (!leadingNotesPattern.containsMatchIn(trimmed) && !trailingNotesPattern.containsMatchIn(trimmed)) return false
        return isMusicDescription(stripBoundaryMusicMarkers(trimmed))
    }

    private fun isFullyMusicBoundedCue(cue: String): Boolean {
        val trimmed = cue.trim()
        return trimmed.isNotEmpty() &&
            leadingNotesPattern.containsMatchIn(trimmed) &&
            trailingNotesPattern.containsMatchIn(trimmed)
    }

    private fun stripBoundaryMusicMarkers(value: String): String {
        val withoutLeading = leadingNotesPattern.replace(value, "")
        return trailingNotesPattern.replace(withoutLeading, "").trim()
    }

    private fun removeSpeakerPrefix(line: CharSequence): CharSequence? {
        val plain = line.toString()
        val match = speakerPrefixPattern.find(plain) ?: return line
        val label = match.groups[2]?.value ?: return line
        val colon = match.range.first + match.value.lastIndexOf(':')
        val before = plain.getOrNull(colon - 1)
        val after = plain.drop(colon + 1).firstOrNull { !it.isWhitespace() }
        if (before?.isDigit() == true && after?.isDigit() == true) return line
        if (!isLikelySpeakerLabel(label)) return line
        if (plain.substring(match.range.last + 1).isBlank()) return null
        val start = match.groups[2]?.range?.first ?: return line
        return removeRanges(line, listOf(start..match.range.last))
    }

    private fun isLikelySpeakerLabel(raw: String): Boolean {
        val label = raw.replace(parentheticalQualifierPattern, "").trim()
        if (label.isEmpty() || label.length > 32 || "://" in label || label.lowercase() in speakerBlocklist) return false
        if (label.any(Char::isDigit) && label.any(Char::isLowerCase)) return false
        if (speakerRolePattern.matches(label)) return label.firstOrNull()?.isUpperCase() == true
        val letters = label.filter(Char::isLetter)
        if (letters.isEmpty()) return false
        if (letters.all(Char::isUpperCase)) return true
        val words = label.split(Regex("""\s+""")).filter(String::isNotBlank)
        return words.size in 1..3 && words.all { word ->
            word.split('-', '\'', '’').filter(String::isNotBlank).all { part ->
                val chars = part.filter(Char::isLetter)
                chars.isNotEmpty() && (chars.all(Char::isUpperCase) ||
                    (chars.first().isUpperCase() && chars.drop(1).all(Char::isLowerCase)))
            }
        }
    }

    private fun extendLeadingSeparator(line: String, range: IntRange): IntRange {
        val lineStart = line.lastIndexOfAny(
            charArrayOf('\r', '\n'),
            startIndex = range.first - 1
        ) + 1
        val prefix = line.substring(lineStart, range.first).trim()
        if (prefix.isNotEmpty() && prefix !in dialogueMarkers) return range
        var cursor = range.last + 1
        while (cursor < line.length && line[cursor].isHorizontalWhitespace()) cursor++
        if (line.getOrNull(cursor) != ':' && line.getOrNull(cursor) != ';') return range
        cursor++
        while (cursor < line.length && line[cursor].isHorizontalWhitespace()) cursor++
        return range.first until cursor
    }

    private fun normalize(value: String) = whitespacePattern.replace(value.trim().lowercase(), " ")

    private fun removeRanges(source: CharSequence, ranges: List<IntRange>): CharSequence {
        if (ranges.isEmpty() || source.isEmpty()) return source
        val keep = BooleanArray(source.length) { true }
        ranges.forEach { range ->
            val start = range.first.coerceIn(0, source.length)
            val end = (range.last + 1).coerceIn(start, source.length)
            for (index in start until end) keep[index] = false
        }
        return buildFromMask(source, keep)
    }

    private fun replaceRanges(source: CharSequence, replacements: List<Replacement>): CharSequence {
        if (replacements.isEmpty() || source.isEmpty()) return source
        val ordered = replacements.sortedBy { replacement -> replacement.range.first }
        fun appendParts(
            appendSource: (Int, Int) -> Unit,
            appendReplacement: (String) -> Unit
        ) {
            var cursor = 0
            ordered.forEach { replacement ->
                val start = replacement.range.first.coerceIn(cursor, source.length)
                val end = (replacement.range.last + 1).coerceIn(start, source.length)
                if (cursor < start) appendSource(cursor, start)
                appendReplacement(replacement.value)
                cursor = end
            }
            if (cursor < source.length) appendSource(cursor, source.length)
        }
        return if (source is Spanned) SpannableStringBuilder().also { out ->
            appendParts(
                { start, end -> out.append(source, start, end) },
                { value -> out.append(value) }
            )
        } else buildString {
            appendParts(
                { start, end -> append(source, start, end) },
                { value -> append(value) }
            )
        }
    }

    private fun normalizeSpacing(source: CharSequence): CharSequence {
        if (source.isEmpty()) return source
        val keep = BooleanArray(source.length) { true }
        var start = 0
        while (start < source.length && source[start].isWhitespace()) keep[start++] = false
        var end = source.length - 1
        while (end >= start && source[end].isWhitespace()) keep[end--] = false
        var previousSpace = false
        for (index in start..end) {
            val space = source[index].isHorizontalWhitespace()
            if (space && previousSpace) keep[index] = false
            previousSpace = space
        }
        return buildFromMask(source, keep)
    }

    private fun buildFromMask(source: CharSequence, keep: BooleanArray): CharSequence {
        if (keep.all { it }) return source
        fun appendRanges(append: (Int, Int) -> Unit) {
            var index = 0
            while (index < source.length) {
                while (index < source.length && !keep[index]) index++
                val start = index
                while (index < source.length && keep[index]) index++
                if (start < index) append(start, index)
            }
        }
        return if (source is Spanned) SpannableStringBuilder().also { out ->
            appendRanges { start, end -> out.append(source, start, end) }
        } else buildString { appendRanges { start, end -> append(source, start, end) } }
    }

    private fun splitLines(text: CharSequence): List<CharSequence> {
        val lines = ArrayList<CharSequence>()
        var start = 0
        var index = 0
        while (index < text.length) {
            if (text[index] == '\n' || text[index] == '\r') {
                lines += text.subSequence(start, index)
                if (text[index] == '\r' && index + 1 < text.length && text[index + 1] == '\n') index++
                start = index + 1
            }
            index++
        }
        lines += text.subSequence(start, text.length)
        return lines
    }

    private fun joinLines(lines: List<CharSequence>, spans: Boolean): CharSequence {
        if (!spans) return lines.joinToString("\n")
        return SpannableStringBuilder().also { out ->
            lines.forEachIndexed { index, line ->
                if (index > 0) out.append('\n')
                out.append(line)
            }
        }
    }

    private fun Char.isHorizontalWhitespace() = this == ' ' || this == '\t'
}

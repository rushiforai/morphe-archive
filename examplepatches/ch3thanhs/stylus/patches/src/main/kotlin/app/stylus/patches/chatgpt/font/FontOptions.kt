package app.stylus.patches.chatgpt.font

import app.morphe.patcher.patch.PatchException

private val fontFeaturePartRegex = Regex(
    """^['"]?([A-Za-z0-9]{4})['"]?(?:\s+([01]))?$""",
)

internal data class FontAxes(
    val hasWeight: Boolean,
    val hasItalic: Boolean,
)

internal fun detectFontAxes(bytes: ByteArray): FontAxes? {
    if (bytes.size < 12) return null

    fun u16(offset: Int): Int =
        ((bytes[offset].toInt() and 0xFF) shl 8) or (bytes[offset + 1].toInt() and 0xFF)

    fun u32(offset: Int): Long =
        ((bytes[offset].toLong() and 0xFF) shl 24) or
            ((bytes[offset + 1].toLong() and 0xFF) shl 16) or
            ((bytes[offset + 2].toLong() and 0xFF) shl 8) or
            (bytes[offset + 3].toLong() and 0xFF)

    val tableCount = u16(4)
    var fvarOffset = -1
    for (index in 0 until tableCount) {
        val recordOffset = 12 + index * 16
        if (recordOffset + 16 > bytes.size) return null
        if (String(bytes, recordOffset, 4, Charsets.US_ASCII) == "fvar") {
            val offset = u32(recordOffset + 8)
            if (offset > bytes.size.toLong() - 12) return null
            fvarOffset = offset.toInt()
            break
        }
    }

    if (fvarOffset < 0 || fvarOffset + 12 > bytes.size) return null

    val axesArrayOffset = u16(fvarOffset + 4)
    val axisCount = u16(fvarOffset + 8)
    val axisSize = u16(fvarOffset + 10)
    if (axisSize < 20) return null

    var hasWeight = false
    var hasItalic = false
    for (index in 0 until axisCount) {
        val axisOffset = fvarOffset.toLong() + axesArrayOffset + index.toLong() * axisSize
        if (axisOffset + 4 > bytes.size) break
        when (String(bytes, axisOffset.toInt(), 4, Charsets.US_ASCII)) {
            "wght" -> hasWeight = true
            "ital" -> hasItalic = true
        }
    }

    return if (hasWeight || hasItalic) FontAxes(hasWeight, hasItalic) else null
}

/**
 * Accepts Android's native CSS-like OpenType feature syntax and a full CSS
 * declaration for convenience. Android has no CSS engine, so the result is
 * always the string understood by Paint.setFontFeatureSettings / TextView.
 */
internal fun normalizeFontFeatureSettings(raw: String?): String? {
    var value = raw?.trim().orEmpty()
    if (value.isEmpty()) {
        return null
    }

    if (value.startsWith("font-feature-settings", ignoreCase = true)) {
        val colonIndex = value.indexOf(':')
        if (colonIndex < 0) {
            throw PatchException(
                "Invalid font feature settings. Use a value such as 'ss01' 1 " +
                    "or font-feature-settings: \"ss01\" 1;.",
            )
        }
        value = value.substring(colonIndex + 1)
    }

    value = value.trim().removeSuffix(";").trim()
    val parts = value.split(',')
        .map { it.trim() }
        .filter { it.isNotEmpty() }

    if (parts.isEmpty()) {
        throw PatchException("Font feature settings cannot be empty.")
    }

    return parts.joinToString(", ") { part ->
        val match = fontFeaturePartRegex.matchEntire(part)
            ?: throw PatchException(
                "Invalid font feature '$part'. Use four-character OpenType tags " +
                    "such as 'ss01' 1, separated by commas.",
            )

        val tag = match.groupValues[1]
        val enabled = match.groupValues[2].ifEmpty { "1" }
        "'$tag' $enabled"
    }
}

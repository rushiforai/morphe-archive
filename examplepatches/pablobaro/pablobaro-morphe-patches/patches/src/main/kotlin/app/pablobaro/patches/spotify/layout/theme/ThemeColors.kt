package app.pablobaro.patches.spotify.layout.theme

private val COLOR_REGEX = Regex("^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

private const val ALPHA_MASK = 0xFF000000.toInt()
private const val RGB_MASK = 0x00FFFFFF

// Spotify's stock dark palette (RGB only).
private const val GRAY_7 = 0x121212 // Main background.
private const val GRAY_10 = 0x181818 // Bars and sidebar background.
private const val ELEVATED = 0x1F1F1F // Cards, sheets and highlighted rows.
private const val ACCENT = 0x1ED760
private const val ACCENT_PRESSED = 0x1ABC54

internal fun isValidColor(value: String?) = value != null && COLOR_REGEX.matches(value)

/** Parses #RRGGBB or #AARRGGBB to an ARGB int. */
internal fun parseColor(value: String): Int {
    require(isValidColor(value)) { "Invalid color: $value" }
    val hex = value.removePrefix("#")
    val color = hex.toLong(16).toInt()
    return if (hex.length == 6) color or ALPHA_MASK else color
}

internal fun formatColor(color: Int) = "#%08X".format(color)

private class ColorGroup(val name: String, val originals: List<Int>, val replacement: Int)

/**
 * Maps Spotify's stock dark palette to the theme colors.
 * The keys are RGB values, so a color is replaced regardless of its alpha.
 */
internal class ThemeColors(
    background: Int,
    backgroundSecondary: Int,
    accent: Int,
    accentPressed: Int,
) {
    // Each group is left untouched when its replacement is the stock color of the group (the first one).
    private val groups = listOf(
        ColorGroup("background", listOf(GRAY_7, GRAY_10), background),
        ColorGroup("secondary background", listOf(ELEVATED), backgroundSecondary),
        ColorGroup("accent", listOf(ACCENT), accent),
        ColorGroup("pressed accent", listOf(ACCENT_PRESSED), accentPressed),
    ).filter { (it.originals.first() or ALPHA_MASK) != it.replacement }

    private val replacements: Map<Int, Int> = groups
        .flatMap { group -> group.originals.map { it to group.replacement } }
        .toMap()

    /**
     * The names of the groups to replace without any of their stock colors in [matched].
     * Every group exists in both the resources and the code, so this is checked for each of them.
     */
    fun missingGroups(matched: Collection<Int>): List<String> {
        val matchedRgb = matched.map { it and RGB_MASK }
        return groups.filter { group -> group.originals.none { it in matchedRgb } }.map { it.name }
    }

    /**
     * Opaque colors are replaced as they are. Translucent ones (gradients, overlays) keep their alpha
     * and take the replacement's RGB. Returns null if the color is not part of the palette.
     */
    fun replace(color: Int): Int? {
        val replacement = replacements[color and RGB_MASK] ?: return null
        val alpha = color and ALPHA_MASK
        return if (alpha == ALPHA_MASK) replacement else alpha or (replacement and RGB_MASK)
    }

    /** Only opaque colors, since a translucent literal in code is not necessarily a palette color. */
    fun replaceOpaque(color: Int): Int? = if (color and ALPHA_MASK == ALPHA_MASK) replace(color) else null

    /** Replaces a resource color value such as "#ff121212". References and other values are kept. */
    fun replaceResourceValue(value: String): String? {
        val trimmed = value.trim()
        if (!isValidColor(trimmed)) return null
        return replace(parseColor(trimmed))?.let(::formatColor)
    }
}

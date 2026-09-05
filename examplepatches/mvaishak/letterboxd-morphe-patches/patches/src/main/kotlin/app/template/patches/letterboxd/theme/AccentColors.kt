package app.template.patches.letterboxd.theme

/** `#RGB`/`#RRGGBB`/`#AARRGGBB` (with or without `#`) -> `#FFRRGGBB`, upper-case. */
internal fun normaliseArgb(raw: String): String {
    var hex = raw.trim().removePrefix("#")
    if (hex.length == 3) hex = hex.map { "$it$it" }.joinToString("")
    if (hex.length == 6) hex = "FF$hex"
    require(hex.length == 8 && hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) {
        "not a colour: $raw"
    }
    return "#${hex.uppercase()}"
}

/** Per-channel lerp of [from] towards [toArgb] by [t] (0..1); result is always full-alpha. */
internal fun blend(from: String, toArgb: Long, t: Float): String {
    val f = normaliseArgb(from).removePrefix("#").toLong(16)
    fun channel(shift: Int): Long {
        val a = (f shr shift) and 0xFF
        val b = (toArgb shr shift) and 0xFF
        return (a + (b - a) * t).toLong().coerceIn(0, 255)
    }
    return "#FF%02X%02X%02X".format(channel(16), channel(8), channel(0))
}

/**
 * The six accent/green colour resources -> values derived from [hex]: the pick itself for the main
 * green and `colorAccent`, a lighter shade for gradient highlights, a darker shade for the
 * pressed/gradient tail.
 */
internal fun accentColorMap(hex: String): Map<String, String> {
    val primary = normaliseArgb(hex)
    val bright = blend(primary, 0xFFFFFFFF, 0.30f)
    val dim = blend(primary, 0xFF000000, 0.42f)
    return mapOf(
        "colorAccent" to primary,
        "green00E054" to primary,
        "green0ADE53" to bright,
        "green00A010" to dim,
        "green00B020" to dim,
        "green00C030" to dim,
    )
}

/** Preset key (matches the settings ListPreference values and the overlay file names) -> overlay. */
internal val ACCENT_OVERLAYS: Map<String, Map<String, String>> = mapOf(
    "amber" to "#FFC24B",
    "orange" to "#FF8A3D",
    "coral" to "#FF6B6B",
    "pink" to "#FF7DC4",
    "violet" to "#B69CFF",
    "blue" to "#5AA9FF",
    "teal" to "#3DD9C8",
    "mono" to "#E6E6E6",
).mapValues { (_, hex) -> accentColorMap(hex) }

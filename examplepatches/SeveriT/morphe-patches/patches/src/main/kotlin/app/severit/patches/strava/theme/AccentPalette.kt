package app.severit.patches.strava.theme

import kotlin.math.abs
import kotlin.math.roundToInt

/**
 * Strava's orange brand scale (480.15), as RGB without alpha.
 *
 * The scale is generated from the base orange `#FC5200` (`core_o3` / `global_brand`):
 * darker steps multiply each channel by a factor, lighter steps blend towards white.
 * The same values are used by the XML color resources and by the Compose color
 * schemes, which hard-code them as `Color(0xFF…)` literals.
 */
private sealed interface Step {
    fun apply(accent: Int): Int

    /** Darker step: every channel multiplied by [factor]. */
    data class Shade(val factor: Double) : Step {
        override fun apply(accent: Int) = mapChannels(accent) { (it * factor).roundToInt() }
    }

    /** Lighter step: every channel blended towards white by [amount]. */
    data class Tint(val amount: Double) : Step {
        override fun apply(accent: Int) = mapChannels(accent) { (it + (255 - it) * amount).roundToInt() }
    }
}

/** [rgb] blended towards white by [amount] (0..1), as Strava's lighter scale steps are. */
internal fun tint(rgb: Int, amount: Double): Int = Step.Tint(amount).apply(rgb)

private inline fun mapChannels(rgb: Int, transform: (Int) -> Int): Int {
    val r = transform((rgb shr 16) and 0xFF).coerceIn(0, 255)
    val g = transform((rgb shr 8) and 0xFF).coerceIn(0, 255)
    val b = transform(rgb and 0xFF).coerceIn(0, 255)
    return (r shl 16) or (g shl 8) or b
}

private val ORANGE_SCALE: Map<Int, Step> = mapOf(
    0x321000 to Step.Shade(0.2), // extended_orange_o00
    0x642000 to Step.Shade(0.4), // extended_orange_o05
    0x973100 to Step.Shade(0.6), // extended_orange_o1
    0xC94100 to Step.Shade(0.8), // extended_orange_o2
    0xFC5200 to Step.Shade(1.0), // core_o3, global_brand
    0xFC4C02 to Step.Shade(1.0), // previous brand orange, still used by Pro badges
    0xFC7433 to Step.Tint(0.2),  // extended_orange_o4
    0xFD9766 to Step.Tint(0.4),  // extended_orange_o5
    0xFDB999 to Step.Tint(0.6),  // secondary_o6
    0xFDBA99 to Step.Tint(0.6),  // secondary_o6 (rounding variant)
    0xFEDCCC to Step.Tint(0.8),  // extended_orange_o7
    0xFFEAE0 to Step.Tint(0.88), // extended_orange_o8
    0xFFF5F0 to Step.Tint(0.94), // extended_orange_o9
)

/**
 * Maps every color of Strava's orange scale to the same step of a scale built from [accentRgb].
 */
internal class AccentPalette(accentRgb: Int) {
    private val replacements: Map<Int, Int> =
        ORANGE_SCALE.mapValues { (_, step) -> step.apply(accentRgb and 0xFFFFFF) }

    private val accent = Hsv.of(accentRgb)

    /** Replacement for an RGB value (no alpha), or null if it is not part of the orange scale. */
    fun replaceRgb(rgb: Int): Int? = replacements[rgb and 0xFFFFFF]

    /**
     * Like [replaceRgb], but also recolors off-scale shades with exactly Strava's orange hue, such as
     * the `#EF7C44`…`#FF8F59` gradient of the streak flame. The hue is rotated to the accent hue,
     * and saturation and brightness are scaled by how the accent differs from the brand orange,
     * so a gradient keeps its shape.
     */
    fun replaceRgbByHue(rgb: Int): Int? {
        replaceRgb(rgb)?.let { return it }

        val color = Hsv.of(rgb)
        if (abs(color.hue - BRAND.hue) > HUE_TOLERANCE) return null
        if (color.saturation < MIN_SATURATION || color.value < MIN_VALUE) return null

        return Hsv(
            hue = (accent.hue + (color.hue - BRAND.hue) + 360f) % 360f,
            saturation = (color.saturation * accent.saturation / BRAND.saturation).coerceIn(0f, 1f),
            value = (color.value * accent.value / BRAND.value).coerceIn(0f, 1f),
        ).toRgb()
    }

    /** [replaceRgbByHue] for an ARGB value, keeping its alpha. */
    fun replaceArgbByHue(argb: Int): Int? {
        val rgb = replaceRgbByHue(argb) ?: return null
        return (argb and 0xFF000000.toInt()) or rgb
    }

    /**
     * Replacement for an ARGB color resource, keeping its alpha, or null if it is not part of the
     * orange scale.
     */
    fun replaceArgb(argb: Int): Int? {
        val rgb = replaceRgb(argb) ?: return null
        return (argb and 0xFF000000.toInt()) or rgb
    }

    /**
     * Like [replaceArgb], for a number literal in code. Only the alphas Strava uses for colors are
     * accepted, because any number can look like an ARGB value: `0x90321000` is 28 days in
     * milliseconds, not a translucent `#321000`.
     */
    fun replaceLiteral(argb: Int): Int? =
        if (argb ushr 24 in LITERAL_ALPHAS) replaceArgb(argb) else null

    companion object {
        private val BRAND = Hsv.of(0xFC5200)

        /**
         * Strava's own oranges sit within a degree of 19.5°. Wider windows also catch unrelated
         * icons such as map POIs (14–18°) and the bronze achievement (21.5°).
         */
        private const val HUE_TOLERANCE = 1.5f
        private const val MIN_SATURATION = 0.4f
        private const val MIN_VALUE = 0.25f

        /** Opaque, plus the translucent variants used by Strava 480.15 (`#66…`, `#41…`, `#40…`). */
        private val LITERAL_ALPHAS = setOf(0xFF, 0x66, 0x41, 0x40)

        private val HEX_COLOR = Regex("^#?([0-9a-fA-F]{6})$")

        /** Parses `#RRGGBB` or `RRGGBB`, or returns null. */
        fun parseRgb(value: String?): Int? =
            value?.trim()?.let { HEX_COLOR.matchEntire(it) }?.groupValues?.get(1)?.toInt(16)
    }
}

/**
 * HSV color with hue in degrees and saturation/value in 0..1.
 * Implemented by hand because java.awt is not available when patching on Android.
 */
private data class Hsv(val hue: Float, val saturation: Float, val value: Float) {
    fun toRgb(): Int {
        val c = value * saturation
        val x = c * (1 - abs((hue / 60f) % 2f - 1))
        val m = value - c
        val (r, g, b) = when ((hue / 60f).toInt() % 6) {
            0 -> Triple(c, x, 0f)
            1 -> Triple(x, c, 0f)
            2 -> Triple(0f, c, x)
            3 -> Triple(0f, x, c)
            4 -> Triple(x, 0f, c)
            else -> Triple(c, 0f, x)
        }
        fun channel(v: Float) = ((v + m) * 255f).roundToInt().coerceIn(0, 255)
        return (channel(r) shl 16) or (channel(g) shl 8) or channel(b)
    }

    companion object {
        fun of(rgb: Int): Hsv {
            val r = ((rgb shr 16) and 0xFF) / 255f
            val g = ((rgb shr 8) and 0xFF) / 255f
            val b = (rgb and 0xFF) / 255f
            val max = maxOf(r, g, b)
            val delta = max - minOf(r, g, b)
            val hue = when {
                delta == 0f -> 0f
                max == r -> 60f * (((g - b) / delta) % 6f)
                max == g -> 60f * ((b - r) / delta + 2f)
                else -> 60f * ((r - g) / delta + 4f)
            }
            return Hsv(
                hue = (hue + 360f) % 360f,
                saturation = if (max == 0f) 0f else delta / max,
                value = max,
            )
        }
    }
}

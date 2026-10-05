package app.template.patches.letterboxd.theme

/**
 * Alternative dark surface palettes for the "Appearance" runtime overlay. Each map mirrors the
 * resource names in `OLED_SURFACES` (see `ThemePatch.kt`), so the same builder emits the same
 * resource id set — only the hex values differ.
 *
 * Elevated surfaces stay a shade above the background so the ratings histogram bars don't vanish
 * into a flat plane, and the bottom-sheet indirection colour stays a step darker than the base for
 * modal sheets (matching the tonal hierarchy Stock / OLED already use).
 */

/** Deep purple — hue-shifted background, muted violet surfaces. */
internal val PURPLE_SURFACES = mapOf(
    "gray0D1012" to "#FF0D0A14",
    "gray14181C" to "#FF0D0A14",
    "gray181C20" to "#FF0D0A14",
    "windowBackground" to "#FF0D0A14",
    "gray1C242C" to "#FF14101F",
    "gray202830" to "#FF14101F",
    "gray283038" to "#FF14101F",
    "gray223344" to "#FF1C1629",
    "gray2C3440" to "#FF1C1629",
    "gray303840" to "#FF1C1629",
    "gray334455" to "#FF2A1F3D",
    "gray445566" to "#FF2A1F3D",
    "colorPrimaryDark" to "#FF4A3568",
    "morphe_bottomsheet_bg" to "#FF1A1428",
)

/** Cool navy — very dark blue background, slate-blue surfaces. */
internal val MIDNIGHT_SURFACES = mapOf(
    "gray0D1012" to "#FF0A0F1A",
    "gray14181C" to "#FF0A0F1A",
    "gray181C20" to "#FF0A0F1A",
    "windowBackground" to "#FF0A0F1A",
    "gray1C242C" to "#FF121A2A",
    "gray202830" to "#FF121A2A",
    "gray283038" to "#FF121A2A",
    "gray223344" to "#FF1A2438",
    "gray2C3440" to "#FF1A2438",
    "gray303840" to "#FF1A2438",
    "gray334455" to "#FF24304A",
    "gray445566" to "#FF24304A",
    "colorPrimaryDark" to "#FF3A4D70",
    "morphe_bottomsheet_bg" to "#FF161E30",
)

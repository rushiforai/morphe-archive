package app.deviceinfo.patches.theme

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// ── How DeviceInfo dark mode is colored (3.4.4.0) ─────────────────────────────
//
// AppTheme is Material3Expressive.DayNight; on top of it the app applies one of two palettes:
//   - "Theme color" (Blue, Green, Lime, Magenta, Orange, Rose, Teal, Violet): a
//     ThemeOverlay.App.<Color> whose surface roles point at `@color/<color>_<role>`, with
//     dark values in res/values-night/colors.xml (e.g. blue_surface = #121318).
//   - "Use system colors": Material You dynamic colors, whose dark surfaces resolve through
//     `m3_sys_color_dynamic_dark_<role>` - wallpaper palette tones in values-v31, and the
//     system's own `system_surface_*_dark` tokens in values-v34.
// The plain `m3_sys_color_dark_<role>` tokens in values/colors.xml back the base theme.
// Those `*_dark_*` tokens are only referenced by dark styles, so overriding them outside a
// -night qualifier does not affect light mode.
//
// Background, surface and the low containers (cards, list items, bottom bars) go pure black.
// The high containers - dialogs, menus, text fields, chips - stay near-black so they still
// stand out from the black window behind them. Text, accent and outline colors are untouched.

private const val BLACK = "#000000"

private val PALETTE_SURFACE_OVERRIDES = mapOf(
    "background" to BLACK,
    "surface" to BLACK,
    "surfaceDim" to BLACK,
    "surfaceContainerLowest" to BLACK,
    "surfaceContainerLow" to BLACK,
    "surfaceContainer" to BLACK,
    "surfaceContainerHigh" to "#121212",
    "surfaceContainerHighest" to "#1c1c1c",
)

private val MATERIAL_SURFACE_OVERRIDES = mapOf(
    "background" to BLACK,
    "surface" to BLACK,
    "surface_dim" to BLACK,
    "surface_container_lowest" to BLACK,
    "surface_container_low" to BLACK,
    "surface_container" to BLACK,
    "surface_container_high" to "#121212",
    "surface_container_highest" to "#1c1c1c",
)

private val PALETTE_COLOR_NAME = Regex("""^[a-z]+_([A-Za-z]+)$""")
private val MATERIAL_DARK_COLOR_NAME = Regex("""^m3_sys_color_(?:dynamic_)?dark_([a-z_]+)$""")

@Suppress("unused")
val amoledDarkThemePatch = resourcePatch(
    name = "AMOLED Dark Theme",
    description = "Makes the dark theme pure black for every theme color and for \"Use system " +
        "colors\": window, cards and lists become #000000, while dialogs and menus stay " +
        "near-black so they remain visible.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        fun overrideColors(path: String, pattern: Regex, overrides: Map<String, String>) {
            document(path).use { document ->
                val colors = document.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val color = colors.item(i) as Element
                    val role = pattern.matchEntire(color.getAttribute("name"))
                        ?.groupValues?.get(1) ?: continue
                    color.textContent = overrides[role] ?: continue
                }
            }
        }

        overrideColors("res/values-night/colors.xml", PALETTE_COLOR_NAME, PALETTE_SURFACE_OVERRIDES)

        listOf(
            "res/values/colors.xml",
            "res/values-v31/colors.xml",
            "res/values-v34/colors.xml",
        ).forEach { overrideColors(it, MATERIAL_DARK_COLOR_NAME, MATERIAL_SURFACE_OVERRIDES) }
    }
}

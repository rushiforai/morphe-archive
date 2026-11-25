package app.gcontacts.patches.theme

import app.gcontacts.patches.shared.Constants.COMPATIBILITY_GCONTACTS
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// ── How Google Contacts dark mode is colored (4.90.16) ────────────────────────
//
// Theme.Contacts -> Base.V29.Theme.Contacts -> ... -> Base.Theme.Contacts.Bridge, whose
// parent Theme.GoogleMaterial3Expressive.DayNight.NoActionBar.FocusRings aliases in
// res/values-night/styles.xml to the *.Dark chain. The surface roles are bound once, far
// up that chain in Base.V14.Theme.GoogleMaterial3.Dark:
//
//     colorSurface          = @color/gm3_dark_default_color_surface
//     colorSurfaceContainer = @color/gm3_dark_default_color_surface_container
//     android:colorBackground = @color/gm3_dark_default_color_background   (= windowBackground)
//
// Each gm3_dark_default_color_<role> is an alias for gm3_sys_color_dark_<role> in
// res/values/colors.xml, which is where the literals finally sit (surface = neutral6
// #131314, container #1e1f20, …). Note Contacts uses Google's `gm3_` palette, not the
// stock `m3_` one, for its own chrome -- overriding only m3_ would change nothing.
//
// With "Use system colors" (Material You) a DynamicColors.Dark overlay is applied on top
// and re-binds the same roles to *_sys_color_dynamic_dark_<role>: the gm3_ overlay for the
// GoogleMaterial3 widgets, the m3_ ones for the Expressive/Material widgets. Those resolve
// to wallpaper palette tones in values-v31 and to the platform's own system_* tokens in
// values-v34, so all three files need the override for dynamic color to go black too.
//
// Every token touched here is a `*dark*` one, referenced only from dark styles, so writing
// them in an unqualified values/ file cannot affect light mode.
//
// Background, surface and the low containers (window, lists, cards, bottom bars) go pure
// black. The high containers -- dialogs, menus, text fields, chips -- stay near-black so
// they still read as raised against the black window behind them. `surface_bright` is left
// alone: Contacts uses it for the neutral icon buttons, which would vanish at #000000.
// Text, accent and outline colors are untouched.

private const val BLACK = "#ff000000"

private val SURFACE_OVERRIDES = mapOf(
    "background" to BLACK,
    "surface" to BLACK,
    "surface_dim" to BLACK,
    "surface_container_lowest" to BLACK,
    "surface_container_low" to BLACK,
    "surface_container" to BLACK,
    "surface_container_high" to "#ff121212",
    "surface_container_highest" to "#ff1c1c1c",
)

/** gm3_sys_color_dark_*, m3_sys_color_dark_*, and the dynamic_dark_* variants of both. */
private val DARK_COLOR_NAME = Regex("""^g?m3_sys_color_(?:dynamic_)?dark_([a-z_]+)$""")

@Suppress("unused")
val amoledDarkThemePatch = resourcePatch(
    name = "AMOLED Dark Theme",
    description = "Makes the dark theme pure black: the window, contact lists and cards become " +
        "#000000, while dialogs and menus stay near-black so they remain visible. Applies to " +
        "both the default palette and \"Use system colors\". Turn on dark mode to see it.",
    default = false,
) {
    compatibleWith(*COMPATIBILITY_GCONTACTS)

    execute {
        // values/: the static palette both gm3_ and m3_ resolve to.
        // values-v31/: Material You wallpaper tones. values-v34/: the platform system_* tokens.
        var overridden = 0
        listOf(
            "res/values/colors.xml",
            "res/values-v31/colors.xml",
            "res/values-v34/colors.xml",
        ).forEach { path ->
            document(path).use { document ->
                val colors = document.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val color = colors.item(i) as Element
                    val role = DARK_COLOR_NAME.matchEntire(color.getAttribute("name"))
                        ?.groupValues?.get(1) ?: continue
                    color.textContent = SURFACE_OVERRIDES[role] ?: continue
                    overridden++
                }
            }
        }

        // Measured on 4.90.16: 48 sites -- the 8 roles above, for each of the gm3_ and m3_
        // prefixes, in each of the three files (values/ static, values-v31 wallpaper tones,
        // values-v34 platform tokens).
        if (overridden < 40) {
            throw PatchException("overrode only $overridden dark surface colors; Contacts changed shape")
        }
    }
}

package app.anghami.patches.monet

import app.morphe.patcher.patch.resourcePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Monet dynamic colors (M3 Expressive roles, Android 12+ only).
 *
 * What it does: remaps Anghami's static neon brand accents to the system
 * Monet palette on API 31+, so buttons, chips, tab outlines and widget
 * accents follow the user's wallpaper instead of hardcoded pink/yellow.
 * Below API 31 nothing changes (the -v31 overlays are ignored, stock
 * values apply) — minSdk 23 stays safe.
 *
 * M3 Expressive mapping (scheme ROLES, not raw palette indices — per
 * https://developer.android.com/develop/ui/views/theming/dynamic-colors the
 * app must consume role tokens, which track the user's selected variant
 * (Tonal Spot / Vibrant / Expressive); raw system_accent1_* indices do not:
 *
 * | Anghami color              | M3 role (light)              | M3 role (dark)               |
 * |----------------------------|------------------------------|------------------------------|
 * | branding_pink (-> app_color, chip_selected) | primary: system_primary_light | primary: system_primary_dark |
 * | branding_yellow (night app_color/chip)      | primary: system_primary_light | primary: system_primary_dark |
 * | branding_blue (onboarding+) | secondary: system_secondary_light | secondary: system_secondary_dark |
 * | branding_purple (radar)     | tertiary: system_tertiary_light  | tertiary: system_tertiary_dark  |
 * | colorAccent (switches, checks, progress) | primary (light) | primary (dark) |
 * | translucent brand fills (disabled/tab alpha) | same role + stock alpha via ColorStateList | same |
 *
 * Why this complies with Expressive rather than just "paint it wallpaper":
 * - Accent slots map to primary/secondary/tertiary roles (Expressive keeps
 *   all three accents alive instead of collapsing everything onto accent1).
 * - Light uses the *_light roles, dark uses *_dark — the scheme roles the
 *   system guarantees 4.5:1 contrast for against their paired on-colors. The
 *   on-colors (button_primary_text_color=white, chip_selected_text) are
 *   untouched, so text-on-accent contrast can only improve vs stock
 *   (white on #FF00FF was ~3:1).
 * - Semantic colors are untouched: error reds (ayp_red/pastel_red),
 *   success green (aqua_green/branding_green), gold (anghami_gold) and the
 *   entire dark/light neutral surface scale keep stock values. Monet
 *   never recolors error/success surfaces.
 * - Opaque container roles are NOT invented for Anghami surfaces: the app's
 *   grays are already neutral, so no surface remap (avoids contrast
 *   regressions in night mode).
 * - Translucent brand fills keep their stock alpha (40/50/70/9%) layered
 *   over the dynamic role — same visual structure, wallpaper hue.
 *
 * Evidence (stock base.apk decode):
 * - app_color=@color/branding_pink (day) / @color/branding_yellow (night);
 *   referenced by 69 layouts + button/chip/tab drawables.
 * - No layout/drawable references branding_* directly; code resolves the
 *   same @color IDs at runtime, so resource overrides cover code paths too.
 * - colorAccent=@color/dark_6 (static gray) is the AppTheme widget accent.
 * - system_primary/secondary/tertiary role refs already ship in the app's
 *   own res/values-v34/colors.xml (m3_sys_color_dynamic_*), and the roles
 *   exist since API 31, so the -v31 gating is exact and links cleanly.
 *
 * Deliberately NOT done: calling DynamicColors.applyToActivitiesIfAvailable
 * (the doc's default path) or parenting AppTheme on a DynamicColors
 * overlay. That overlay rebinds colorPrimary/surface slots to scheme roles,
 * which would recolor AppTheme's gray toolbars/surfaces — a redesign, not a
 * recolor, in this M2-themed app. This patch follows the doc's "retain
 * custom colors" principle instead: surfaces and brand structure stay
 * stock, only the accent slots consume dynamic roles.
 */
@Suppress("unused")
val monetColorsPatch = resourcePatch(
    name = "Monet dynamic colors",
    description = "Replaces the static neon brand accents with wallpaper-based Monet dynamic colors (M3 Expressive primary/secondary/tertiary roles) on Android 12+. Older versions keep stock colors.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        fun writeNew(path: String, content: String) {
            get(path).also { it.parentFile?.mkdirs() }.writeText(content)
        }

        // Opaque accent roles.
        // NOTE: values files MUST be named colors.xml — the resource encoder
        // derives the entry type from the file name (trailing "s" stripped),
        // so monet_colors.xml landed in a bogus "monet_color" type and failed
        // with "Undefined entry name". New names inside a correctly-named
        // file resolve against the existing package entries fine.
        // res/values-v31/colors.xml already exists (m3 palettes) -> append;
        // res/values-night-v31/colors.xml is new -> write (base values stay
        // the pre-S fallback either way).
        val dayEntries = valuesEntries(
            "branding_pink" to "@android:color/system_primary_light",
            "branding_yellow" to "@android:color/system_primary_light",
            "branding_blue" to "@android:color/system_secondary_light",
            "branding_purple" to "@android:color/system_tertiary_light",
            "colorAccent" to "@android:color/system_primary_light",
        )
        val dayFile = get("res/values-v31/colors.xml")
        dayFile.writeText(dayFile.readText().replaceFirst("</resources>", "$dayEntries</resources>"))
        writeNew("res/values-night-v31/colors.xml",
            valuesXml(
                "branding_pink" to "@android:color/system_primary_dark",
                "branding_yellow" to "@android:color/system_primary_dark",
                "branding_blue" to "@android:color/system_secondary_dark",
                "branding_purple" to "@android:color/system_tertiary_dark",
                "colorAccent" to "@android:color/system_primary_dark",
            )
        )

        // Translucent brand fills: same M3 role as the opaque accent, stock
        // alpha preserved (0x66=0.4, 0x80=0.5, 0xB2=0.7, 0x16~=0.09).
        // A <color> tag cannot combine a reference with alpha, hence one
        // single-state ColorStateList per slot.
        val translucentDay = mapOf(
            "app_color_disabled" to 0.4,
            "app_color_transparent" to 0.5,
            "tab_app_color_new" to 0.09,
            "transparent_40_percent_app_color" to 0.4,
            "transparent_70_app_color" to 0.7,
        )
        for ((name, alpha) in translucentDay) {
            writeNew("res/color-v31/$name.xml",
                translucentSelector("@android:color/system_primary_light", alpha)
            )
            writeNew("res/color-night-v31/$name.xml",
                translucentSelector("@android:color/system_primary_dark", alpha)
            )
        }
    }
}

private fun valuesEntries(vararg entries: Pair<String, String>): String =
    buildString {
        for ((name, value) in entries) {
            appendLine("""    <color name="$name">$value</color>""")
        }
    }

private fun valuesXml(vararg entries: Pair<String, String>): String =
    buildString {
        appendLine("""<?xml version="1.0" encoding="utf-8"?>""")
        appendLine("<resources>")
        append(valuesEntries(*entries))
        appendLine("</resources>")
    }

private fun translucentSelector(colorRef: String, alpha: Double): String =
    """<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:color="$colorRef" android:alpha="$alpha" />
</selector>
"""

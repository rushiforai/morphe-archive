package app.template.patches.busuu

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BUSUU
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Build-time AMOLED theme for Busuu.
 *
 * Busuu ships its dark theme as `res/values-night/colors.xml` — a full override
 * set that swaps the day palette for dark surfaces (#151617 canvas, #252b2f
 * greys, #3e3e3e cards). This patch rewrites every matching dark surface to
 * true black (#FF000000) or near-black, so an OLED screen saves power and the
 * theme reads as genuine AMOLED instead of dark grey.
 *
 * The rewrite is value-based, not name-based: any opaque <color> whose hex falls
 * into a "dark neutral surface" band (low chroma, max channel <= 80) gets driven
 * to the canvas black, unless its name is on the protected list (text ink, icon
 * tints, accent-adjacent colours). This catches surface names we never curated,
 * which is the difference between "mostly dark" and "actually AMOLED".
 *
 * Also patches the system navigation bar. Busuu's themes hardcode
 * android:navigationBarColor to white in several places, with no night override,
 * so the system nav bar stays white even when the app itself is dark. The patch
 * flips those to black and clears android:windowLightNavigationBar.
 *
 * Only values-night/colors.xml is swept for surfaces. The day colors file is
 * left alone so light mode is untouched. The day styles.xml IS patched, because
 * Busuu ships no values-night/styles.xml — see the nav bar block in execute {}.
 */
@Suppress("unused")
val busuuAmoledPatch = resourcePatch(
    name = "AMOLED (baked in)",
    description = "Bakes a true-black AMOLED theme into Busuu at patch time by darkening " +
        "every dark surface in its night-mode palette and forcing the system navigation " +
        "bar black. Works on every Android version. Changing it later requires re-patching.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BUSUU)

    execute {
        // ── Marker resource ──
        // Presence of this colour tells runtime code the build-time theme patch
        // ran. Written to the day file unconditionally, matching Letterboxd's
        // BakedThemePatch pattern.
        document("res/values/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/colors.xml has no root element")
            if (!hasColor(document, "morphe_baked_theme")) {
                resources.appendChild(
                    document.createElement("color").apply {
                        setAttribute("name", "morphe_baked_theme")
                        textContent = "#FF000000"
                    }
                )
            }
        }

        // ── Value-based surface sweep ──
        // Two candidate paths because Morphe's patcher exposes the night file
        // at different virtual paths depending on how it decoded the APK.
        val palettePaths = listOf(
            "res/values-night/colors.xml",
            "resources/res/values-night/colors.xml",
        )

        var wrote = false

        for (path in palettePaths) {
            val exists = try {
                get(path).isFile
            } catch (t: Throwable) {
                false
            }
            if (!exists) continue

            document(path).use { document ->
                val resources = document.documentElement
                    ?: throw PatchException("$path has no root element")

                val nodes = document.getElementsByTagName("color")
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as Element
                    val name = el.getAttribute("name")
                    if (name in BUSUU_PROTECTED_NAMES) continue

                    val raw = el.textContent.trim()

                    // Only touch values that classify as dark surfaces.
                    if (amoledSurfaceFor(raw) == null) continue

                    // Elevated surfaces keep an edge against the canvas;
                    // everything else goes to pure black.
                    el.textContent =
                        if (name in BUSUU_ELEVATED_NAMES) AMOLED_ELEVATED else AMOLED_BLACK
                }
            }

            wrote = true
        }

        if (!wrote) {
            throw PatchException(
                "No Busuu night colours file found at any known path " +
                    "(tried: ${palettePaths.joinToString()})"
            )
        }

        // ── System navigation bar ──
        // Busuu's themes declare android:navigationBarColor per-theme, most of
        // them as @color/white or @android:color/white, and BusuuPrimaryWhiteTheme
        // also sets android:windowLightNavigationBar=true. That's why the system
        // nav bar renders white even when Busuu's UI is dark. There is no
        // values-night/styles.xml in the APK, so the day styles file is the only
        // place these declarations live.
        //
        // Only override the ones that are white or theme-referenced. Brand nav
        // bars (BusuuTheme.BlueTheme, BusuuTheme.Onboarding) and already-dark
        // ones (BusuuTheme.Black, BusuuTheme.BlackStatusBar) are left alone.
        // Transparent bars (LoadingScreen, EdgeToEdgeFloatingDialogTheme) are
        // also left alone — they're deliberate edge-to-edge overlays.
        val stylePaths = listOf(
            "res/values/styles.xml",
            "resources/res/values/styles.xml",
        )

        val whiteNavBarValues = setOf(
            "@android:color/white",
            "@color/white",
            "?android:attr/colorBackground",
        )

        for (stylePath in stylePaths) {
            val styleExists = try {
                get(stylePath).isFile
            } catch (t: Throwable) {
                false
            }
            if (!styleExists) continue

            document(stylePath).use { document ->
                val items = document.getElementsByTagName("item")
                for (i in 0 until items.length) {
                    val el = items.item(i) as Element
                    when (el.getAttribute("name")) {
                        "android:navigationBarColor" -> {
                            val current = el.textContent.trim()
                            if (current in whiteNavBarValues) {
                                el.textContent = "#FF000000"
                            }
                        }
                        "android:windowLightNavigationBar" -> {
                            // Only flip the ones that are true (dark icons on
                            // light bar). Flipping false→false is a no-op.
                            if (el.textContent.trim() == "true") {
                                el.textContent = "false"
                            }
                        }
                    }
                }
            }
        }
    }
}

/** True if a <color name="[name]"> already exists in [document]. */
private fun hasColor(document: Document, name: String): Boolean {
    val nodes = document.getElementsByTagName("color")
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as Element
        if (el.getAttribute("name") == name) return true
    }
    return false
}

// ────────────────────────────────────────────────────────────────────────────
// Value-based surface detection. Same thresholds as Brave's AMOLED patch:
// chroma <= 40 and maxChannel <= 80 classifies a low-chroma dark neutral as a
// chrome surface, with a known-hexes allowlist for values on the edge of that
// band. Everything else (light ink, accents, overlays, transparent) is left.
// ────────────────────────────────────────────────────────────────────────────

private val HEX_COLOR = Regex("""^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$""")

private data class Rgb(val r: Int, val g: Int, val b: Int, val a: Int) {
    val maxChannel: Int get() = maxOf(r, g, b)
    val chroma: Int get() = maxChannel - minOf(r, g, b)
}

private fun parseHexColor(value: String): Rgb? {
    val trimmed = value.trim()
    if (!HEX_COLOR.matches(trimmed)) return null
    val body = trimmed.substring(1)
    return when (body.length) {
        3 -> Rgb(
            body[0].digitToInt(16) * 17,
            body[1].digitToInt(16) * 17,
            body[2].digitToInt(16) * 17,
            0xFF,
        )
        6 -> Rgb(
            body.substring(0, 2).toInt(16),
            body.substring(2, 4).toInt(16),
            body.substring(4, 6).toInt(16),
            0xFF,
        )
        8 -> Rgb(
            body.substring(2, 4).toInt(16),
            body.substring(4, 6).toInt(16),
            body.substring(6, 8).toInt(16),
            body.substring(0, 2).toInt(16),
        )
        else -> null
    }
}

private fun normalizeOpaqueHex(value: String): String? {
    val rgb = parseHexColor(value) ?: return null
    if (rgb.a != 0xFF) return null
    return "#%02x%02x%02x".format(rgb.r, rgb.g, rgb.b).lowercase()
}

/**
 * Dark neutral surface literals observed in Busuu's values-night palette. Kept
 * explicit so the classification doesn't depend on thresholds at the boundary
 * of the chroma/maxChannel test.
 */
private val BUSUU_KNOWN_DARK_HEXES = setOf(
    "#151617", // busuu_main_background night
    "#121314", // white_secondary_background night
    "#252b2f", // busuu_grey_dark / busuu_dark_grey_night_mode_compat
    "#202124", // busuu_black_dark night
    "#232323", // busuu_tooltip_background
    "#323232", // busuu_snackbar_dark_grey
    "#383a42", // busuu_bottom_modal / light_gray_background / shimmer_first
    "#3e3e3e", // busuu_grey_lesson_background / white_background night
    "#444550", // shimmer_second_color
    "#1e1e1e", // loading spinner canvas
    "#545461", // neutral_ui_divider
)

/**
 * Surfaces that stay just above black so cards/sheets retain an edge against
 * the pure-black canvas. Mirrors Letterboxd's OLED_BAKED, which keeps
 * gray1C242C / gray202830 at #121212 instead of driving everything flat.
 */
private val BUSUU_ELEVATED_NAMES = setOf(
    "busuu_bottom_modal",
    "busuu_white_background_alt",
    "white_background",
    "light_gray_background",
    "busuu_grey_lesson_background",
    "busuu_grey_xlite3",
    "busuu_grey_xlite_background",
    "shimmer_first_color",
    "shimmer_second_color",
    "busuu_snackbar_dark",
    "busuu_tooltip_background",
    "neutral_ui_divider",
)

private const val AMOLED_BLACK = "#FF000000"
private const val AMOLED_ELEVATED = "#FF0A0A0A"

/**
 * Names that must never be flattened. Text ink, icon tints, accents, overlays,
 * and accent-side design tokens. This is the closest equivalent to Brave's
 * `collectTextBearingIds` for a Compose app — Brave walks styles/layout XML,
 * but Busuu's Compose UI doesn't carry the ids there, so the protected set is
 * explicit.
 */
private val BUSUU_PROTECTED_NAMES = setOf(
    // ── Text ink ──
    "text_black",
    "text_blue",
    "text_blue_2",
    "text_blue_dark",
    "text_blue_gray",
    "text_blue_light",
    "text_body_text",
    "text_body_text_grey_darker",
    "text_dark_gray",
    "text_gray_body_text",
    "text_grey_heading",
    "text_hint",
    "text_light_black_body_text",
    "text_placeholder",
    "text_secondary",
    "text_tertiary",
    "text_title_black",
    "text_title_dark",
    "text_white",
    "textcolor_ottv",
    "checkpoint_label",
    "dialogue_highlight_color",

    // ── Foregrounds / tints ──
    "busuu_icon_toolbar_tint",
    "busuu_dark_grey_night_mode_compat",
    "busuu_grey_night_mode_compat",
    "ot_default_text_color",
    "contentTextColorOT",
    "groupTextOT",

    // ── Accent family ──
    "accent_standard",
    "busuu_azura_eletric_blue",
    "busuu_black_100",
    "busuu_blue",
    "busuu_blue_50",
    "busuu_blue_alpha10",
    "busuu_blue_alpha16",
    "busuu_blue_alpha30",
    "busuu_blue_alpha50",
    "busuu_blue_button_disabled",
    "busuu_blue_dark",
    "busuu_blue_darker",
    "busuu_blue_lite",
    "busuu_blue_lite_highlight",
    "busuu_blue_outline",
    "busuu_blue_tool",
    "busuu_blue_xdark",
    "busuu_blue_xlite",
    "busuu_blueish_grey",
    "busuu_bright_red",
    "busuu_cerulean_blue",
    "busuu_eletric_violet",
    "busuu_gold",
    "busuu_gold_alpha20",
    "busuu_gold_dark",
    "busuu_gold_lite",
    "busuu_gold_lively",
    "busuu_gold_lively_alpha20",
    "busuu_green",
    "busuu_green_alpha",
    "busuu_green_alpha20",
    "busuu_green_dark",
    "busuu_green_lime",
    "busuu_green_lime1",
    "busuu_green_lite",
    "busuu_green_opacity",
    "busuu_green_progress",
    "busuu_grey",
    "busuu_grey_4",
    "busuu_grey_alpha_68",
    "busuu_grey_close_button",
    "busuu_grey_dark_alpha50",
    "busuu_grey_dark_alpha78",
    "busuu_grey_dark_opacity_40",
    "busuu_grey_lite",
    "busuu_grey_lite1",
    "busuu_grey_silver",
    "busuu_grey_xlite1",
    "busuu_grey_xlite2",
    "busuu_grey_xlite2_alpha80",
    "busuu_light_lime",
    "busuu_light_lime_dark",
    "busuu_obsidian_blue",
    "busuu_purple",
    "busuu_purple_dark",
    "busuu_purple_darkmode_compat",
    "busuu_purple_highlight_darkmode_compat",
    "busuu_purple_light_darkmode_compat",
    "busuu_purple_lit",
    "busuu_purple_lite",
    "busuu_purple_neutral",
    "busuu_purple_xdark",
    "busuu_purple_xlite",
    "busuu_purple_xxdark",
    "busuu_purple_xxlite",
    "busuu_purple_xxxlite",
    "busuu_red",
    "busuu_red_alha_20",
    "busuu_red_alpha",
    "busuu_red_alpha20",
    "busuu_red_dark",
    "busuu_red_lite",
    "busuu_red_opacity",
    "busuu_red_xlow_alpha",
    "busuu_white_10_alpha",
    "busuu_white_15_alpha",
    "busuu_white_23_alpha",
    "busuu_white_30_alpha",
    "busuu_white_40_alpha",
    "busuu_white_50_alpha",
    "busuu_white_60_alpha",
    "busuu_white_80_alpha",
    "busuu_white_90_alpha",
    "notification_red",
    "mountain_meadow",
    "rose_51",
    "violet_58",

    // ── Overlays (translucent, never surfaces) ──
    "spotlight_background",
    "trans_light_greyOT",
    "bgTransparentOT",
    "otTvTransparent",

    // ── Purchasely foregrounds ──
    "ply_subscriptions_primary",
    "ply_subscriptions_secondary",
    "ply_white_25",
    "ply_white_75",
    "ply_white_tv",
    "ply_blue",

    // ── Accent-side design tokens ──
    "accent_material_dark",
    "accent_material_light",
    "colorAccentOTUI",
    "colorPrimaryDarkOT",
    "colorPrimaryOT",
    "banner_experiment_varient_2_button_text",
    "facebook_blue",
    "flat_normal_text",
    "flat_disabled_text",
    "flat_pressed",
    "switch_thumb",
    "locked_lesson_blue_alpha30",
    "exercise_button_consumed",
    "dashed_border_colour",
)

/**
 * Returns non-null if the raw hex value classifies as a dark neutral surface,
 * which is the gate the caller uses to decide whether to rewrite the colour.
 * The exact value returned isn't used — the caller picks black vs. elevated —
 * so this is effectively a predicate with a nullable-return signature.
 */
private fun amoledSurfaceFor(rawValue: String): String? {
    val normalized = normalizeOpaqueHex(rawValue) ?: return null
    val rgb = parseHexColor(normalized) ?: return null

    // Chroma > 40 -> accent (blue/purple/red/green etc.). Not a surface.
    if (rgb.chroma > 40) return null

    // A dark surface: max channel <= 80, or explicitly in the known set.
    val isDarkNeutral = rgb.maxChannel <= 80 || normalized in BUSUU_KNOWN_DARK_HEXES
    if (!isDarkNeutral) return null

    return AMOLED_BLACK
}

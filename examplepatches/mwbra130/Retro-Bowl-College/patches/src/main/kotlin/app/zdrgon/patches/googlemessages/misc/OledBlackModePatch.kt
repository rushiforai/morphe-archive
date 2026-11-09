package app.zdrgon.patches.googlemessages.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.googlemessages.shared.Constants.COMPATIBILITY_GOOGLE_MESSAGES
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * Google Messages — OLED black mode.
 *
 * Target/build info comes from coloradude's morphe-google-messages-patch;
 * his only patch (a keyword message filter) is deliberately NOT carried
 * over. This patch replaces it with a true-black dark theme.
 *
 * Recon on the exact target build (messages.android_20261020_00_RC01
 * .phone_dynamic, versionCode 326371063, universal APK): the dark theme
 * is resource-driven. The GM3 dark scheme hangs off
 * gm3_sys_color_dark_* entries in res/values/colors.xml (background and
 * surface point at gm3_ref_palette_neutral6, #131314; containers are
 * literals #1B1B1B–#37393B), the legacy GM scheme points at
 * gm_ref_palette_grey900 (#202124), the M3 library scheme at
 * m3_ref_palette_neutral6 (#141218), and res/values-night/colors.xml
 * carries app-specific literals (primary background, RCS consent
 * surface, per-conversation-color scheme surfaces). An exhaustive smali
 * scan of all 12 dex files (plus the packed-value binary scan) found no
 * app-level Compose color scheme or hardcoded dark greys in app code,
 * so a pure resource patch covers the theme.
 *
 * v2 (bundle 1.65.1): v1 (52 edits) applied cleanly in Morphe Desktop
 * and its output verified value-by-value, but Matsen's Morphe Manager
 * build crashed on launch. Static crash investigation found no
 * signature/integrity self-check and a clean resource rebuild (all
 * 12,984 resource IDs identical), so v2 is a deliberate bisection step:
 * it keeps ONLY the app's own three dark schemes (GM3, legacy GM, M3)
 * plus the night background literals and per-conversation scheme
 * surfaces (33 edits), and drops every library-surface edit (Material
 * design defaults, SettingsLib, setup-wizard/sud, survey), the shared
 * material_grey_white_1000 color, app chrome literals (dialog, FAB,
 * action bar) and the res/color textfield selector rewrite — the only
 * cross-resource-type edit in v1. If v2 launches, the dropped groups
 * come back in stages to find the culprit; the main screens (list,
 * conversation view) still go true black in v2, dialogs/FAB/input
 * field stay stock dark for now.
 *
 * Two rules keep this safe:
 *  - Only *_dark_* entries and night literals are repointed. The shared
 *    palette colors themselves (gm3_ref_palette_neutral6,
 *    gm_ref_palette_grey900, m3_ref_palette_neutral6, ...) are NEVER
 *    edited: grey900 in particular is also a light-mode text/content
 *    color, so blackening the palette would break light mode.
 *  - Backgrounds/surfaces go pure black (#000000); raised containers
 *    become near-black steps (#0A0A0A–#2E2E2E in the same order the
 *    stock containers step up) so incoming bubbles, cards and dialogs
 *    stay distinguishable from the background.
 *
 * Known limits, stated plainly: on Android 12+ a few SettingsLib /
 * setup-wizard surfaces resolve to @android:color/system_* framework
 * colors, which no APK resource edit can change; those screens keep
 * the system dark grey. Light mode is untouched.
 */
@Suppress("unused")
val oledBlackModePatch = resourcePatch(
    name = "OLED black mode",
    description = "Turns the dark theme true black (#000000) for OLED screens: backgrounds and " +
        "surfaces go pure black, raised containers (cards, bubbles, sheets) become near-black " +
        "steps so they stay visible. Dark theme only — light " +
        "mode is untouched. Needs the stock APK of the target version " +
        "(messages.android_20261020_00_RC01.phone_dynamic, the universal APK — not a BUNDLE — " +
        "from APKMirror: https://www.apkmirror.com/apk/google-inc/messenger-google-inc/); " +
        "Morphe Manager also suggests that exact version when you don't have the file. " +
        "A few settings screens on Android 12+ take surfaces from the system palette and " +
        "stay dark grey.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MESSAGES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        fun setColors(path: String, edits: Map<String, String>) {
            document(path).use { document ->
                val byName = HashMap<String, Element>()
                val all = document.getElementsByTagName("color")
                for (i in 0 until all.length) {
                    val element = all.item(i) as Element
                    byName[element.getAttribute("name")] = element
                }
                val missing = edits.keys.filter { it !in byName }
                if (missing.isNotEmpty()) {
                    throw PatchException(
                        "OLED black mode: $path is missing expected color entries " +
                            missing.joinToString(", ") +
                            "; refusing to ship a half-applied theme."
                    )
                }
                edits.forEach { (name, value) ->
                    byName.getValue(name).textContent = value
                }
                logger.info("OLED black mode: rewrote ${edits.size} colors in $path.")
            }
        }

        // Base values: the app's own GM3, legacy GM and M3 dark
        // schemes only (v2 scope, see header). Dark entries only —
        // palettes untouched.
        setColors(
            "res/values/colors.xml",
            mapOf(
                "gm3_sys_color_dark_background" to "#FF000000",
                "gm3_sys_color_dark_surface" to "#FF000000",
                "gm3_sys_color_dark_surface_dim" to "#FF000000",
                "gm3_sys_color_dark_surface_container_lowest" to "#FF000000",
                "gm3_sys_color_dark_surface_container_low" to "#FF0A0A0A",
                "gm3_sys_color_dark_surface_container" to "#FF121212",
                "gm3_sys_color_dark_surface_container_high" to "#FF1C1C1C",
                "gm3_sys_color_dark_surface_container_highest" to "#FF262626",
                "gm3_sys_color_dark_surface_bright" to "#FF2E2E2E",
                "gm3_sys_color_dark_surface_variant" to "#FF262626",
                "gm_sys_color_dark_background" to "#FF000000",
                "gm_sys_color_dark_surface" to "#FF000000",
                "m3_sys_color_dark_background" to "#FF000000",
                "m3_sys_color_dark_surface" to "#FF000000",
                "m3_sys_color_dark_surface_dim" to "#FF000000",
                "m3_sys_color_dark_surface_container_lowest" to "#FF000000",
                "m3_sys_color_dark_surface_container_low" to "#FF0A0A0A",
                "m3_sys_color_dark_surface_container" to "#FF121212",
                "m3_sys_color_dark_surface_container_high" to "#FF1C1C1C",
                "m3_sys_color_dark_surface_container_highest" to "#FF262626",
                "m3_sys_color_dark_surface_bright" to "#FF2E2E2E",
                "m3_sys_color_dark_surface_variant" to "#FF262626"
            )
        )

        // Night values: the app's own background literals and every
        // per-conversation custom-color scheme surface (v2 scope —
        // library surfaces, dialog/FAB/action-bar chrome and the
        // shared material_grey_white_1000 are NOT touched here).
        setColors(
            "res/values-night/colors.xml",
            mapOf(
                "primary_background_color" to "#FF000000",
                "rcs_consent_screen_background_color" to "#FF000000",
                "bugle_color_background_floating_variant" to "#FF262626",
                "blue_color_scheme_surface" to "#FF000000",
                "fuchsia_color_scheme_surface" to "#FF000000",
                "green_color_scheme_surface" to "#FF000000",
                "monochrome_color_scheme_surface" to "#FF000000",
                "orange_color_scheme_surface" to "#FF000000",
                "pink_color_scheme_surface" to "#FF000000",
                "purple_color_scheme_surface" to "#FF000000",
                "turquoise_color_scheme_surface" to "#FF000000"
            )
        )
    }
}

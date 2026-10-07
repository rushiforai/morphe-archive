package app.anghami.patches.amoled

import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import app.morphe.patcher.patch.resourcePatch

/**
 * AMOLED black background (dark mode only).
 *
 * Night `window_background_color` is stock `@color/dark_15` (`#ff0c0d0d`,
 * near-black). This remaps the night slot to pure black `#ff000000`, so the
 * main app background (and anything else resolving the role, e.g. the nav
 * bar via `styles.xml`, and `player_bg` for Player-theme users) lights no
 * pixels on OLED.
 *
 * Scope is deliberately minimal: only the window role. Cards, bottom
 * sheets, dialogs (`dark_3`, `dark_6`, `dark_7`, ...) keep stock greys so
 * elevation contrast survives. Day qualifier untouched.
 *
 * Evidence (stock `the-stock-apk` decode): night `window_background_color` has
 * no `-v31`/`-v29` override and no code references — pure resource
 * role, 94 refs across 79 files.
 *
 * NOTE: values files MUST stay named `colors.xml` — the encoder derives the
 * entry type from the file name (see MonetColorsPatch).
 */
@Suppress("unused")
val amoledBlackPatch = resourcePatch(
    name = "AMOLED black background",
    description = "Forces pure-black app background in dark mode (window_background_color -> #000000). Surfaces/cards keep stock greys; light mode untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        val file = get("res/values-night/colors.xml")
        file.writeText(
            file.readText().replaceFirst(
                "</resources>",
                "    <color name=\"window_background_color\">#ff000000</color>\n</resources>",
            ),
        )
    }
}

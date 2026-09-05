package app.template.patches.letterboxd

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.letterboxd.theme.setStyleItem
import app.template.patches.letterboxd.theme.upsertColor
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

/** A dark surface colour: [fallback] for Android 11 and below, [dynamic] wallpaper ref for `-v31`. */
private data class Tone(val fallback: String, val dynamic: String)

/**
 * Letterboxd hard-codes its dark palette as named colours (`@color/gray181C20` …) that the theme
 * and ~400 component styles reference directly, so runtime `DynamicColors` recolours almost
 * nothing. This patch repoints those surface greys at the device's Material You palette on Android
 * 12+ and flattens the app-bar / tab-strip / bottom-nav / sheet chrome onto them.
 *
 * Below Android 12 the greys keep their stock values (there is no dynamic palette). Text, icon and
 * hint greys and white are untouched. No effect on Jetpack Compose screens.
 *
 * Surface *colour* alone (without the chrome flattening) is also available at runtime in the "Mod
 * settings" screen; this patch is the full patch-time treatment.
 */
private val PALETTE = mapOf(
    "gray0D1012" to Tone("#FF0D1012", "@android:color/system_neutral1_1000"),
    "gray14181C" to Tone("#FF14181C", "@android:color/system_neutral1_900"),
    "gray181C20" to Tone("#FF181C20", "@android:color/system_neutral1_900"), // colorBackground
    "windowBackground" to Tone("#FF181C20", "@android:color/system_neutral1_900"),
    "gray1C242C" to Tone("#FF1C242C", "@android:color/system_neutral2_900"),
    "gray202830" to Tone("#FF202830", "@android:color/system_neutral1_800"),
    "gray283038" to Tone("#FF283038", "@android:color/system_neutral1_800"),
    "gray223344" to Tone("#FF223344", "@android:color/system_neutral2_800"),
    "gray2C3440" to Tone("#FF2C3440", "@android:color/system_neutral2_800"),
    "gray303840" to Tone("#FF303840", "@android:color/system_neutral1_700"),
    "gray334455" to Tone("#FF334455", "@android:color/system_neutral2_700"),
    "gray445566" to Tone("#FF445566", "@android:color/system_neutral2_700"),
)

/**
 * Indirection colours the style edits point at, so the (unqualified) `styles.xml` always resolves
 * — `@android:color/system_*` would crash when inflated on Android 11 and below.
 */
private val CHROME = mapOf(
    "morphe_my_surface" to Tone("#FF181C20", "@android:color/system_neutral1_900"),
    "morphe_my_surface_elevated" to Tone("#FF202830", "@android:color/system_neutral1_800"),
    "morphe_my_divider" to Tone("#FF334455", "@android:color/system_neutral2_600"),
)

@Suppress("unused")
val materialYouThemePatch = resourcePatch(
    name = "Material You theme",
    description = "Repaints Letterboxd's dark chrome — window background, surfaces, cards, the top " +
        "bar, tab strip, bottom nav and sheets — from the device's Material You palette on " +
        "Android 12+ (no effect below). No accent or OLED options here; those live in the " +
        "\"Mod settings\" screen — but that screen's \"Pure black (OLED)\" and \"Match bottom nav\" " +
        "switches turn themselves off while this patch is applied, since it already repaints those " +
        "surfaces on its own. No effect on Jetpack Compose screens.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // res/values/colors.xml — safe fallbacks the style edits can always resolve.
        document("res/values/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/colors.xml has no root element")
            CHROME.forEach { (name, tone) -> upsertColor(document, resources, name, tone.fallback) }
        }

        // res/values-v31/colors.xml — Android 12+ dynamic palette.
        document("res/values-v31/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values-v31/colors.xml has no root element")
            CHROME.forEach { (name, tone) -> upsertColor(document, resources, name, tone.dynamic) }
            PALETTE.forEach { (name, tone) -> upsertColor(document, resources, name, tone.dynamic) }
        }

        // res/values/styles.xml — flatten the chrome onto the indirection colours.
        document("res/values/styles.xml").use { document ->
            setStyleItem(document, "Widget.Letterboxd.AppBarLayout", "android:background", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.AppBarLayout", "liftOnScrollColor", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.TabLayout", "android:background", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.BottomNavigationView", "android:background", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.BottomSheet.Modal", "backgroundTint", "@color/morphe_my_surface_elevated")
            setStyleItem(document, "Widget.Letterboxd.Divider", "dividerColor", "@color/morphe_my_divider")
        }
    }
}

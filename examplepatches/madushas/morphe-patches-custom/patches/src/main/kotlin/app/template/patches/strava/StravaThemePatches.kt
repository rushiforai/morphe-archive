package app.template.patches.strava

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY
import org.w3c.dom.Element

/**
 * AMOLED true-black dark theme.
 *
 * Strava dark mode uses warm dark-gray surfaces (#141413 base, #21211f raised,
 * #43423f pressed/high) defined once per name in res/values-night/colors.xml.
 * This patch maps the three surface families onto an OLED-friendly ladder:
 *
 *   #141413 (base surface)  -> #000000  (pure black)
 *   #21211f (raised)        -> #0D0D0B  (near-black)
 *   #43423f (pressed/high)  -> #1C1C1A  (dark gray)
 *
 * Non-surface colors (text, accents, borders) keep their baked values, and the
 * day table is untouched, so light mode is unaffected.
 */
@Suppress("unused")
val stravaAmoledThemePatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Makes Strava dark mode true-black for OLED screens: the dark " +
        "surface colors (#141413 / #21211f / #43423f) are remapped to a black " +
        "ladder. Light mode is untouched.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    execute {
        val amoledMap = mapOf(
            "#ff141413" to "#ff000000",
            "#ff21211f" to "#ff0d0d0b",
            "#ff43423f" to "#ff1c1c1a",
            "#FF141413" to "#FF000000",
            "#FF21211F" to "#FF0D0D0B",
            "#FF43423F" to "#FF1C1C1A",
        )

        var swapped = 0
        val night = document("res/values-night/colors.xml")
        night.use { doc ->
            val colors = doc.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val el = colors.item(i) as? Element ?: continue
                val value = el.textContent.trim()
                amoledMap[value]?.let { replacement ->
                    el.textContent = replacement
                    swapped++
                }
            }
        }
        if (swapped == 0) {
            throw PatchException("AMOLED: no dark surface colors matched — layout changed, re-audit values-night/colors.xml")
        }
        println("AMOLED theme: remapped $swapped dark surface colors")
    }
}

/**
 * Custom app branding (opt-in).
 *
 * Rewrites the launcher label (the `app_name` string) when the
 * `stravaAppName` option is set. The resource entry already exists, so no
 * ARSC table surgery is needed. Off by default: an empty option changes
 * nothing.
 */
@Suppress("unused")
val stravaBrandingPatch = resourcePatch(
    name = "Custom app name",
    description = "Renames the launcher label (Settings > Apps, home screen) to " +
        "the value of the stravaAppName option. Leave the option empty to keep " +
        "the original name.",
    default = false,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    val appName by stringOption(
        key = "stravaAppName",
        title = "Custom launcher name",
        description = "The app name shown in the launcher and app drawer. Empty = keep \"Strava\".",
        default = "",
    )

    execute {
        val chosen = appName?.trim().orEmpty()
        if (chosen.isEmpty()) {
            println("Branding: stravaAppName empty — keeping the original label")
            return@execute
        }
        var renamed = false
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val el = strings.item(i) as? Element ?: continue
                if (el.getAttribute("name") == "app_name") {
                    el.textContent = chosen
                    renamed = true
                    break
                }
            }
        }
        if (!renamed) {
            throw PatchException("Branding: app_name string not found — re-audit res/values/strings.xml")
        }
        println("Branding: app_name -> \"$chosen\"")
    }
}

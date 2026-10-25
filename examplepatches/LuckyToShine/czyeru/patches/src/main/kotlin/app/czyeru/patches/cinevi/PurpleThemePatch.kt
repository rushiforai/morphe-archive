package app.czyeru.patches.cinevi

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.czyeru.patches.shared.Constants.COMPATIBILITY_CINEVI
import org.w3c.dom.Element
import java.util.logging.Logger

/**
 * Recolors Cinevi's accent from its stock orange/green to a purple gradient, matching the
 * mockup. Phase 1 of the home redesign: this changes the *color language* only (selected tabs,
 * buttons, highlights, progress). The layout itself (hero carousel, card shapes, rails) is drawn
 * by `com.mgs.carparking.ui.homecontent.*` adapters against compiled layouts and is out of reach
 * of a resource patch.
 *
 * The app's accent surfaces come from, in order of how often they are seen on the home screen:
 *  - `color/text_theme` = #F76432, the orange brand color used for selected tabs/buttons/text,
 *  - `color/green` = #008000, which `colorAccent` points at (SeekBar, checkboxes, progress tint),
 *  - a few gradient drawables that bake the accent in as `startColor`/`endColor`
 *    (e.g. the lime-green progress gradient #8FC31F → #73A210).
 *
 * Scrims (#00000000 → #66000000), the blue→pink and cream gradients, and every non-accent color
 * are left untouched: only the accent family is retargeted, so nothing unrelated shifts hue.
 */
@Suppress("unused")
val purpleThemePatch = resourcePatch(
    name = "Purple theme",
    description = "Recolors the app's accent (selected tabs, buttons, highlights, progress) from " +
        "the stock orange to a purple gradient. Does not change the layout of any screen.",
    default = false
) {
    compatibleWith(COMPATIBILITY_CINEVI)

    val startColor by stringOption(
        key = "startColor",
        default = "#6600FF",
        values = mapOf(
            "Electric purple" to "#6600FF",
            "Violet" to "#7A3BFF",
            "Indigo" to "#4F2BFF",
        ),
        title = "Accent color (gradient start)",
        description = "The bright end of the accent gradient, as #RRGGBB. Also used wherever the " +
            "accent has to be a single flat color.",
        required = true,
        validator = { it != null && HEX.matches(it) },
    )

    val endColor by stringOption(
        key = "endColor",
        default = "#3A0099",
        values = mapOf(
            "Deep purple" to "#3A0099",
            "Near-black purple" to "#20004D",
            "Royal" to "#2E0066",
        ),
        title = "Accent color (gradient end)",
        description = "The darker end of the accent gradient, as #RRGGBB.",
        required = true,
        validator = { it != null && HEX.matches(it) },
    )

    execute {
        val logger = Logger.getLogger("PurpleTheme")
        val start = (startColor ?: "#6600FF").uppercase()
        val end = (endColor ?: "#3A0099").uppercase()

        var recoloredNames = 0
        var recoloredGradients = 0

        // 1. Flat accent colors. Everything that references @color/text_theme or @color/green picks
        //    these up automatically, so this one edit covers most of the home screen.
        for (path in COLOR_FILES) {
            if (!get(path, false).exists()) continue
            document(path).use { document ->
                val colors = document.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val node = colors.item(i) as? Element ?: continue
                    val name = node.getAttribute("name")
                    val value = node.textContent?.trim().orEmpty()
                    val isAccent = name in ACCENT_NAMES || rrggbb(value) in ACCENT_HEX
                    if (isAccent) {
                        node.textContent = withAlphaOf(value, start)
                        recoloredNames++
                    }
                }
            }
        }

        // 2. Gradient drawables whose both ends are the accent (by hex or by @color reference).
        //    Only those become the purple gradient; scrims and unrelated gradients are skipped.
        val resDir = get("res", false)
        if (resDir.exists() && resDir.isDirectory) {
            val drawableDirs = resDir.listFiles { dir ->
                dir.isDirectory && (dir.name.startsWith("drawable") || dir.name.startsWith("color"))
            }.orEmpty()

            for (dir in drawableDirs) {
                val xmlFiles = dir.listFiles { f -> f.isFile && f.extension == "xml" }.orEmpty()
                for (xmlFile in xmlFiles) {
                    val relative = "res/${dir.name}/${xmlFile.name}"
                    document(relative).use { document ->
                        val gradients = document.getElementsByTagName("gradient")
                        for (i in 0 until gradients.length) {
                            val gradient = gradients.item(i) as? Element ?: continue
                            val s = gradient.getAttribute("android:startColor")
                            val e = gradient.getAttribute("android:endColor")
                            if (!isAccentEndpoint(s) || !isAccentEndpoint(e)) continue

                            gradient.setAttribute("android:startColor", withAlphaOf(s, start))
                            gradient.setAttribute("android:endColor", withAlphaOf(e, end))
                            if (gradient.hasAttribute("android:centerColor")) {
                                val c = gradient.getAttribute("android:centerColor")
                                gradient.setAttribute("android:centerColor", withAlphaOf(c, start))
                            }
                            recoloredGradients++
                        }
                    }
                }
            }
        }

        if (recoloredNames == 0) {
            throw PatchException(
                "No accent colors were found to recolor. The app's resources changed; the patch is out of date."
            )
        }
        logger.info("Purple theme: recolored $recoloredNames accent colors and $recoloredGradients gradients.")
    }
}

private val HEX = Regex("#[0-9A-Fa-f]{6}")

/** The `colors.xml` variants the app ships (default plus night). */
private val COLOR_FILES = listOf(
    "res/values/colors.xml",
    "res/values-night/colors.xml",
    "res/values-night-v8/colors.xml",
)

/** Accent colors matched by resource name (reliable across value changes). */
private val ACCENT_NAMES = setOf("text_theme", "green")

/** Accent colors matched by value (RRGGBB, lowercase): orange brand, colorAccent green, lime progress. */
private val ACCENT_HEX = setOf("f76432", "008000", "8fc31f", "73a210")

/** `@color` references that resolve to the accent. */
private val ACCENT_REFS = setOf("@color/text_theme", "@color/green")

/** The last six hex digits (RRGGBB) of an `#AARRGGBB`/`#RRGGBB` string, lowercase, or "" if not a hex color. */
private fun rrggbb(color: String): String {
    val digits = color.trim().removePrefix("#")
    return when (digits.length) {
        6 -> digits.lowercase()
        8 -> digits.substring(2).lowercase()
        else -> ""
    }
}

private fun isAccentEndpoint(value: String): Boolean =
    value in ACCENT_REFS || rrggbb(value) in ACCENT_HEX

/** [replacement] (#RRGGBB) carrying the alpha channel of [original] when it had one; opaque otherwise. */
private fun withAlphaOf(original: String, replacement: String): String {
    val o = original.trim().removePrefix("#")
    val rgb = replacement.removePrefix("#")
    val alpha = if (o.length == 8) o.substring(0, 2) else "FF"
    return "#$alpha$rgb".uppercase()
}

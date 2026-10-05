package app.template.patches.letterboxd

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.letterboxd.theme.MIDNIGHT_SURFACES
import app.template.patches.letterboxd.theme.PURPLE_SURFACES
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Build-time surface theme. Writes the chosen palette straight into
 * `res/values/colors.xml` and (when present) `res/values-night/colors.xml` inside the APK,
 * so it works on every Android version — including pre-12 where the runtime
 * `ResourcesLoader` overlay the "Appearance" patch uses doesn't exist.
 *
 * The trade-off: the choice is fixed at patch time. Changing theme later means
 * re-patching. The in-app "Appearance" theme picker greys itself out when this
 * patch is applied, and vice versa — the two would fight over the same resources.
 */
@Suppress("unused")
val buildTimeThemePatch = resourcePatch(
    name = "Theme (baked in)",
    description = "Bakes a dark surface theme directly into the APK at patch time. Works on " +
        "every Android version, including below 12 where the runtime \"Appearance\" theme " +
        "picker can't run. Changing theme later requires re-patching.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    val theme by stringOption(
        key = "theme",
        default = "stock",
        values = mapOf(
            "Stock (Letterboxd's own colours)" to "stock",
            "Pure Black (OLED)" to "oled",
            "Purple" to "purple",
            "Midnight Blue" to "midnight",
        ),
        title = "Theme",
        description = "Which surface theme to bake into the APK.",
    )

    execute {
        val mode = theme ?: "stock"
        if (mode == "stock") return@execute // leave colours alone

        val palette: Map<String, String> = when (mode) {
            "oled" -> OLED_BAKED
            "purple" -> PURPLE_SURFACES
            "midnight" -> MIDNIGHT_SURFACES
            else -> return@execute
        }

        // Not every Letterboxd version ships both `values/colors.xml` and `values-night/colors.xml`
        // — `values-night` in particular is missing on several releases. And on some versions
        // neither exists in the patcher's virtual FS until later stages, so we probe for each
        // path individually and skip the ones that aren't there. The patcher's `document(path)`
        // call throws on a missing file, so the existence check must run first.
        //
        // The marker resource `morphe_baked_theme` — which tells the runtime Mod settings screen
        // that a baked theme is active — is written into whichever colors.xml we find first.
        var markerWritten = false

        for (path in listOf("res/values/colors.xml", "res/values-night/colors.xml")) {
            val exists = try {
                get(path).isFile
            } catch (t: Throwable) {
                false
            }
            if (!exists) continue

            document(path).use { document ->
                val resources = document.documentElement
                    ?: throw PatchException("$path has no root element")

                palette.forEach { (name, hex) ->
                    writeColorIfPresent(document, resources, name, hex)
                }

                if (!markerWritten && !hasColor(document, "morphe_baked_theme")) {
                    resources.appendChild(
                        document.createElement("color").apply {
                            setAttribute("name", "morphe_baked_theme")
                            textContent = "#FF000000"
                        }
                    )
                }
                markerWritten = true
            }
        }
    }
}

/**
 * Writes [hex] to the existing `<color name="...">` entry named [name]. Does nothing if the
 * resource is not present in the given file — Letterboxd's resource set varies between versions,
 * so a strict "must exist" check would break on some APKs. Missing entries are simply ignored;
 * the palette is best-effort by design.
 */
private fun writeColorIfPresent(
    document: Document,
    resources: Element,
    name: String,
    hex: String,
) {
    val nodes = document.getElementsByTagName("color")
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as Element
        if (el.getAttribute("name") == name) {
            el.textContent = hex
        }
    }
}

/** True if a `<color name="[name]">` already exists in [document]. */
private fun hasColor(document: Document, name: String): Boolean {
    val nodes = document.getElementsByTagName("color")
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as Element
        if (el.getAttribute("name") == name) return true
    }
    return false
}

/**
 * The OLED palette used by the build-time patch. Mirrors `OLED_SURFACES` in ModThemePatch.kt,
 * which is private to that file, so it's duplicated here intentionally — one file owns each
 * patch, and neither should reach into the other's private state.
 */
private val OLED_BAKED = mapOf(
    "gray0D1012" to "#FF000000",
    "gray14181C" to "#FF000000",
    "gray181C20" to "#FF000000",
    "windowBackground" to "#FF000000",
    "gray1C242C" to "#FF121212",
    "gray202830" to "#FF121212",
    "gray283038" to "#FF121212",
    "gray223344" to "#FF1C1C1C",
    "gray2C3440" to "#FF1C1C1C",
    "gray303840" to "#FF1C1C1C",
    "gray334455" to "#FF2E2E2E",
    "gray445566" to "#FF2E2E2E",
    "colorPrimaryDark" to "#FF4A4A4A",
)

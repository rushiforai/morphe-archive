package app.zdrgon.patches.strava.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.zdrgon.patches.strava.shared.Constants.COMPATIBILITY_STRAVA
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

// Strava's brand orange. In 486.9 resources the design token
// color/core_o3 and the brand/accent colors derived from it use the
// literal value #FFFC5200 (plus alpha variants such as #66FC5200).
private val brandOrangeRegex = Regex("""#([0-9a-fA-F]{2})?[Ff][Cc]5200""")

/**
 * Replaces Strava's brand orange accent color with a chosen color,
 * everywhere the literal appears in resources:
 *
 * - every `<color>` element in every values file of every values-*
 *   configuration directory (default, night, v31, ...). This matters
 *   because accent tokens are chained and partly literal: the bottom
 *   navigation tint, for example, comes from color/fill_accent, whose
 *   night value is the literal #FFFC5200 rather than a reference, and
 *   color/global_brand chains to color/core_o3 by day but is the same
 *   literal at night. Rewriting only the default colors.xml leaves
 *   dark mode orange.
 * - every attribute value in res/color* state lists (for example
 *   bottom_nav_color_statelist).
 * - fill/stroke color attributes in res/drawable* XML (vector icons
 *   whose paths carry the brand literal directly).
 *
 * Screens whose colors are hardcoded in code keep the original orange.
 */
@Suppress("unused")
val customThemePatch = resourcePatch(
    name = "Custom theme colors",
    description = "Replaces Strava's brand orange (#FC5200) accent color in the app's native " +
        "screens with a color of your choice.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    val accentColorOption = stringOption(
        key = "accentColor",
        default = "#FC5200",
        values = mapOf(
            "Strava orange" to "#FC5200",
            "Sunset orange" to "#FF6B00",
            "Blue" to "#0066FF",
            "Violet" to "#7C4DFF",
            "Teal" to "#00BFA5",
            "Green" to "#00C853",
            "Pink" to "#FF4081",
            "Red" to "#E53935",
            "Slate" to "#546E7A",
        ),
        title = "Accent color",
        description = "The accent color that replaces Strava orange.",
        required = true,
    )

    execute {
        val accent = accentColorOption.value!!.trim().removePrefix("#")
        if (!accent.matches(Regex("[0-9a-fA-F]{6}"))) {
            throw PatchException(
                "Accent color must be a 6-digit hex value, got: ${accentColorOption.value}",
            )
        }
        val rgb = accent.uppercase()

        fun replaceLiteral(value: String): String? {
            val match = brandOrangeRegex.matchEntire(value.trim()) ?: return null
            val alpha = match.groupValues[1].ifEmpty { "FF" }.uppercase()
            return "#$alpha$rgb"
        }

        // Replaces the brand literal in <color> element text and in any
        // attribute value of the document. Returns true if it changed.
        fun replaceInDocument(document: Document): Boolean {
            var changed = false

            val colors = document.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val element = colors.item(i) as Element
                replaceLiteral(element.textContent)?.let { replacement ->
                    element.textContent = replacement
                    changed = true
                }
            }

            val all = document.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val attributes = (all.item(i) as Element).attributes
                for (j in 0 until attributes.length) {
                    val attribute = attributes.item(j) as Attr
                    replaceLiteral(attribute.value)?.let { replacement ->
                        attribute.value = replacement
                        changed = true
                    }
                }
            }
            return changed
        }

        val resDir = this["res"]
        val resChildren = resDir.listFiles()
            ?: throw PatchException("Decoded resource directory not found")

        for (dir in resChildren) {
            if (!dir.isDirectory) continue
            val isValues = dir.name.startsWith("values")
            val isColorList = dir.name == "color" || dir.name.startsWith("color-")
            val isDrawable = dir.name == "drawable" || dir.name.startsWith("drawable-")
            if (!isValues && !isColorList && !isDrawable) continue

            val xmlFiles = dir.listFiles { file -> file.isFile && file.name.endsWith(".xml") }
                ?: continue
            for (file in xmlFiles) {
                val path = "res/${dir.name}/${file.name}"
                try {
                    document(path).use { document -> replaceInDocument(document) }
                } catch (e: Exception) {
                    // A malformed or non-XML file must not fail the whole
                    // theme pass; it simply keeps its original colors.
                }
            }
        }
    }
}

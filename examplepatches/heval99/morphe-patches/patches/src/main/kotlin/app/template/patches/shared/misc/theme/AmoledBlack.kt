package app.template.patches.shared.misc.theme

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** `#ff151e22` and `#151e22` are the same color; the decoder writes the short form for an opaque one. */
internal fun String.opaqueColor(): String =
    lowercase().let { if (it.length == 9 && it.startsWith("#ff")) "#" + it.substring(3) else it }

/** One dark theme color: its value in the stock app and the AMOLED value. */
internal data class AmoledColor(val stock: String, val amoled: String)

/**
 * "AMOLED black": an opt-in resource patch that rewrites a handful of dark theme `<color>` values in
 * [colorsPath] (a decoded values file of the app, for example `res/values/colors.xml` or
 * `res/values-night/colors.xml`). Every color is checked against its stock value first and every
 * listed color must exist, so a palette rework fails the patch instead of recoloring something else.
 * It is a build-time change (colors are resources), not a Patch settings switch.
 */
internal fun amoledBlackResourcePatch(
    compatibility: Compatibility,
    colorsPath: String,
    colors: Map<String, AmoledColor>,
    named: Boolean = true,
) = resourcePatch(
    name = if (named) "AMOLED black" else null,
    description = "Makes the dark theme pure black on OLED screens.",
    default = false,
) {
    compatibleWith(compatibility)

    execute {
        decode(colorsPath)
        val remaining = colors.keys.toMutableSet()
        document(colorsPath).use { doc ->
            val nodes = doc.getElementsByTagName("color")
            for (index in 0 until nodes.length) {
                val node = nodes.item(index) as? Element ?: continue
                val name = node.getAttribute("name")
                val color = colors[name] ?: continue
                val value = node.textContent?.trim()
                if (value == null || value.opaqueColor() != color.stock.opaqueColor()) {
                    throw PatchException("$colorsPath: $name is $value, expected ${color.stock}")
                }
                node.textContent = color.amoled.opaqueColor()
                remaining -= name
            }
        }
        if (remaining.isNotEmpty()) throw PatchException("$colorsPath: missing colors $remaining")
    }
}

/** One theme attribute: the color it references in the stock app and the AMOLED color it gets. */
internal data class AmoledAttribute(val stockRef: String, val amoled: String)

/**
 * The resource half of a runtime "AMOLED black" for an app whose dark theme is a style of theme
 * attributes (FotMob). It changes nothing that exists: it checks that every attribute of [styleName]
 * in [nightStylesPath] still references its stock color (a theme rework fails the patch) and adds a
 * new style [overlayName] to [baseStylesPath] holding the AMOLED value of each attribute. The
 * extension applies that overlay to the theme of each screen while the Patch settings switch is on
 * and the screen is in dark mode, so the switch can turn AMOLED off again without patching.
 *
 * Each AMOLED value is added as a `<color name="heval_amoled_<rrggbb>">` resource in [colorsPath] and
 * the overlay items reference it, exactly like the stock items reference `@color/...`. A raw color
 * value in a style item has no resource id, and apps that resolve an attribute with
 * `TypedArray.getResourceId` + `getColorStateList` (FotMob's league table row) then throw: issue #146.
 */
internal fun amoledOverlayResourcePatch(
    compatibility: Compatibility,
    nightStylesPath: String,
    baseStylesPath: String,
    styleName: String,
    overlayName: String,
    attributes: Map<String, AmoledAttribute>,
    colorsPath: String = "res/values/colors.xml",
) = resourcePatch(
    description = "Adds an AMOLED black theme overlay to the dark theme.",
) {
    compatibleWith(compatibility)

    execute {
        decode(nightStylesPath, baseStylesPath, colorsPath)
        val remaining = attributes.keys.toMutableSet()
        document(nightStylesPath).use { doc ->
            val styles = doc.getElementsByTagName("style")
            val style = (0 until styles.length).map { styles.item(it) as Element }.singleOrNull { it.getAttribute("name") == styleName }
                ?: throw PatchException("$nightStylesPath: style $styleName not found exactly once")
            val items = style.getElementsByTagName("item")
            for (index in 0 until items.length) {
                val item = items.item(index) as? Element ?: continue
                val name = item.getAttribute("name")
                val attribute = attributes[name] ?: continue
                val value = item.textContent?.trim()
                if (value != attribute.stockRef) {
                    throw PatchException("$nightStylesPath: $styleName $name is $value, expected ${attribute.stockRef}")
                }
                remaining -= name
            }
        }
        if (remaining.isNotEmpty()) throw PatchException("$nightStylesPath: $styleName is missing items $remaining")

        // One color resource per distinct AMOLED value, e.g. heval_amoled_0a0a0a = #0a0a0a.
        val colorNames = attributes.values.map { it.amoled.opaqueColor() }.distinct().associateWith { value ->
            if (!Regex("#[0-9a-f]{6}").matches(value)) throw PatchException("AMOLED value $value is not an opaque #rrggbb color")
            "heval_amoled_${value.substring(1)}"
        }
        document(colorsPath).use { doc ->
            val resources = doc.documentElement ?: throw PatchException("$colorsPath has no root element")
            val existing = doc.getElementsByTagName("color").let { nodes ->
                (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
            }
            colorNames.forEach { (value, colorName) ->
                val present = existing[colorName]
                when {
                    present == null -> resources.appendChild(doc.createElement("color").apply {
                        setAttribute("name", colorName)
                        textContent = value
                    })
                    present.textContent.trim().opaqueColor() != value ->
                        throw PatchException("$colorsPath: $colorName exists with ${present.textContent.trim()}, expected $value")
                }
            }
        }

        document(baseStylesPath).use { doc ->
            val resources = doc.documentElement ?: throw PatchException("$baseStylesPath has no root element")
            val existing = doc.getElementsByTagName("style")
            if ((0 until existing.length).any { (existing.item(it) as Element).getAttribute("name") == overlayName }) return@use
            val overlay = doc.createElement("style").apply { setAttribute("name", overlayName) }
            attributes.forEach { (name, attribute) ->
                overlay.appendChild(doc.createElement("item").apply {
                    setAttribute("name", name)
                    textContent = "@color/" + colorNames.getValue(attribute.amoled.opaqueColor())
                })
            }
            resources.appendChild(overlay)
        }
    }
}

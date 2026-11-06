package app.onlynazril.patches.tiktok.amoled

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.onlynazril.patches.shared.Constants
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.Locale

/**
 * The brightest channel a colour may have and still be turned black.
 *
 * 0x60 catches the dark navy canvas (0x161823), the surface grays (0x1b1b1b through 0x333333),
 * the borders (0x3a3a3a) and the light-gray controls (0x545454), so the result is the same black
 * everywhere. Text and icons are normally brighter and stay as they are.
 */
private const val DARK_MAX = 0x60

private val HEX = Regex("#([0-9a-fA-F]{8}|[0-9a-fA-F]{6})")

/**
 * Turns every dark colour in the APK's resources black, keeping the alpha.
 *
 * This is the total variant: it does not keep a surface tier or border tier, so cards, sheets,
 * buttons and dividers all end up on the same black. Text and icons above [DARK_MAX] are the only
 * things left to separate them. The patch is a build-time resource edit, not a runtime switch.
 */
@Suppress("unused")
val amoledPatch = resourcePatch(
    name = "AMOLED theme",
    description = "Total AMOLED: every colour whose brightest channel is 0x60 or lower becomes " +
        "black, alpha kept. Borders and controls lose their separation too; repatch to undo.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_TIKTOK)
    dependsOn(amoledCodePatch)

    execute {
        var changed = 0
        decode("res/values*/colors.xml", "res/values*/styles.xml").forEach { path ->
            document(path).use { document ->
                changed += replaceDarkColors(document)
            }
        }

        // Shape and selector fills: message fields, popovers, sticker and emoji panels. Only the
        // fill elements are touched, so a stroke keeps its border colour.
        decode("res/drawable*/*.xml", "res/color*/*.xml").forEach { path ->
            document(path).use { document ->
                changed += replaceFillColors(document)
            }
        }
        if (changed == 0) {
            throw PatchException("AMOLED: no dark colour was found in the resource table.")
        }
    }
}

/**
 * Replaces colours only on the elements that paint a fill, never on a stroke.
 *
 * `shape`/`selector` files carry both: `solid`, `item` and `gradient` are fills, `stroke` is the
 * border. A gradient's `startColor`/`endColor`/`centerColor` are fills too. Vector `fillColor`
 * belongs to an icon, so those elements are not in the set.
 */
private fun replaceFillColors(document: Document): Int {
    var changes = 0
    val fillTags = setOf("solid", "item", "gradient")

    fun walk(node: Node) {
        if (node.nodeType == Node.ELEMENT_NODE) {
            val element = node as Element
            val tag = element.tagName.substringAfter(':').lowercase()
            if (tag in fillTags) {
                for (index in 0 until element.attributes.length) {
                    val attribute = element.attributes.item(index)
                    val name = attribute.nodeName.substringAfter(':').lowercase()
                    if (name != "color" && !name.endsWith("color")) continue
                    val replaced = replaceHex(attribute.nodeValue) ?: continue
                    attribute.nodeValue = replaced
                    changes++
                }
            }
        }

        var child = node.firstChild
        while (child != null) {
            walk(child)
            child = child.nextSibling
        }
    }

    walk(document)
    return changes
}

/** Replaces every matching colour in the document's attributes and text, and returns the count. */
private fun replaceDarkColors(document: Document): Int {
    var changes = 0

    fun walk(node: Node) {
        if (node.nodeType == Node.ELEMENT_NODE) {
            val element = node as Element
            for (index in 0 until element.attributes.length) {
                val attribute = element.attributes.item(index)
                val replaced = replaceHex(attribute.nodeValue) ?: continue
                attribute.nodeValue = replaced
                changes++
            }
        } else if (node.nodeType == Node.TEXT_NODE || node.nodeType == Node.CDATA_SECTION_NODE) {
            val replaced = replaceHex(node.nodeValue)
            if (replaced != null) {
                node.nodeValue = replaced
                changes++
            }
        }

        var child = node.firstChild
        while (child != null) {
            walk(child)
            child = child.nextSibling
        }
    }

    walk(document)
    return changes
}

private fun replaceHex(value: String?): String? {
    if (value == null) return null
    var changed = false
    val replaced = HEX.replace(value) { match ->
        val argb = parseColor(match.value)
        if (argb != null && isDark(argb)) {
            changed = true
            val alpha = argb and 0xFF000000L
            "#%08x".format(Locale.ROOT, alpha)
        } else {
            match.value
        }
    }
    return if (changed) replaced else null
}

private fun isDark(argb: Long): Boolean {
    val red = ((argb shr 16) and 0xFF).toInt()
    val green = ((argb shr 8) and 0xFF).toInt()
    val blue = (argb and 0xFF).toInt()
    return maxOf(red, green, blue) <= DARK_MAX
}

private fun parseColor(text: String): Long? {
    val hex = text.removePrefix("#")
    return when (hex.length) {
        6 -> 0xFF000000L or hex.toLong(16)
        8 -> hex.toLong(16)
        else -> null
    }
}

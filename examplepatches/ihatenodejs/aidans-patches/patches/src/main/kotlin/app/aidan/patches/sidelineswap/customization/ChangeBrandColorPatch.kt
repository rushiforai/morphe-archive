package app.aidan.patches.sidelineswap.customization

import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private val HEX_COLOR_REGEX = Regex("^#(?:[0-9a-fA-F]{3,4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

val changeBrandColorPatch = resourcePatch(
    name = "Change Brand Color",
    description = "Customizes the primary accent brand color across SidelineSwap buttons, navigation highlights, badges, and accents.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SIDELINESWAP)

    val primaryColor = stringOption(
        key = "primaryColor",
        default = "#1E88E5",
        title = "Primary Brand Color",
        description = "Hex color string (e.g. #1E88E5 for Material Blue, #9C27B0 for Purple, #FF5722 for Orange, #000000 for Monochrome)."
    )

    val primaryDarkColor = stringOption(
        key = "primaryDarkColor",
        default = "#1565C0",
        title = "Primary Dark Color",
        description = "Hex color string for status bars and dark accents (defaults to #1565C0)."
    )

    execute {
        val primary = primaryColor.value ?: "#1E88E5"
        val primaryDark = primaryDarkColor.value ?: "#1565C0"

        validateHexColor("primaryColor", primary)
        validateHexColor("primaryDarkColor", primaryDark)

        val colorFiles = listOf("res/values/colors.xml", "res/values-night/colors.xml")

        for (filePath in colorFiles) {
            runCatching {
                document(filePath).use { document ->
                    val colorNodes = document.getElementsByTagName("color")
                    for (i in 0 until colorNodes.length) {
                        val element = colorNodes.item(i) as? Element ?: continue
                        val name = element.getAttribute("name")
                        when (name) {
                            "colorPrimary",
                            "badge_color",
                            "green_badge",
                            "ic_launcher_background" -> {
                                element.textContent = primary
                            }
                            "colorPrimaryDark" -> {
                                element.textContent = primaryDark
                            }
                        }
                    }
                }
            }
        }
    }
}

/**
 * Validates that [value] is a valid hex color string format accepted by Android XML resources
 * (#RGB, #ARGB, #RRGGBB, or #AARRGGBB).
 *
 * @throws PatchException if the value is not a valid hex color.
 */
private fun validateHexColor(optionName: String, value: String) {
    if (!HEX_COLOR_REGEX.matches(value)) {
        throw PatchException("Invalid $optionName: '$value'. Expected a valid hex color (e.g. #RRGGBB, #AARRGGBB, #RGB, or #ARGB).")
    }
}

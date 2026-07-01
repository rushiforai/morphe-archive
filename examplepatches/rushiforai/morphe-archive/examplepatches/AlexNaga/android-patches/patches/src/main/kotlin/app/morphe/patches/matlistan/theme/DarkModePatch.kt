package app.morphe.patches.matlistan.theme

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.childElementsSequence

@Suppress("unused")
val darkModePatch = resourcePatch(
    name = "Dark mode",
    description = "Applies a dark theme to all backgrounds, dialogs, and popups."
) {
    compatibleWith(Compatibility(
        name = "Matlistan",
        packageName = "se.matlistan.free",
        appIconColor = 0x00C29B,
        targets = listOf(AppTarget("3.10.0"))
    ))

    execute {
        val colorReplacements = mapOf(
            "background" to "#ff121212",
            "white" to "#ff121212",
            "semiwhite" to "#ff1e1e1e",
            "almostwhite" to "#ff1a1a1a",
            "no_recipe_background" to "#ff1a1a1a",
            "secondaryLightest" to "#ff1e1e2e",
            "cardview_light_background" to "#ff1e1e1e",
            "textColorPrimary" to "#ffe0e0e0",
            "textColorOnLightBackground" to "#ffe0e0e0",
            "darkGreyTextColor" to "#ffb0b0b0",
            "greyTextColor" to "#ff9e9e9e",
            "divider" to "#ff2a2a2a",
            "card_list_divider" to "#ff2a2a2a",
            "browser_actions_bg_grey" to "#ff1e1e1e",
            "browser_actions_text_color" to "#ffe0e0e0",
            "retailer_comparison_track" to "#ff2a2a2a",
        )

        document("res/values/colors.xml").use { document ->
            val resourcesNode = document.getElementsByTagName("resources").item(0)
            resourcesNode.childElementsSequence().forEach { node ->
                colorReplacements[node.getAttribute("name")]?.let { newColor ->
                    node.textContent = newColor
                }
            }
        }

        // Switch theme parents to dark variants
        document("res/values/styles.xml").use { document ->
            val resourcesNode = document.getElementsByTagName("resources").item(0)
            resourcesNode.childElementsSequence().forEach { node ->
                if (node.nodeName != "style") return@forEach
                val parent = node.getAttribute("parent")
                val name = node.getAttribute("name")
                when {
                    name == "AppTheme" && "Light" in parent ->
                        node.setAttribute("parent", parent.replace(".Light", ""))
                    name == "AlertDialogTheme" && "Light" in parent ->
                        node.setAttribute("parent", parent.replace(".Light", ""))
                    name == "AppTheme.PopupOverlay" && "Light" in parent ->
                        node.setAttribute("parent", parent.replace("Light", "Dark"))
                    name == "BottomSheetDialog" && "Light" in parent ->
                        node.setAttribute("parent", parent.replace(".Light", ""))
                }
            }
        }
    }
}

package app.template.patches.whereismytrain

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.WHEREISMYTRAIN_COMPATIBILITY
import org.w3c.dom.Element

@Suppress("unused")
val amoledDarkPatch = resourcePatch(
    name = "Amoled Dark Theme",
    description = "Changes selected night theme colors to pure black.",
    default = true
) {
    compatibleWith(WHEREISMYTRAIN_COMPATIBILITY)

    execute {
        val colorNames = setOf(
            "base_background_gray",
            "md_theme_inverse_surface",
            "md_theme_primary",
            "md_theme_primary_container",
            "md_theme_background",
            "md_theme_surface",
            "md_theme_surface_dim"
        )
        val changedColors = mutableSetOf<String>()
        document("res/values-night/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val color = colors.item(i) as? Element ?: continue
                val name = color.getAttribute("name")
                if (name in colorNames) {
                    color.textContent = "#000000"
                    changedColors.add(name)
                }
            }
        }

        val missingColors = colorNames - changedColors
        if (missingColors.isNotEmpty()) {
            throw PatchException(
                "Could not find night color resource(s): ${missingColors.sorted().joinToString()}."
            )
        }
    }
}

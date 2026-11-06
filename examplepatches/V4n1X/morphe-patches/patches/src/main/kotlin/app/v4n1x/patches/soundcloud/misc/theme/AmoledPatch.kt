package app.v4n1x.patches.soundcloud.misc.theme

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.addInstructionsToEnd
import app.morphe.util.findElementByAttributeValue
import app.v4n1x.patches.soundcloud.shared.Constants
import org.w3c.dom.Element

private val bottomBarPatch = bytecodePatch {
    execute {
        BottomBarCtorFingerprint.method.addInstructionsToEnd("""
            sget p1, Landroid/graphics/Color;->BLACK:I
            invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V
        """.trimIndent())
    }
}

@Suppress("unused")
val amoledPatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Changes the default dark theme to use true blacks for AMOLED screens.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_SOUNDCLOUD)

    dependsOn(bottomBarPatch)

    execute {
        val trueBlack = "@color/blackOT"

        // Background surface colors
        document("res/values/colors.xml").use { document ->
            val blackColors = listOf(
                "dark_mode_surface",
                "design_dark_default_color_background",
                "design_dark_default_color_surface"
            )

            val colors = document.getElementsByTagName("color")
            blackColors.forEach {
                colors.findElementByAttributeValue("name", it)?.textContent = trueBlack
            }

            // Set base black and dark dialog colors to pure AMOLED black (#000000)
            listOf("black", "dialog_dark").forEach {
                colors.findElementByAttributeValue("name", it)?.textContent = "#000000"
            }
        }

        // The player also selects a separate drawable on dark surfaces.
        // Older releases may only include the default variant.
        listOf("bth_footer_shape", "bth_footer_shape_dark_surfaces").forEach { name ->
            val path = "res/drawable/$name.xml"
            if (name.endsWith("dark_surfaces") && !get(path).isFile) return@forEach

            document(path).use { document ->
                val shapes = document.getElementsByTagName("shape")
                for (index in 0 until shapes.length) {
                    val shape = shapes.item(index) as Element
                    val gradients = shape.getElementsByTagName("gradient")
                    while (gradients.length > 0) shape.removeChild(gradients.item(0))
                    val solid = shape.getElementsByTagName("solid").item(0) as? Element
                        ?: document.createElement("solid").also { shape.appendChild(it) }
                    solid.setAttribute("android:color", trueBlack)
                }
            }
        }
    }
}

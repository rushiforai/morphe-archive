package patches.soundcloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import org.w3c.dom.NodeList
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patches.shared.uniqueMatch

// Theme patches ported from V4n1X/morphe-patches (AMOLED derived from Hoo-dles/morphe-patches).

/** Inserts [smali] right before the method's final instruction (its return). */
private fun MutableMethod.addInstructionsToEnd(smali: String) =
    addInstructions(instructions.count() - 1, smali)

/** First element in the list whose [attribute] equals [value], or null. */
private fun NodeList.findElementByAttributeValue(attribute: String, value: String): Element? {
    for (index in 0 until length) {
        val element = item(index) as? Element ?: continue
        if (element.getAttribute(attribute) == value) return element
    }
    return null
}

private val amoledBottomBarPatch = bytecodePatch {
    dependsOn(originalInput)
    execute {
        Fingerprint(
            definingClass = "Lcom/soundcloud/android/ui/components/navigations/BottomTabBarRestyle;",
            name = "<init>",
            parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
        ).uniqueMatch().method.addInstructionsToEnd(
            """
                sget p1, Landroid/graphics/Color;->BLACK:I
                invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val amoledPatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Changes dark theme surfaces, the bottom navigation bar, and the mini-player footer to true black (#000000) for AMOLED screens while preserving SoundCloud orange accents.",
    default = true,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput, amoledBottomBarPatch)

    execute {
        val trueBlack = "@color/blackOT"

        // Background surface colors
        document("res/values/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")
            listOf(
                "dark_mode_surface",
                "design_dark_default_color_background",
                "design_dark_default_color_surface",
            ).forEach { colors.findElementByAttributeValue("name", it)?.textContent = trueBlack }

            // Base black and dark dialog colors to pure AMOLED black.
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

package app.danielthemaniel.patches.defit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val removeBannerAdPatch = resourcePatch(
    name = "Remove Bottom Banner Ad",
    description = "Removes DeFit's bottom banner-ad container from the main layout.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)

    execute {
        document("res/layout/activity_main.xml").use { document ->
            val nodes = document.getElementsByTagName("*")

            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as? Element ?: continue
                val id = element.getAttribute("android:id")

                if (id == "@+id/adBanner" || id == "@id/adBanner") {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_height", "0dp")
                    element.setAttribute("android:minHeight", "0dp")
                    element.setAttribute("android:padding", "0dp")
                    break
                }
            }
        }
    }
}

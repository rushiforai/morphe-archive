package app.morphe.patches.tvcolombia

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import org.w3c.dom.Element

private fun Element.android(name: String, value: String) {
    setAttribute("android:$name", value)
}

private fun Element.requireView(name: String): Element {
    val nodes = getElementsByTagName("*")
    val matches = (0 until nodes.length).map { nodes.item(it) as Element }.filter {
        it.getAttribute("android:id").endsWith("/$name")
    }
    return matches.singleOrNull() ?: throw PatchException("Expected one view with id $name")
}

@Suppress("unused")
val glassChannelGrid = patch(
    name = "Glass channel grid",
    description = "Gives channel cards one translucent surface, more legible labels, and a simpler loading indicator.",
) {
    category("Appearance")
    compatibleWith(tvColombia)

    execute {
        resourceFile("res/drawable/tvplay_glass_tile.xml", copy = false).writeText(
            """
            <shape xmlns:android="http://schemas.android.com/apk/res/android">
                <gradient android:angle="270" android:startColor="#382A4260" android:endColor="#24101C30"/>
                <corners android:radius="14dp"/>
                <stroke android:width="1dp" android:color="#38758FAF"/>
            </shape>
            """.trimIndent()
        )
        document("res/layout/t_menugrid.xml").use { xml ->
            val root = xml.documentElement
            val scroll = root.requireView("sv_menugrid")
            scroll.android("paddingStart", "12dp")
            scroll.android("paddingEnd", "12dp")
            scroll.android("paddingTop", "8dp")
            scroll.android("paddingBottom", "8dp")
            scroll.android("clipToPadding", "false")
            val grid = root.requireView("grid")
            grid.removeAttribute("android:layoutAnimation")
        }
        for (name in listOf("t_menugrid_row", "t_menugrid_row_v", "t_menugrid_row_formato2", "t_menugrid_row_formato3")) {
            document("res/layout/$name.xml").use { xml ->
                val root = xml.documentElement
                val container = if (root.getAttribute("android:id").endsWith("/ll_menugrid_row")) {
                    root
                } else {
                    root.setAttribute("card_view:cardBackgroundColor", "@android:color/transparent")
                    root.setAttribute("card_view:cardElevation", "0dp")
                    root.setAttribute("card_view:cardUseCompatPadding", "false")
                    root.requireView("ll_menugrid_row")
                }
                container.android("background", "@drawable/tvplay_glass_tile")
                container.android("padding", "6dp")
                container.android("minHeight", "48dp")
                val title = root.requireView("tv_menugrid")
                title.android("fontFamily", "sans-serif-medium")
                title.android("textSize", "14sp")
                title.android("maxLines", "2")
                title.android("ellipsize", "end")
                title.android("paddingStart", "6dp")
                title.android("paddingEnd", "6dp")
            }
        }
        document("res/layout/empezar.xml").use { xml ->
            val spinner = xml.documentElement.requireView("pb_splash")
            spinner.android("layout_width", "44dp")
            spinner.android("layout_height", "44dp")
            spinner.android("layout_margin", "16dp")
        }
    }
}

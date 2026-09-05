package app.template.patches.letterboxd

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Element

/**
 * Poster grids compute their column count in code from the screen width, with no
 * resource to override, so this patch does not change the number of columns. It
 * shrinks the spacing around each poster instead, which makes posters render
 * larger and closer together.
 */
private val SPACING = mapOf(
    "poster_grid_item_inset" to mapOf("cozy" to "4.0dp", "compact" to "2.0dp", "dense" to "1.0dp"),
    "grid_recycler_view_horizontal_margin" to mapOf("cozy" to "12.0dp", "compact" to "6.0dp", "dense" to "2.0dp"),
)

@Suppress("unused")
val denserPosterGridPatch = resourcePatch(
    name = "Denser poster grid",
    description = "Tightens the spacing around posters in grids so they render larger and closer " +
        "together. Does not change the number of columns.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    val density by stringOption(
        key = "density",
        default = "compact",
        values = mapOf(
            "Cozy (near default)" to "cozy",
            "Compact" to "compact",
            "Dense" to "dense",
        ),
        title = "Grid density",
        description = "How tightly posters are packed.",
    )

    execute {
        val mode = density ?: "compact"

        document("res/values/dimens.xml").use { document ->
            val dimens = document.getElementsByTagName("dimen")
            SPACING.forEach { (name, byMode) ->
                val value = byMode[mode] ?: byMode.getValue("compact")
                val element = (0 until dimens.length)
                    .map { dimens.item(it) as Element }
                    .firstOrNull { it.getAttribute("name") == name }
                    ?: throw PatchException("dimen $name not found in res/values/dimens.xml")
                element.textContent = value
            }
        }
    }
}

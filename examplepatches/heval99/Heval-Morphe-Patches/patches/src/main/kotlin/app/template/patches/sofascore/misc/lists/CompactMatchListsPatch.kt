package app.template.patches.sofascore.misc.lists

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import org.w3c.dom.Element

private const val ROW_LAYOUT = "res/layout/list_event_row.xml"

/** One dp attribute of the match row layout: [stock] is checked first, [compact] replaces it. */
private class RowSize(val owner: String?, val attribute: String, val stock: Float, val compact: Float)

/**
 * The only match row layout (list_event_row, inflated by the list adapter) with its sizes, as dp
 * literals. [owner] is the android:id of the element (null for the root layout). Every stock value is
 * checked before anything is edited, so a layout rework fails the patch loudly. Unlisted values keep
 * their stock size: the time column (time_lower margin 4dp, kept so the time and status stay apart),
 * the 72dp guideline and the 56dp-wide action area.
 */
private val ROW_SIZES = listOf(
    RowSize(null, "android:minHeight", 56f, 44f),
    RowSize(null, "android:paddingVertical", 4f, 2f),
    RowSize("first_team_name", "android:layout_marginTop", 6f, 3f),
    RowSize("second_team_name", "android:layout_marginTop", 4f, 2f),
    RowSize("second_team_name", "android:layout_marginBottom", 6f, 3f),
    RowSize("second_team_name", "app:layout_goneMarginBottom", 6f, 3f),
    RowSize("action_layout", "android:layout_height", 48f, 40f),
)

/** Values that must still be what the patch assumes but are not changed. */
private val ROW_CHECKS = listOf(
    RowSize("time_lower", "android:layout_marginTop", 4f, 4f),
    RowSize("vertical_guideline_start", "app:layout_constraintGuide_begin", 72f, 72f),
    RowSize("action_layout", "android:layout_width", 56f, 56f),
)

private fun dpValue(raw: String): Float? =
    Regex("(-?[0-9]+(?:\\.[0-9]+)?)dp").matchEntire(raw.trim())?.groupValues?.get(1)?.toFloat()

/** The decoder's own spelling of a dp literal, e.g. 44.0dp. */
private fun dpText(value: Float): String = "${value}dp"

private val compactMatchListsLayoutPatch = resourcePatch(
    description = "Tightens the spacing of the match rows.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        decode(ROW_LAYOUT)
        document(ROW_LAYOUT).use { doc ->
            val root = doc.documentElement ?: throw PatchException("$ROW_LAYOUT has no root element")
            val all = doc.getElementsByTagName("*")
            val elements = (0 until all.length).map { all.item(it) as Element }

            fun find(owner: String?): Element {
                if (owner == null) return root
                val matches = elements.filter { it.getAttribute("android:id").substringAfterLast('/') == owner }
                if (matches.size != 1) throw PatchException("$ROW_LAYOUT: expected one element with id $owner, found ${matches.size}")
                return matches.single()
            }

            fun check(size: RowSize) {
                val element = find(size.owner)
                val raw = element.getAttribute(size.attribute)
                val current = dpValue(raw)
                    ?: throw PatchException("$ROW_LAYOUT: ${size.owner ?: "root"} ${size.attribute} is \"$raw\", expected ${size.stock}dp")
                if (current != size.stock) {
                    throw PatchException("$ROW_LAYOUT: ${size.owner ?: "root"} ${size.attribute} is ${current}dp, expected ${size.stock}dp")
                }
            }

            // Validate every value before the first edit.
            (ROW_SIZES + ROW_CHECKS).forEach(::check)
            ROW_SIZES.forEach { size -> find(size.owner).setAttribute(size.attribute, dpText(size.compact)) }
        }
    }
}

internal val COMPACT_MATCH_LISTS = HevalFeature(
    id = "sofascore.compact_match_lists",
    name = "Compact match lists",
    description = "Set when the app was patched; patch again without Compact match lists to undo it.",
    category = SofascoreControlsCategory.DISPLAY,
    buildTimeOnly = true,
    icon = "list",
)

// The row sizes are fixed in the APK's layout, so the Patch settings screen can only show the change:
// a read-only row "Applied at patch time" (no switch), like AMOLED black. Opt-in.
@Suppress("unused")
val compactMatchListsPatch = sofascoreControls.featurePatch(
    COMPACT_MATCH_LISTS,
    name = "Compact match lists",
    description = "Makes the match rows in lists shorter so more fit on screen.",
    default = false,
    dependencies = setOf(compactMatchListsLayoutPatch),
) {
    // Nothing to edit in code: the resource step did the work; this registers the settings row.
}

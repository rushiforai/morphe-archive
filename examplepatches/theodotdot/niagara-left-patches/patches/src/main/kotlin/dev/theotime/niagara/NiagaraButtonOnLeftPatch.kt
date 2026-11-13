package dev.theotime.niagara

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.xml.ResourceXml
import app.morphe.patcher.xml.XmlElement

/**
 * The home screen layout that hosts both the round Niagara Button (`large_fab`) and its
 * extended pill (`large_fab_extended`).
 */
private const val HOME_LAYOUT = "res/layout/home_activity.xml"

/** The two views the button is drawn with, depending on the configured action. */
private val BUTTON_VIEW_IDS = listOf("large_fab", "large_fab_extended")

/**
 * In Niagara, both button views are anchored to `@id/guideline_end`, a vertical guideline that keeps
 * the alphabet wave column free on the right edge.
 *
 * Mirroring the anchor to the start edge and reserving the same column on the left moves the button
 * without touching any code: nothing in `HomeActivity` re-anchors these views at runtime.
 */
val niagaraButtonOnLeftPatch = patch(
    name = "Niagara Button on the left",
    description = "Anchors the Niagara Button to the left edge of the home screen instead of the right edge."
) {
    compatibleWith(Constants.NIAGARA)

    execute {
        resourceXml(HOME_LAYOUT).use { xml ->
            val buttons = buttonViews(xml)
            val reserve = leftReserve(xml, buttons)

            buttons.forEach { button ->
                // The right edge anchor is what places the button above the alphabet wave.
                button.removeAttribute("app:layout_constraintEnd_toEndOf")
                button.setAttribute("app:layout_constraintStart_toStartOf", "parent")
                // Keep the same distance from the left edge the guideline used on the right.
                if (reserve != null) button.setAttribute("android:layout_marginStart", reserve)
            }
        }
    }
}

/**
 * The distance the home screen keeps free for the alphabet wave, taken from the guideline the button
 * is anchored to, so that the reference is one the app declares itself.
 *
 * Naming the dimension instead fails on releases that do not declare that name: Niagara 1.16.28 has
 * no `@dimen/alphabet_wave_width`, and a reference to a missing name breaks when resources are
 * re-encoded, such as when another patch decodes every resource to text.
 */
private fun leftReserve(xml: ResourceXml, buttons: List<XmlElement>): String? =
    buttons
        .mapNotNull { it.attribute("app:layout_constraintEnd_toEndOf") }
        .filter { it.startsWith("@id/") }
        .distinct()
        .firstNotNullOfOrNull { xml.elementByAttributeOrNull("android:id", it) }
        ?.let { guideline ->
            listOf("app:layout_constraintGuide_end", "app:layout_constraintGuide_begin")
                .firstNotNullOfOrNull(guideline::attribute)
                ?: throw PatchException(
                    "$HOME_LAYOUT anchors the Niagara Button to a guideline that is not positioned at a " +
                        "fixed distance from the edge. This version of Niagara Launcher is not supported."
                )
        }

private fun buttonViews(xml: ResourceXml): List<XmlElement> =
    xml.elements()
        .filter { element ->
            val id = element.attribute("android:id") ?: return@filter false
            BUTTON_VIEW_IDS.any { id.endsWith("/$it") }
        }
        .toList()
        .also { buttons ->
            if (buttons.size != BUTTON_VIEW_IDS.size) {
                throw PatchException(
                    "$HOME_LAYOUT has ${buttons.size} of the ${BUTTON_VIEW_IDS.size} Niagara Button views " +
                        "(${BUTTON_VIEW_IDS.joinToString()}). This version of Niagara Launcher is not supported."
                )
            }
        }

package app.template.patches.flashscore.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import org.w3c.dom.Element

private const val SETTINGS_LAYOUT = "res/layout/activity_settings.xml"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val ROW_ID = "heval_controls_row"
private const val VERSION_ID = "versionLabel"

/**
 * Adds the "Patch settings" row to Flashscore's Settings layout. The screen is one ConstraintLayout
 * whose rows are chained with layout_constraintTop_toBottomOf; the row is an <include> of the stock
 * arrow_row layout (background, divider, title and arrow) inserted right before the version label,
 * and the version label is re-constrained below it. The id is added to the resource table
 * (`@+id/heval_controls_row`); [HevalControlsEntry] only fills in the text and the click.
 *
 * Doing this in the layout rather than at runtime avoids `ConstraintLayout.LayoutParams`, which R8
 * renames in this app (the class is not referenced from code, only from the layout XML).
 */
@Suppress("unused")
val flashscoreControlsRowPatch = resourcePatch(
    description = "Adds the Patch settings row to the Settings layout.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    // Runs after every patch's decode: an earlier edit is reset when a later resource patch
    // decodes the resource tree again.
    finalize {
        decode(SETTINGS_LAYOUT)
        document(SETTINGS_LAYOUT).use { doc ->
            val elements = doc.getElementsByTagName("*")
            val all = (0 until elements.length).mapNotNull { elements.item(it) as? Element }
            fun Element.idName(): String? {
                val value = getAttributeNS(ANDROID_NS, "id").ifEmpty { getAttribute("android:id") }
                return value.takeIf { it.isNotEmpty() }?.substringAfterLast('/')
            }
            val version = all.singleOrNull { it.idName() == VERSION_ID }
                ?: throw PatchException(
                    "$SETTINGS_LAYOUT: expected one $VERSION_ID row, ids: " +
                        all.mapNotNull { it.idName() }.distinct().joinToString(),
                )
            val parent = version.parentNode as? Element
                ?: throw PatchException("$SETTINGS_LAYOUT: $VERSION_ID has no parent element")

            // Where the version label is attached now; the new row takes that slot.
            val topAttribute = version.attributes.let { attributes ->
                (0 until attributes.length)
                    .map { attributes.item(it) }
                    .singleOrNull { it.localName == "layout_constraintTop_toBottomOf" }
                    ?: throw PatchException("$SETTINGS_LAYOUT: $VERSION_ID has no top constraint")
            }
            val above = topAttribute.nodeValue
            val namespace = topAttribute.namespaceURI

            val row = doc.createElement("include")
            row.setAttribute("layout", "@layout/arrow_row")
            row.setAttributeNS(ANDROID_NS, "android:id", "@+id/$ROW_ID")
            row.setAttributeNS(ANDROID_NS, "android:layout_width", "match_parent")
            row.setAttributeNS(ANDROID_NS, "android:layout_height", "wrap_content")
            row.setAttributeNS(namespace, "${topAttribute.prefix}:layout_constraintTop_toBottomOf", above)
            parent.insertBefore(row, version)

            version.setAttributeNS(namespace, "${topAttribute.prefix}:layout_constraintTop_toBottomOf", "@+id/$ROW_ID")
        }
    }
}


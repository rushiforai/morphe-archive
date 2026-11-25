package app.jofslash.patches.wikipedia.donations

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.elements
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

private const val MENU_LAYOUT = "res/layout/view_main_drawer.xml"
private const val DONATE_ROW_ID = "main_drawer_donate_container"

@Suppress("unused")
val hideDonateButtonsPatch = resourcePatch(
    name = "Hide Donate buttons",
    description = "Hides the Donate entry in the More menu. Off by default: it is only there for when " +
            "you want to donate, and Hide donation requests already stops the prompts.",
    default = false
) {
    category("Donations")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // The app never changes the row's visibility, it only sets a click listener on it.
        document(MENU_LAYOUT).use { document ->
            val row = document.elements("LinearLayout").firstOrNull {
                it.getAttribute("android:id").substringAfterLast('/') == DONATE_ROW_ID
            } ?: throw PatchException("Couldn't find $DONATE_ROW_ID in $MENU_LAYOUT")
            row.setAttribute("android:visibility", "gone")
        }
    }
}

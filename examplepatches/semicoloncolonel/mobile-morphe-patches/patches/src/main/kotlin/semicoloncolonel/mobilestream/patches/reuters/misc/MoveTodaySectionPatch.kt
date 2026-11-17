package semicoloncolonel.mobilestream.patches.reuters.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// Reuters 7.51.0. Today is not one of your sections: HomeScreenContent builds
// Home's pages as [{id: 'today', ...}].concat(editList) and the top tab bar as
// [{key: 'TodayMain', title: <Today>}].concat(editList.map(...)), so Today is
// always page 0, Home always opens on it, and Your sections cannot remove it.
// Both closures are changed the same way, so the pages and tab titles match:
//
//   last     Call2 r0, concat, r2, r0 (the Today array is "this") becomes
//            Call2 r0, concat, r0, r2, so the sections come first and Today
//            is appended.
//   removed  NewArray r2, 1 becomes NewArray r2, 0, and its PutOwnByIndex
//            becomes two LoadConstUndefined into r4, which holds undefined
//            already, so the Today array is empty.
//
// Home opens on page 0, which is now the first of your sections.

private const val VERSION = 96

private fun bytes(vararg values: Int) = values.map { it.toByte() }.toByteArray()

private val PAGES = listOf("homeTabs", "staticContent", "today", "name")
private val TAB_TITLES = listOf("homeTabs", "TodayMain")

@Suppress("unused")
val moveTodaySectionPatch = rawResourcePatch(
    name = "Move Today section",
    description = "Experimental. Moves Today off the first page of Home, so the app opens on the first section " +
        "in Your sections. Reorder your sections to choose where it opens.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    val position by stringOption(
        key = "todayPosition",
        default = "last",
        values = mapOf(
            "Last page" to "last",
            "Removed" to "removed",
        ),
        title = "Today position",
        description = "Where Today goes. Removed takes it out of Home until you patch the app again without " +
            "this option.",
        required = true,
    )

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        val (find, replace) = when (position) {
            "last" -> bytes(83, 0, 1, 2, 0, 92) to bytes(83, 0, 1, 0, 2, 92)
            "removed" -> bytes(7, 2, 1, 0, 68, 2, 1, 0) to bytes(7, 2, 0, 0, 118, 4, 118, 4)
            else -> throw PatchException("Unknown Today position: $position")
        }
        bundle.replaceInstructions("", PAGES, VERSION, find, replace)
        bundle.replaceInstructions("", TAB_TITLES, VERSION, find, replace)
        file.writeBytes(bundle.toByteArray())
    }
}

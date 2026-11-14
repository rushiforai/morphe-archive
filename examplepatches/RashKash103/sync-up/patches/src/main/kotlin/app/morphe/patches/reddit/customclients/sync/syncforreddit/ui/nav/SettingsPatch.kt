package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.nav

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.SYNC_ACTIONS
import org.w3c.dom.Element

private const val LIST =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncListPreference"

private const val CATEGORY_HEADER =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"

/** What the rows sit under. Their own, for the reason given where it is built. */
private const val CATEGORY_TITLE = "Navigation buttons"

/** Left as the app drew it, which is the default. Matches the extension. */
private const val SHOW = "-2"

/** Taken off the bar. Matches the extension. */
private const val HIDE = "-1"

/** What the added button holds when it holds nothing. Matches the extension. */
private const val NOTHING = "-1"

/**
 * One row per button, numbered as the bottom bar draws them so that the settings read like the
 * bar, with what each one started as in brackets.
 *
 * Each row chooses between leaving the button alone, taking it off, and giving it one of Sync's
 * own actions. Only the inbox row words its first choice differently, because the app still has
 * the last word there: it takes the inbox off the bottom bar while nobody is signed in, and
 * saying so is cheaper than leaving a reader to work out why choosing Show changed nothing. The
 * actions button used to need the same caveat and no longer does — the second row has taken over
 * Sync's own switch for it.
 */
private val ROWS = listOf(
    Triple("sync_up_nav_posts", "Button 1 (Posts)", "Show"),
    Triple("sync_up_nav_actions", "Button 2 (Actions)", "Show"),
    Triple("sync_up_nav_explore", "Button 3 (Explore)", "Show"),
    Triple("sync_up_nav_inbox", "Button 4 (Inbox)", "Show when signed in"),
)

/** Sync's own switch for the actions button, which the second row takes the place of. */
private const val ITS_OWN_ACTIONS = "navigation_bottom_actions"

/** Adds the rows to the Bottom navigation category Sync already has. */
internal val bottomNavigationItemsSettingsPatch = resourcePatch(
    description = "Adds a row for each bottom navigation item, and one for the added button, " +
            "to the Bottom navigation category.",
) {
    execute {
        // What each row chooses between. The numbers are Sync's own for its actions, and the two
        // negatives are ours; nothing but the extension reads them, so they only have to agree
        // with it.
        // Sync's own switch for the actions button, now that the second row decides it. Two
        // switches for one button is worse than either: the reader turns one over and the other
        // quietly disagrees.
        //
        // Hidden where it stands rather than taken out. Nothing in the app looks this row up by
        // name, so removing it would not have thrown — but a row that is still there is a row
        // that anything expecting it still finds, and taking rows out of a settings screen is
        // what brought the Backup screen down once already. The setting itself is untouched and
        // goes on being written and read; it is only the reader who no longer sees two ways to
        // say the same thing.
        document("res/xml/cat_experimental.xml").use { experimental ->
            val rows = experimental.getElementsByTagName("*")
            val its = (0 until rows.length)
                .map { rows.item(it) as Element }
                .firstOrNull { it.getAttribute("android:key") == ITS_OWN_ACTIONS }
                ?: throw PatchException("Sync no longer has its own switch for the actions button")
            its.setAttribute("app:isPreferenceVisible", "false")
        }

        val values = listOf(SHOW, HIDE) + SYNC_ACTIONS.map { it.first.toString() }

        document("res/values/arrays.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element

            fun array(name: String, items: List<String>) {
                val array = document.createElement("string-array")
                array.setAttribute("name", name)
                items.forEach {
                    val item = document.createElement("item")
                    item.appendChild(document.createTextNode(it))
                    array.appendChild(item)
                }
                resources.appendChild(array)
            }

            // A list of names per row, since the first of them is worded for the row, against
            // the one list of values they all share.
            ROWS.forEach { (key, _, show) ->
                array("${key}_entries", listOf(show, "Hide") + SYNC_ACTIONS.map { it.second })
            }
            array("sync_up_nav_values", values)
            array("sync_up_nav_extra_entries", listOf("None") + SYNC_ACTIONS.map { it.second })
            array(
                "sync_up_nav_extra_values",
                listOf(NOTHING) + SYNC_ACTIONS.map { it.first.toString() },
            )
        }

        document("res/xml/cat_general.xml").use { document ->
            // A category of our own, put straight after Sync's Bottom navigation one so that it
            // reads as a continuation of it.
            //
            // Not inside it, which is where these rows began: in tablet mode
            // PreferencesGeneralFragment hides the whole of that category — and the drawer one
            // beside it — in a single call, and rows of ours inside it went with it. Tablet mode
            // is exactly when they are wanted, since it is the rail that is drawn then and these
            // rows are what configure it. The rows stayed in the settings search, which reads the
            // file rather than the screen, so searching one and tapping it scrolled to where it
            // would have been and landed on the category below.
            //
            // Added rather than replacing or moving anything: Sync's Backup walks the settings it
            // knows and writes them out, so a row that is no longer where the app expects breaks
            // a screen that has nothing to do with this.
            val above = document.getElementsByTagName("PreferenceCategory").let { categories ->
                (0 until categories.length)
                    .map { categories.item(it) as Element }
                    .firstOrNull { it.getAttribute("android:key") == "bottom" }
            } ?: throw PatchException("No Bottom navigation category to put the rows after")

            val category = document.createElement("PreferenceCategory")
            document.createElement(CATEGORY_HEADER).let { header ->
                header.setAttribute("app:categoryTitle", CATEGORY_TITLE)
                category.appendChild(header)
            }
            above.parentNode.insertBefore(category, above.nextSibling)

            fun add(attributes: Map<String, String>) {
                val row = document.createElement(LIST)
                attributes.forEach { (name, value) -> row.setAttribute(name, value) }
                category.appendChild(row)
            }

            ROWS.forEach { (key, title, _) ->
                add(
                    mapOf(
                        "android:key" to key,
                        "android:title" to title,
                        "android:entries" to "@array/${key}_entries",
                        "android:entryValues" to "@array/sync_up_nav_values",
                        "android:defaultValue" to SHOW,
                        // Shows what is chosen without having to open it.
                        "android:summary" to "%s",
                    ),
                )
            }

            // Material takes five items on the bottom bar and seven on the rail, counting the
            // ones it is not drawing, and the bar already declares four — so there is room for
            // exactly one more and no setting worth offering for a second.
            add(
                mapOf(
                    "android:key" to "sync_up_nav_extra",
                    "android:title" to "Button 5 (Extra)",
                    "android:entries" to "@array/sync_up_nav_extra_entries",
                    "android:entryValues" to "@array/sync_up_nav_extra_values",
                    "android:defaultValue" to NOTHING,
                    "android:summary" to "%s",
                ),
            )
        }
    }
}

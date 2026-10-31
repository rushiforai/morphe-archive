package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.fab

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val CATEGORY_HEADER =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"

private const val CHECK_BOX =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncCheckBoxPreference"

private const val LIST =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncListPreference"

/** How many actions can stand beside the button. Matches the extension. */
private const val SLOTS = 3

/**
 * Where our actions begin in Sync's own setting for what its button is for. The three it
 * already meant keep the numbers they had, and ours follow straight on from them.
 *
 * <p>They have to follow straight on: Sync puts the chosen number into its own list of names to
 * work out what to show, so a number past the end of that list is not a value it does not know,
 * it is a crash.
 */
private const val OURS_START_AT = 3

/** What Sync's own button can be, which its setting has always chosen between. */
private val ITS_OWN = listOf("Submit", "Hide read", "More actions")

/**
 * The actions Sync will actually carry out, by the number it knows each one by.
 *
 * <p>Read from the jump table that answers what an action is called, not from the order the
 * names appear in the code, which is the reverse of it.
 *
 * <p>Two of the numbers are missing on purpose. What carries an action out is a run of
 * comparisons, and it compares against every number but 0 and 14 — Hide read, which the button
 * itself does, and Sort, which has a name and an icon and a place in Sync's own list but is
 * never dispatched and so does nothing at all.
 */
private val ACTIONS = listOf(
    1 to "Saved", 2 to "Profile", 3 to "Submit", 4 to "Change view", 5 to "Random",
    6 to "Random NSFW", 7 to "Dark mode", 8 to "Friends", 9 to "Settings", 10 to "Data saving",
    11 to "Filters", 12 to "Recents", 13 to "Toggle account", 15 to "Refresh", 16 to "About",
    17 to "Sync", 18 to "Search", 19 to "Watched", 20 to "Swipe mode", 21 to "Inbox",
    22 to "Explore", 23 to "Dark overlay", 24 to "Scroll to top",
)

/**
 * Adds the settings to the Floating Action Button category Sync already has, which is where the
 * button's own options are.
 */
internal val extraFabActionsSettingsPatch = resourcePatch(
    description = "Adds the extra floating button actions to the Floating Action Button category.",
) {
    execute {
        document("res/values/arrays.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element

            /** Replaces the items of an array Sync already has, keeping the array itself. */
            fun widen(name: String, items: List<String>) {
                val existing = (0 until resources.childNodes.length)
                    .map { resources.childNodes.item(it) }
                    .filterIsInstance<Element>()
                    .firstOrNull {
                        it.tagName == "string-array" && it.getAttribute("name") == name
                    }
                    ?: throw PatchException("Sync no longer has a $name to widen")

                while (existing.hasChildNodes()) {
                    existing.removeChild(existing.firstChild)
                }
                items.forEach {
                    val item = document.createElement("item")
                    item.appendChild(document.createTextNode(it))
                    existing.appendChild(item)
                }
            }

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

            // Beside the button, the number stored is the action's own, since nothing but
            // this reads it.
            array("sync_up_fab_entries", listOf("None") + ACTIONS.map { it.second })
            array("sync_up_fab_values", listOf("-1") + ACTIONS.map { it.first.toString() })

            // Sync's own lists for what its button is for, added to in place rather than
            // replaced. Sync looks the chosen number up in these by position, from code that
            // names them directly, so a list of our own beside them would not be the one read.
            widen("fab_labels", ITS_OWN + ACTIONS.map { it.second })
            // Read by position where Sync looks the chosen one up, so these have to run
            // straight through; what each position means is settled in the extension.
            widen(
                "fab_actions",
                (ITS_OWN.size + ACTIONS.size).let { total -> (0 until total).map { it.toString() } },
            )
            array("sync_up_fab_orientation_entries", listOf("Vertical", "Horizontal"))
            array("sync_up_fab_orientation_values", listOf("0", "1"))
        }

        document("res/xml/cat_general.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY_HEADER)
            val category = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "Floating Action Button" }
                ?.parentNode as? Element
                ?: throw PatchException("No Floating Action Button category to add the settings to")

            fun add(tag: String, attributes: Map<String, String>) {
                val preference = document.createElement(tag)
                attributes.forEach { (name, value) -> preference.setAttribute(name, value) }
                category.appendChild(preference)
            }

            // Sync's own setting is kept and opened up rather than replaced. Taking it away
            // is what crashed this screen: Sync looks it up by name and speaks to whatever
            // comes back, which was nothing.
            val its = (0 until category.childNodes.length)
                .map { category.childNodes.item(it) }
                .filterIsInstance<Element>()
                .firstOrNull { it.getAttribute("android:key") == "main_fab_action" }
                ?: throw PatchException("Sync no longer chooses what its floating button is for")

            its.setAttribute("android:title", "Main action")
            its.setAttribute("android:summary", "%s")

            (1..SLOTS).forEach { slot ->
                add(
                    LIST,
                    mapOf(
                        "android:key" to "sync_up_fab_slot_$slot",
                        "android:title" to "Extra action $slot",
                        "android:entries" to "@array/sync_up_fab_entries",
                        "android:entryValues" to "@array/sync_up_fab_values",
                        "android:defaultValue" to "-1",
                        // Shows what is chosen without having to open it.
                        "android:summary" to "%s",
                    ),
                )
            }
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_fab_orientation",
                    "android:title" to "Orientation",
                    "android:entries" to "@array/sync_up_fab_orientation_entries",
                    "android:entryValues" to "@array/sync_up_fab_orientation_values",
                    "android:defaultValue" to "0",
                    "android:summary" to "%s",
                ),
            )
            add(
                CHECK_BOX,
                mapOf(
                    "android:key" to "sync_up_fab_separators",
                    "android:title" to "Separate the extra actions",
                    "android:summary" to "Draw a line between them",
                    "android:defaultValue" to "true",
                ),
            )
        }
    }
}

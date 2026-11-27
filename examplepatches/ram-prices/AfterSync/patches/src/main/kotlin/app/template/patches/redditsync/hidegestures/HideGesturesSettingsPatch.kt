package app.template.patches.redditsync.hidegestures

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * The General settings screen is built from res/xml/cat_general.xml, which
 * contains a <PreferenceCategory> whose header has categoryTitle="Gestures",
 * holding three child preferences:
 *   - key="swipe_hide"  ("Swipe to return")
 *   - key="swipe_dim"   ("Dim behind activity")
 *   - key="swipe_sens"  ("Swipe to return sensitivity")
 *
 * This version genuinely DELETES the category and its preferences from the
 * XML (an earlier version instead hid them via isPreferenceVisible=false to
 * work around a crash — see removeSwipeSensSetupPatch.kt for why full
 * deletion is now safe: it removes the one piece of code that referenced
 * "swipe_sens" by key and would otherwise crash on a missing preference).
 * This patch must be applied together with removeSwipeSensSetupPatch, which
 * declares the dependency on this patch (not the other way around).
 */
val hideGesturesSettingsPatch = resourcePatch(
    name = "Remove Gestures settings (resources)",
    description = "Removes the \"Gestures\" section (Swipe to return, Dim behind activity, " +
        "Swipe to return sensitivity) from Sync for Reddit's General settings screen. " +
        "This patch only edits XML — see \"Remove Gestures settings\" for the matching " +
        "bytecode fix this resource change requires to avoid a crash.",
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("res/xml/cat_general.xml").use { document ->
            val root = document.documentElement

            val categoryNodes = root.getElementsByTagName("PreferenceCategory")
            val categoriesToRemove = mutableListOf<Element>()
            val seenTitles = mutableListOf<String>()

            for (i in 0 until categoryNodes.length) {
                val category = categoryNodes.item(i) as? Element ?: continue

                var header: Element? = null
                val children = category.childNodes
                for (j in 0 until children.length) {
                    val node = children.item(j) as? Element ?: continue
                    val localTag = node.localName ?: node.tagName.substringAfterLast(':')
                    if (localTag == "CategoryHeaderPreference" ||
                        node.tagName.endsWith("CategoryHeaderPreference")
                    ) {
                        header = node
                        break
                    }
                }
                val header2 = header ?: continue

                val title = header2.attributes?.let { attrs ->
                    (0 until attrs.length)
                        .map { attrs.item(it) }
                        .firstOrNull {
                            (it.localName ?: it.nodeName.substringAfterLast(':')) == "categoryTitle"
                        }
                        ?.nodeValue
                }

                if (title != null) seenTitles += title
                if (title == "Gestures") {
                    categoriesToRemove += category
                }
            }

            if (categoriesToRemove.isEmpty()) {
                error(
                    "Could not find the Gestures preference category in " +
                        "res/xml/cat_general.xml. Category titles actually found: " +
                        seenTitles.joinToString(", ").ifEmpty { "(none)" } +
                        ". Another patch in this bundle may have already modified this " +
                        "file, or the structure may differ from what was inspected.",
                )
            }

            categoriesToRemove.forEach { category ->
                category.parentNode?.removeChild(category)
            }
        }
    }
}

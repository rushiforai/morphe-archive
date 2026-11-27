package app.template.patches.redditsync.rebrandabout

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Rebrands the "Everything else"/About screen for AfterSync, per explicit request:
 * - Renames "Everything else" to "About" in the root settings menu (res/xml/cat_root.xml).
 * - Removes "Help and support" (links to a locked subreddit) and "Rate app!" (the app
 *   was delisted, the link goes nowhere) entirely.
 * - Removes every original Credits entry (Patreon backers, Developer, 7 randomized
 *   "Mod" entries, 2 icon designers, "Pupper"/the dev's dog).
 * - Repurposes two existing Credits rows rather than deleting+recreating them, so their
 *   working click-listener wiring can be kept and only the display text (and, for one,
 *   the linked URL) needs to change — see rebrandAboutSetupPatch.kt for the matching
 *   bytecode changes:
 *   - "credit_dev" becomes "Morphe" / links to https://github.com/morpheapp instead of
 *     /u/ljdawson.
 *   - "backers" becomes "ram-prices/AfterSync" and links to the repo on GitHub
 *     instead of opening a Patreon-backers dialog (see rebrandAboutSetupPatch.kt for
 *     that URL swap).
 * - Adds a new, non-clickable "Sync for Reddit" row right after "about_preference"
 *   showing the original app's version — kept separate now that "about_preference"
 *   (title "AfterSync") shows the patch's own version/changelog link instead (see
 *   rebrandAboutSetupPatch.kt).
 */
val rebrandAboutResourcesPatch = resourcePatch(
    name = "Rebrand About screen (resources)",
    description = "Renames \"Everything else\" to \"About\", removes \"Help and support\"" +
        "/\"Rate app!\"/the original Credits entries, adds a row for the original app's " +
        "version, and repurposes two Credits rows for Morphe and this patch repo's " +
        "GitHub page in Sync for Reddit. This patch only edits XML — see \"Rebrand " +
        "About screen\" for the matching bytecode fix this resource change requires " +
        "to avoid a crash.",
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("res/xml/cat_root.xml").use { document ->
            val entries = document.documentElement.getElementsByTagName("*")
            var target: Element? = null
            for (i in 0 until entries.length) {
                val element = entries.item(i) as? Element ?: continue
                val localTag = element.localName ?: element.tagName.substringAfterLast('.')
                if (!localTag.endsWith("RootPreference")) continue
                val title = element.attributes?.let { attrs ->
                    (0 until attrs.length).map { attrs.item(it) }
                        .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "title" }
                        ?.nodeValue
                }
                if (title == "Everything else") { target = element; break }
            }
            val entry = target ?: error("Could not find \"Everything else\" in cat_root.xml.")
            entry.setAttribute("android:title", "About")
        }

        document("res/xml/cat_other.xml").use { document ->
            val root = document.documentElement
            val entries = root.getElementsByTagName("*")

            val keysToRemove = setOf(
                "feedback_preference", "rate_preference",
                "mod_0", "mod_1", "mod_2", "mod_3", "mod_4", "mod_5", "mod_6",
                "credit_icon", "credit_icon_2", "pupper",
            )
            val toRemove = mutableListOf<Element>()
            var creditDev: Element? = null
            var backers: Element? = null
            var aboutPreference: Element? = null

            for (i in 0 until entries.length) {
                val element = entries.item(i) as? Element ?: continue
                val key = element.attributes?.let { attrs ->
                    (0 until attrs.length).map { attrs.item(it) }
                        .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "key" }
                        ?.nodeValue
                } ?: continue

                when (key) {
                    in keysToRemove -> toRemove += element
                    "credit_dev" -> creditDev = element
                    "backers" -> backers = element
                    "about_preference" -> aboutPreference = element
                }
            }

            if (toRemove.size != keysToRemove.size) {
                error(
                    "Expected to find ${keysToRemove.size} removable Credits/App-info " +
                        "entries in cat_other.xml, found ${toRemove.size}.",
                )
            }
            toRemove.forEach { it.parentNode?.removeChild(it) }

            val dev = creditDev ?: error("Could not find \"credit_dev\" in cat_other.xml.")
            dev.setAttribute("android:title", "Morphe")
            dev.setAttribute("android:summary", "https://github.com/morpheapp")

            val back = backers ?: error("Could not find \"backers\" in cat_other.xml.")
            back.setAttribute("android:icon", "@drawable/outline_info_24")
            back.setAttribute("android:title", "ram-prices/AfterSync")
            back.setAttribute("android:summary", "Developed using Claude — tap to view on GitHub")

            // New static row: the original app identity/version, kept separate now that
            // "about_preference" (title "AfterSync") shows the patch's own version instead.
            // No key is wired to any click listener in the bytecode patch, so tapping it
            // does nothing, per request.
            val about = aboutPreference ?: error("Could not find \"about_preference\" in cat_other.xml.")
            val originalAppInfo = document.createElement(
                "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncPreference",
            )
            originalAppInfo.setAttribute("android:icon", "@drawable/outline_info_24")
            originalAppInfo.setAttribute("android:title", "Sync for Reddit")
            originalAppInfo.setAttribute("android:summary", "v23.06.30-13:39 (23033)")
            about.parentNode?.insertBefore(originalAppInfo, about.nextSibling)
        }
    }
}

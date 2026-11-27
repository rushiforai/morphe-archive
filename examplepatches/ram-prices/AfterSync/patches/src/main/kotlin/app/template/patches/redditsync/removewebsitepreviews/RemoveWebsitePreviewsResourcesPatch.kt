package app.template.patches.redditsync.removewebsitepreviews

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Removes the "Website previews" toggle (and its now-empty "Enhancements" category)
 * from the Sync Ultra screen (res/xml/cat_ultra.xml), per explicit request that the
 * feature doesn't work well.
 *
 * See removeWebsitePreviewsSetupPatch.kt for the matching bytecode changes: deleting
 * just this XML entry would leave PreferencesUltraFragment's force-visibility lookup
 * of the containing "ultra_enhancements" category crashing (same pattern as past
 * preference removals), and the underlying feature is also hard-disabled at its own
 * gate function so it can't silently keep running off a previously-stored preference
 * value.
 */
val removeWebsitePreviewsResourcesPatch = resourcePatch(
    name = "Remove Website previews (resources)",
    description = "Removes the \"Website previews\" toggle from Sync for Reddit's Sync " +
        "Ultra screen and disables the underlying feature. This patch only edits XML " +
        "— see \"Remove Website previews\" for the matching bytecode fix this resource " +
        "change requires to avoid a crash.",
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("res/xml/cat_ultra.xml").use { document ->
            val root = document.documentElement
            val entries = root.getElementsByTagName("*")

            var category: Element? = null
            for (i in 0 until entries.length) {
                val element = entries.item(i) as? Element ?: continue
                val localTag = element.localName ?: element.tagName.substringAfterLast('.')
                val key = element.attributes?.let { attrs ->
                    (0 until attrs.length).map { attrs.item(it) }
                        .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "key" }
                        ?.nodeValue
                }
                if (localTag == "PreferenceCategory" && key == "ultra_enhancements") {
                    category = element
                    break
                }
            }

            val cat = category ?: error("Could not find the \"ultra_enhancements\" category in cat_ultra.xml.")
            cat.parentNode?.removeChild(cat)
        }
    }
}

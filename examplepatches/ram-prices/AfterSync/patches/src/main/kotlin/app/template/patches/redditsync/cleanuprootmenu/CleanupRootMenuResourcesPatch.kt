package app.template.patches.redditsync.cleanuprootmenu

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.redditsync.removesyncultra.removeSyncUltraResourcesPatch
import org.w3c.dom.Element

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Two unrelated cat_root.xml cleanups, per explicit request:
 *
 * 1. Removes the "New" category entirely (its header, "Developer options", and "Legacy
 *    settings") along with the "RootLegacyTooltipPreference" promotional banner that
 *    sits above it advertising the Legacy-settings feature. Confirmed by hand via
 *    apktool: PreferencesNewRootFragment's setup code (Lpa/u0;->C3) computes a value
 *    for the LEGACY integer but never stores or uses the result (the move-result-object
 *    is skipped before the register is overwritten by the next lookup) — i.e. it's
 *    already-dead code that never actually looks up "Legacy settings" by key, so
 *    deleting it needs no bytecode change. The tooltip banner is a fully self-contained
 *    preference (own layout, own click handler opening its own dialog) that never
 *    references "Legacy settings" by key either — also safe to delete outright.
 *    "Developer options" was already gated to be invisible for everyone except ~9
 *    hardcoded tester usernames, so removing the category isn't a real loss of
 *    visible functionality for a normal account either way.
 * 2. Moves "Run setup" from the "Appearance" category to be the first entry in "Other".
 *    Confirmed by hand: this preference's implicit key (derived from @integer/SETUP)
 *    isn't looked up anywhere else in PreferencesNewRootFragment, so moving it is a
 *    pure position change with no code implications — same reasoning already confirmed
 *    for the Sync Ultra move.
 *
 * Depends on removeSyncUltraResourcesPatch, which also edits cat_root.xml's "New"
 * category: that patch deletes the "Sync Ultra" entry from wherever it naturally sits
 * (inside "New") by searching for it by title. Since this patch deletes the entire "New"
 * category as one subtree, removeSyncUltraResourcesPatch must run first — otherwise its
 * own search for "Sync Ultra" would fail once this patch had already deleted it as
 * collateral (same bug class documented in feedback_patch_ordering).
 */
val cleanupRootMenuResourcesPatch = resourcePatch(
    name = "Clean up root settings menu (resources)",
    description = "Removes the \"New\" category (\"Developer options\", \"Legacy settings\", " +
        "and its promotional banner) and moves \"Run setup\" into the \"Other\" category " +
        "in Sync for Reddit's settings. This patch only edits XML — see \"Clean up root " +
        "settings menu\" for the matching bytecode fix this resource change requires to " +
        "avoid a crash.",
    default = true,
) {
    dependsOn(removeSyncUltraResourcesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("res/xml/cat_root.xml").use { document ->
            val root = document.documentElement
            val entries = root.getElementsByTagName("*")

            fun titleOf(element: Element): String? = element.attributes?.let { attrs ->
                (0 until attrs.length).map { attrs.item(it) }
                    .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "title" }
                    ?.nodeValue
            }

            var newCategory: Element? = null
            var legacyTooltip: Element? = null
            var runSetup: Element? = null
            var otherHeader: Element? = null

            for (i in 0 until entries.length) {
                val element = entries.item(i) as? Element ?: continue
                val localTag = element.localName ?: element.tagName.substringAfterLast('.')

                val key = element.attributes?.let { attrs ->
                    (0 until attrs.length).map { attrs.item(it) }
                        .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "key" }
                        ?.nodeValue
                }
                if (localTag == "PreferenceCategory" && key == "ultra_wrapper") {
                    newCategory = element
                }
                if (localTag.endsWith("RootLegacyTooltipPreference")) {
                    legacyTooltip = element
                }
                if (localTag.endsWith("RootPreference") && titleOf(element) == "Run setup") {
                    runSetup = element
                }
                if (localTag.endsWith("CategoryHeaderPreference")) {
                    val categoryTitle = element.attributes?.let { attrs ->
                        (0 until attrs.length).map { attrs.item(it) }
                            .firstOrNull {
                                (it.localName ?: it.nodeName.substringAfterLast(':')) == "categoryTitle"
                            }
                            ?.nodeValue
                    }
                    if (categoryTitle == "Other") otherHeader = element
                }
            }

            val category = newCategory ?: error("Could not find the \"New\" category (ultra_wrapper) in cat_root.xml.")
            category.parentNode?.removeChild(category)

            val tooltip = legacyTooltip ?: error("Could not find RootLegacyTooltipPreference in cat_root.xml.")
            tooltip.parentNode?.removeChild(tooltip)

            val setup = runSetup ?: error("Could not find \"Run setup\" in cat_root.xml.")
            val other = otherHeader ?: error("Could not find the \"Other\" category header in cat_root.xml.")
            val otherCategory = other.parentNode ?: error("The \"Other\" category header has no parent element.")

            setup.parentNode?.removeChild(setup)
            otherCategory.insertBefore(setup, other.nextSibling)
        }
    }
}

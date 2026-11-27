package app.template.patches.redditsync.removeultracloudbackup

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Removes the Ultra-gated "Cloud backup and restore" section from res/xml/cat_backup.xml
 * ("Cloud backup now" / "Restore from cloud backup" / "Remove cloud backup", plus its
 * divider), per explicit request: it's redundant with the free-tier "Backup and restore"
 * section on the same screen (confirmed by hand: both use the exact same key-filtering
 * logic when building a backup, so there's no data-coverage difference), and this Ultra
 * version depends entirely on Sync's own now-abandoned Firebase backend (Cloud Functions
 * for backup/restore/delete/exists-check) rather than the free version's local
 * SAF-based file I/O.
 *
 * See removeUltraCloudBackupSetupPatch.kt for the matching bytecode removal — deleting
 * this section alone crashes the settings screen the same way past preference removals
 * have, since PreferencesBackupFragment looks these rows up by key with no null checks.
 *
 * This patch used to ALSO remove "ultra_cloud" ("Settings cloud backup") from the Sync
 * Ultra screen's "Cloud services" category (res/xml/cat_ultra.xml) — dropped as dead work
 * once removeSyncUltraResourcesPatch started deleting that entire category (and,
 * separately, the Sync Ultra entry point itself) outright: with the whole category gone
 * as one subtree, "ultra_cloud" is removed as collateral regardless, and with the Sync
 * Ultra screen's entry point gone, PreferencesUltraFragment (which used to look up
 * "ultra_cloud" to wire its click listener) is unreachable dead code that can never run
 * — nothing left to crash. See the patch cleanup punch list this was tracked under for
 * the reasoning (this file no longer touches cat_ultra.xml at all).
 */
val removeUltraCloudBackupResourcesPatch = resourcePatch(
    name = "Remove Ultra cloud backup (resources)",
    description = "Removes the redundant, Firebase-backend-dependent \"Cloud backup and " +
        "restore\" section from Sync for Reddit's Backup settings screen. This patch only " +
        "edits XML — see \"Remove Ultra cloud backup\" for the matching bytecode fix this " +
        "resource change requires to avoid a crash.",
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("res/xml/cat_backup.xml").use { document ->
            val root = document.documentElement
            val entries = root.getElementsByTagName("*")

            var category: Element? = null
            var divider: Element? = null

            for (i in 0 until entries.length) {
                val element = entries.item(i) as? Element ?: continue
                val localTag = element.localName ?: element.tagName.substringAfterLast('.')
                val key = element.attributes?.let { attrs ->
                    (0 until attrs.length).map { attrs.item(it) }
                        .firstOrNull { (it.localName ?: it.nodeName.substringAfterLast(':')) == "key" }
                        ?.nodeValue
                }
                if (localTag == "PreferenceCategory" && key == "ultra_backup") category = element
                if (localTag.endsWith("DividerPreference") && key == "ultra_backup_divider") divider = element
            }

            val cat = category ?: error("Could not find the \"ultra_backup\" category in cat_backup.xml.")
            cat.parentNode?.removeChild(cat)

            val div = divider ?: error("Could not find \"ultra_backup_divider\" in cat_backup.xml.")
            div.parentNode?.removeChild(div)
        }
    }
}

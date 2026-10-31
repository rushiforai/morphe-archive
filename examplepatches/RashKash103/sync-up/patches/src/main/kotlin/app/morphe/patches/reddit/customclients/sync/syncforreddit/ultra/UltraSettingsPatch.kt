package app.morphe.patches.reddit.customclients.sync.syncforreddit.ultra

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ROOT_SCREEN = "res/xml/cat_root.xml"

private const val BACKUP_SCREEN = "res/xml/cat_backup.xml"

/** The way in to the subscription, which sits among the screens rather than under one. */
private const val THE_WAY_IN = "Sync Ultra"

/** What is kept on Sync's own servers, which stopped answering. */
private val KEPT_ON_THEIR_SERVERS = setOf("ultra_backup", "ultra_backup_divider")

/**
 * Takes the subscription out of the settings.
 *
 * <p>Nothing there can be bought any more, and what it offered is either turned on already or
 * kept on servers that no longer answer. A screen that can only disappoint is worse than no
 * screen at all.
 *
 * <p>Hidden rather than taken away. Sync looks these up by name when it builds the screen and
 * speaks to whatever comes back, so a row that is gone is not a row it skips — it is a crash on
 * opening the screen that held it. Hiding one is Sync's own way of leaving a row out, used in
 * four of its own screens.
 *
 * <p>Has no name, and so is not offered on its own.
 */

/** How Sync itself leaves a row out of a screen it has built. */
private const val OUT_OF_SIGHT = "app:isPreferenceVisible"
internal val ultraSettingsPatch = resourcePatch(
    description = "Hides the Sync Ultra screen and the cloud backup that needs it.",
) {
    execute {
        document(ROOT_SCREEN).use { document ->
            val rows = document.getElementsByTagName("*")
            val theWayIn = (0 until rows.length)
                .map { rows.item(it) as Element }
                .firstOrNull { it.getAttribute("android:title") == THE_WAY_IN }
                ?: throw PatchException("No way in to the subscription to take out")

            theWayIn.setAttribute(OUT_OF_SIGHT, "false")
        }

        document(BACKUP_SCREEN).use { document ->
            val rows = document.getElementsByTagName("*")
            val theirs = (0 until rows.length)
                .map { rows.item(it) as Element }
                .filter { it.getAttribute("android:key") in KEPT_ON_THEIR_SERVERS }

            if (theirs.isEmpty()) {
                throw PatchException("No cloud backup to take out")
            }
            theirs.forEach { it.setAttribute(OUT_OF_SIGHT, "false") }
        }
    }
}

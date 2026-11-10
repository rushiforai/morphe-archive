package app.morphe.patches.reddit.customclients.sync.syncforreddit.api

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.util.drawableNamed
import org.w3c.dom.Element

private const val PREFERENCES = "com.laurencedawson.reddit_sync.ui.preferences"

private const val CATEGORY_HEADER = "$PREFERENCES.defaults.CategoryHeaderPreference"
private const val ROW = "$PREFERENCES.defaults.SyncPreference"
private const val ROOT_ROW = "$PREFERENCES.custom.RootPreference"

/** The way in to the screen these rows are added to, as the main settings screen names it. */
private const val THE_WAY_IN = "Everything else"

/** The section of that screen naming who had a hand in the app. */
private const val CREDITS = "Credits"

/**
 * Adds the rows that let what the app identifies itself with be typed in.
 *
 * <p>They go on the Other screen, beside what the app says about itself, rather than on a
 * screen of their own: there are four of them and they are set once, if ever.
 */
internal val clientSettingsPatch = resourcePatch(
    description = "Adds the rows for the client id, redirect URI and user agent to the settings.",
) {
    execute {
        document("res/xml/cat_other.xml").use { document ->
            val screen = document.getElementsByTagName("PreferenceScreen").item(0) as? Element
                ?: throw PatchException("The Other settings screen is not a screen")

            val category = document.createElement("PreferenceCategory")

            val header = document.createElement(CATEGORY_HEADER)
            header.setAttribute("app:categoryTitle", "Sync Up client")
            category.appendChild(header)

            fun row(key: String, title: String, summary: String, icon: String) {
                val preference = document.createElement(ROW)
                preference.setAttribute("android:key", key)
                preference.setAttribute("android:title", title)
                preference.setAttribute("android:summary", summary)
                // Every row of Sync's own carries one, so one without looks like a mistake.
                drawableNamed(icon)?.let { preference.setAttribute("android:icon", it) }
                category.appendChild(preference)
            }

            // The summaries are replaced as the screen loads with what is actually set; these
            // are what shows if that never runs.
            row(
                "sync_up_client_id",
                "OAuth client ID",
                "Sync signs in to Reddit with this.",
                "outline_code_24",
            )
            row(
                "sync_up_redirect_uri",
                "Redirect URI",
                "Where Reddit sends you back to after signing in.",
                "outline_link_24",
            )
            row(
                "sync_up_user_agent",
                "User agent",
                "How Sync introduces itself to Reddit.",
                "outline_web_24",
            )
            row(
                "sync_up_imgur_client_id",
                "Imgur client ID",
                "Used when you upload a picture to Imgur.",
                "outline_image_24",
            )

            // First, since signing in is what the rest of the app waits on.
            screen.insertBefore(category, screen.firstChild)

            // Beside the people Sync credits. This is the one place in the app that says the
            // app has been patched at all; everywhere else reads as Sync's own.
            //
            // Left out rather than insisted on where that section is not where this expects:
            // a credit is a courtesy, and failing the patch over one would take the client id
            // rows down with it and leave the app unable to sign in at all. The Pro and Dev
            // packages are offered here and have never been read, so this cannot assume their
            // settings are laid out like the free one's.
            val headers = document.getElementsByTagName(CATEGORY_HEADER)
            val credits = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == CREDITS }
                ?.parentNode as? Element

            fun credit(key: String, title: String, summary: String, icon: String) {
                val preference = document.createElement(ROW)
                preference.setAttribute("android:key", key)
                preference.setAttribute("android:title", title)
                preference.setAttribute("android:summary", summary)
                drawableNamed(icon)?.let { preference.setAttribute("android:icon", it) }
                credits?.appendChild(preference)
            }

            if (credits != null) {
                credit(
                    "sync_up_credit",
                    "Sync Up patches",
                    "RashKash103",
                    "outline_person_24",
                )
                credit(
                    "sync_up_repository",
                    "Sync Up on GitHub",
                    "github.com/RashKash103/sync-up",
                    "outline_link_24",
                )
            }
        }

        // What the way in to that screen says it holds, which no longer mentions everything on
        // it. Someone looking for where to put a client id has nothing else to go on.
        //
        // Also left out rather than insisted on: a line of help is not worth the app not
        // working where a package is laid out differently.
        document("res/xml/cat_root.xml").use { document ->
            val rows = document.getElementsByTagName(ROOT_ROW)
            (0 until rows.length)
                .map { rows.item(it) as Element }
                .firstOrNull { it.getAttribute("android:title") == THE_WAY_IN }
                ?.setAttribute(
                    "android:summary",
                    "App credentials, app info, licenses & credits",
                )
        }
    }
}

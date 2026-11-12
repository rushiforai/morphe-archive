package app.morphe.patches.reddit.customclients.sync.syncforreddit.redirects

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.util.drawableNamed
import org.w3c.dom.Element

private const val PREFERENCES = "com.laurencedawson.reddit_sync.ui.preferences"

private const val CATEGORY = "$PREFERENCES.defaults.CategoryHeaderPreference"
private const val CHECK_BOX = "$PREFERENCES.defaults.SyncCheckBoxPreference"
private const val LIST = "$PREFERENCES.defaults.SyncListPreference"
private const val ROW = "$PREFERENCES.defaults.SyncPreference"
private const val HEADER = "$PREFERENCES.HeaderPreference"
private const val ROOT_ROW = "$PREFERENCES.custom.RootPreference"

/**
 * The ids of the screens, which have to be numbers no screen of Sync's own uses and have to
 * match the ones the extension answers to.
 */
private val screenIds = mapOf(
    "SYNC_UP_REDIRECTS" to 8200,
    "SYNC_UP_REDIRECTS_IMGUR" to 8210,
    "SYNC_UP_REDIRECTS_DDG" to 8211,
    "SYNC_UP_REDIRECTS_RIMGO" to 8212,
    "SYNC_UP_REDIRECTS_PROXY" to 8213,
)

/**
 * Builds the redirect screens out of the preferences Sync builds its own screens from, so that
 * they are drawn by the app rather than beside it: the same rows, the same headings, the same
 * theme.
 *
 * <p>A screen for each route rather than one screen for all of them. Three routes' worth of
 * switches, addresses, instance lists and certificates on one screen would be a wall nobody
 * could find anything in, and Sync's own settings are arranged the same way — a row that leads
 * to a screen.
 */
internal val redirectsSettingsPatch = resourcePatch(
    description = "Adds the redirect screens to Sync's settings.",
) {
    execute {
        document("res/values/arrays.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element

            fun array(name: String, vararg items: String) {
                val array = document.createElement("string-array")
                array.setAttribute("name", name)
                items.forEach {
                    val item = document.createElement("item")
                    item.appendChild(document.createTextNode(it))
                    array.appendChild(item)
                }
                resources.appendChild(array)
            }

            array("sync_up_redirect_when", "Always", "Only once Imgur refuses")
            array("sync_up_redirect_when_values", "always", "refused")

            array("sync_up_redirect_proxy_kinds", "HTTP", "SOCKS")
            array("sync_up_redirect_proxy_kind_values", "http", "socks")
        }

        // An id for each screen, which is how Sync tells its screens apart.
        document("res/values/integers.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element
            screenIds.forEach { (name, value) ->
                val id = document.createElement("integer")
                id.setAttribute("name", name)
                id.appendChild(document.createTextNode(value.toString()))
                resources.appendChild(id)
            }
        }

        // region The screens, each written where Sync keeps its own.

        screen(
            "cat_sync_up_redirects",
            "Redirects",
            """
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="General" />
                <$CHECK_BOX
                    android:key="sync_up_redirect"
                    android:title="Redirect blocked services"
                    android:summary="Reach content another way where the service refuses this part of the world. Each service is off until it is turned on below."
                    android:defaultValue="true" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Services" />
                ${rootRow("Imgur", "Pictures, albums, and videos", "SYNC_UP_REDIRECTS_IMGUR",
                    "outline_image_24")}
            </PreferenceCategory>
            """,
        )

        screen(
            "cat_sync_up_redirects_imgur",
            "Imgur",
            """
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="General" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur"
                    android:title="Unblock Imgur"
                    android:summary="Load Imgur pictures and videos another way. Imgur refuses whole regions, the United Kingdom among them, and answers with a notice instead of the picture."
                    android:defaultValue="false" />
                <$LIST
                    android:key="sync_up_redirect_imgur_when"
                    android:title="When to take another route"
                    android:summary="%s"
                    android:entries="@array/sync_up_redirect_when"
                    android:entryValues="@array/sync_up_redirect_when_values"
                    android:defaultValue="always" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Routes" />
                ${rootRow("DuckDuckGo proxy", "One picture at a time, nothing to set up",
                    "SYNC_UP_REDIRECTS_DDG", "outline_search_24")}
                ${rootRow("Rimgo", "Pictures, videos, and albums, through an instance you choose",
                    "SYNC_UP_REDIRECTS_RIMGO", "outline_dns_24")}
                ${rootRow("Proxy", "Everything, through a proxy of your own",
                    "SYNC_UP_REDIRECTS_PROXY", "outline_lock_24")}
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="What is happening" />
                <$ROW
                    android:key="sync_up_redirect_imgur_last"
                    android:title="What answered last"
                    android:summary="Nothing has been asked for yet" />
            </PreferenceCategory>
            """,
        )

        screen(
            "cat_sync_up_redirects_ddg",
            "DuckDuckGo proxy",
            """
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="DuckDuckGo proxy" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_ddg"
                    android:title="Use the DuckDuckGo proxy"
                    android:summary="Fetches a picture through DuckDuckGo, which is already fetching pictures for its own image search. Nothing to set up and no third party to choose, so it is tried first."
                    android:defaultValue="true" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_ddg_share"
                    android:title="Share and copy through the proxy"
                    android:summary="Hands out the proxy's address for a picture instead of Imgur's, so that what you send works where Imgur is refused. Only for a picture — an album or a video is shared as the Imgur address, since the proxy cannot serve one."
                    android:defaultValue="false" />
                <$ROW
                    android:key="sync_up_redirect_imgur_ddg_note"
                    android:title="What it cannot do"
                    android:summary="One picture at a time. It will not serve a video or an album, so those need Rimgo or a proxy."
                    android:selectable="false" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Reference" />
                <$ROW
                    android:key="sync_up_redirect_imgur_ddg_credit"
                    android:title="ImgurUnblocker"
                    android:summary="How this route works was taken from HexedHero's ImgurUnblocker, the browser extension that does the same thing. Tap to open it on GitHub." />
            </PreferenceCategory>
            """,
        )

        screen(
            "cat_sync_up_redirects_rimgo",
            "Rimgo",
            """
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Rimgo" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_rimgo"
                    android:title="Use Rimgo"
                    android:summary="A front end for Imgur that others run. It serves pictures, videos, and albums alike. Off until an instance has been chosen, since this means asking someone else's server for your pictures."
                    android:defaultValue="false" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_rimgo_share"
                    android:title="Share and copy through an instance"
                    android:summary="Hands out the instance's address instead of Imgur's, for pictures, videos, and albums alike, so that what you send works where Imgur is refused."
                    android:defaultValue="false" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Instances" />
                <$ROW
                    android:key="sync_up_redirect_imgur_rimgo_instances"
                    android:title="Instances"
                    android:summary="None chosen" />
                <$ROW
                    android:key="sync_up_redirect_imgur_rimgo_published"
                    android:title="Published list"
                    android:summary="Not fetched yet" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_rimgo_check"
                    android:title="Check them as the list opens"
                    android:summary="Asks each instance for a picture, so that what is working is known before one is needed"
                    android:defaultValue="true" />
                <$ROW
                    android:key="sync_up_redirect_imgur_rimgo_mtls_note"
                    android:title="Instances behind mTLS"
                    android:summary="Long-press an instance to attach a client certificate. It is offered to that instance alone: a certificate names whoever holds it, and the server decides when to ask for one."
                    android:selectable="false" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="About Rimgo" />
                <$ROW
                    android:key="sync_up_redirect_imgur_rimgo_project"
                    android:title="Rimgo"
                    android:summary="The front end every one of these instances is running. Tap to open the project on Codeberg." />
                <$ROW
                    android:key="sync_up_redirect_imgur_rimgo_selfhost"
                    android:title="Running your own is better"
                    android:summary="Public instances are run by whoever cares to and are often unreliable — rate limited by Imgur, overloaded, or simply gone. One of your own answers only to you. It has to run somewhere Imgur is not refusing, though: an instance hosted in the United Kingdom is refused exactly as this app is, and would be no use at all."
                    android:selectable="false" />
                <$ROW
                    android:key="sync_up_redirect_imgur_rimgo_list_credit"
                    android:title="LibRedirect"
                    android:summary="The published list of instances is the one LibRedirect keeps for its own extension. Tap to open it on GitHub." />
            </PreferenceCategory>
            """,
        )

        screen(
            "cat_sync_up_redirects_proxy",
            "Proxy",
            """
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Proxy" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_proxy"
                    android:title="Use a proxy"
                    android:summary="Carries the request itself, so it can answer anything Imgur serves, its API included. Only Imgur requests go through it; the rest of the app is untouched."
                    android:defaultValue="false" />
                <$LIST
                    android:key="sync_up_redirect_imgur_proxy_kind"
                    android:title="Kind"
                    android:summary="%s"
                    android:entries="@array/sync_up_redirect_proxy_kinds"
                    android:entryValues="@array/sync_up_redirect_proxy_kind_values"
                    android:defaultValue="http" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_address"
                    android:title="Address"
                    android:summary="Not set" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_user"
                    android:title="Username"
                    android:summary="Not set" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_password"
                    android:title="Password"
                    android:summary="Not set" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Client certificate" />
                <$CHECK_BOX
                    android:key="sync_up_redirect_imgur_proxy_mtls"
                    android:title="Send a client certificate"
                    android:summary="For a proxy that asks for one (mTLS)"
                    android:defaultValue="false" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_certificate"
                    android:title="Certificate"
                    android:summary="Not set" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_certificate_password"
                    android:title="Certificate password"
                    android:summary="Not set" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Check" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_try"
                    android:title="Try the proxy"
                    android:summary="Asks Imgur for a picture through it and says what happened" />
            </PreferenceCategory>
            <PreferenceCategory>
                <$CATEGORY app:categoryTitle="Kept out of a backup" />
                <$ROW
                    android:key="sync_up_redirect_imgur_proxy_note"
                    android:title="Where this is kept"
                    android:summary="The address, what it is logged into with, and the certificate are kept in a file of their own rather than in Sync's settings, so that Sync's Backup cannot write them out."
                    android:selectable="false" />
            </PreferenceCategory>
            """,
        )

        // endregion

        // The way in, beside the other screens about what is read.
        document("res/xml/cat_root.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY)
            val content = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "Content" }
                ?.parentNode as? Element
                ?: throw PatchException("No Content section to put the redirect screens in")

            val row = document.createElement(ROOT_ROW)
            row.setAttribute("android:title", "Redirects")
            row.setAttribute(
                "android:summary",
                "Reach a service that refuses this region another way",
            )
            drawableNamed("outline_swap_horiz_24")?.let {
                row.setAttribute("app:custom_icon", it)
            }
            row.setAttribute("app:preference_ref", "@integer/SYNC_UP_REDIRECTS")
            content.appendChild(row)
        }
    }
}

/**
 * Writes one screen out whole.
 *
 * <p>Written rather than built node by node because what is being said is a screen's worth of
 * rows, and a screen written as XML can be read as one.
 */
private fun ResourcePatchContext.screen(name: String, title: String, body: String) {
    // Put together line by line rather than as one indented block: trimming the indent off a
    // template happens after what is interpolated into it has been put in, so the rows below
    // decide how far the whole thing is indented — and four spaces in front of the declaration
    // is not an XML document. It fails as "Unexpected token (position:[1:5])" while the APK is
    // being rebuilt, naming neither the file nor the line.
    val rows = body.trimIndent().prependIndent("    ")
    get("res/xml/$name.xml").writeText(
        "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                "<PreferenceScreen xmlns:android=\"http://schemas.android.com/apk/res/android\"\n" +
                "    xmlns:app=\"http://schemas.android.com/apk/res-auto\">\n" +
                "    <$HEADER app:title=\"$title\" />\n" +
                rows + "\n" +
                "</PreferenceScreen>\n",
    )
}

/**
 * A row that leads to another screen, of the kind Sync's own front page is made of.
 *
 * <p>No key is set on one of these: Sync's own takes the screen's id for its key as it is
 * built, so anything written here would be replaced. The extension looks one up by that number
 * where it wants to fade it.
 */
private fun ResourcePatchContext.rootRow(
    title: String,
    summary: String,
    reference: String,
    icon: String,
): String {
    val drawable = drawableNamed(icon)
    val iconAttribute = if (drawable == null) "" else """
                    app:custom_icon="$drawable""""
    return """<$ROOT_ROW
                    android:title="$title"
                    android:summary="$summary"$iconAttribute
                    app:preference_ref="@integer/$reference" />"""
}

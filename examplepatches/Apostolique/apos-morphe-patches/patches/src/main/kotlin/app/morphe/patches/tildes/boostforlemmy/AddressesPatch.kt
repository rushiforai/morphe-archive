package app.morphe.patches.tildes.boostforlemmy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.childElementsSequence
import org.w3c.dom.Element

/**
 * Offers Boost when a tildes.net address is opened anywhere on the phone.
 *
 * Boost already claims thirty-two Lemmy instances, all in one `intent-filter`
 * on `DeepLinkingActivity`, each a `<data android:scheme="https"
 * android:host="...">` and nothing else. No `pathPrefix`, no `pathPattern`, and
 * no `autoVerify` anywhere in the manifest -- so these are browsable links
 * rather than verified App Links, and what they buy is a row in Android's
 * chooser rather than the tap going straight in. Two more hosts go in beside
 * them, in the same shape.
 *
 * **The activity behind it already knows what to do with one.** It hands the
 * URL to Boost's own router first, which matches Lemmy's four shapes -- `/c/`,
 * `/u/`, `/post/`, `/comment/` -- and answers no to every Tildes address. Then
 * it asks the server to resolve the link, which is a request the interceptor
 * answers: a topic, a comment, a group or a person, off the shape of the path.
 * `TildesInterceptor`'s `/resolve_object` is the other half of this.
 *
 * **`tild.es` is here for the app's own sake.** Sharing or copying a topic out
 * of Boost writes `tild.es/1vlp`, the site's own short form, so that is the
 * link most likely to come back the other way.
 *
 * This is not scoped to the account, and cannot be: a manifest is read by the
 * package manager at install time and knows nothing about who is signed in. So
 * a Lemmy-only install gets Boost offered for tildes.net as well, where the
 * link resolves against the Lemmy server, fails, and opens in a browser the way
 * it would have anyway. `offerTildes` is unscoped for the same kind of reason.
 */
internal val tildesAddressesPatch = resourcePatch(
    description = "Lets Android offer Boost for a tildes.net address.",
) {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            val deepLinking = (0 until activities.length)
                .map { activities.item(it) as Element }
                .singleOrNull { it.getAttribute("android:name") == DEEP_LINKING_ACTIVITY }
                ?: throw PatchException("No $DEEP_LINKING_ACTIVITY to add an address to")

            // The one filter on it carrying addresses. It is also the only one
            // it has, and asking for the addresses rather than for the first
            // child is what would notice a second appearing.
            val filter = deepLinking.childElementsSequence()
                .filter { it.tagName == "intent-filter" }
                .singleOrNull { element ->
                    element.childElementsSequence().any { it.tagName == "data" }
                }
                ?: throw PatchException("No web address filter on $DEEP_LINKING_ACTIVITY")

            val claimed = filter.childElementsSequence()
                .filter { it.tagName == "data" }
                .map { it.getAttribute("android:host") }
                .toSet()

            if (claimed.size < 2) {
                throw PatchException("Only ${claimed.size} address on $DEEP_LINKING_ACTIVITY")
            }

            TILDES_HOSTS.filterNot { it in claimed }.forEach { host ->
                filter.appendChild(
                    manifest.createElement("data").apply {
                        // The prefixed name rather than a namespace-aware call,
                        // to match how the rest of the document was written.
                        setAttribute("android:scheme", "https")
                        setAttribute("android:host", host)
                    },
                )
            }
        }
    }
}

/** Where a tapped web address arrives, and the only activity claiming one. */
internal const val DEEP_LINKING_ACTIVITY =
    "com.rubenmayayo.reddit.ui.activities.DeepLinkingActivity"

/**
 * The site, and its own short form. Both are `https` only, which is what the
 * thirty-two beside them are and what the site itself answers on.
 */
internal val TILDES_HOSTS = listOf("tildes.net", "tild.es")

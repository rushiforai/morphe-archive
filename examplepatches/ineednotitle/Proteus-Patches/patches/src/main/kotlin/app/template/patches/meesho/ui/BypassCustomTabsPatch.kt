package app.template.patches.meesho.ui

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import org.w3c.dom.Element

// Prefer a normal external browser over Meesho's in-app Custom Tabs handoff.
//
// Meesho's manifest <queries> block contains the
// android.support.customtabs.action.CustomTabsService intent (verified in a
// decoded manifest), used to probe for a Custom Tabs provider before opening
// help/legal/offer links. Removing that query makes the probe return nothing,
// so apps that check first fall back to a plain ACTION_VIEW (system browser).
//
// LIMITATION: if Meesho calls CustomTabsIntent.launchUrl() unconditionally,
// the browser still opens a Custom Tab; Android does not require the query for
// that call. Best-effort — harmless if unused.
//
// Fail-safe: a manifest without the query is left untouched.

private const val CUSTOM_TABS_SERVICE = "android.support.customtabs.action.CustomTabsService"

@Suppress("unused")
val meeshoBypassCustomTabsPatch = resourcePatch(
    name = "Prefer external browser over Custom Tabs",
    description = "Removes Meesho's Custom Tabs service query so browser links can fall " +
        "back to the normal external browser. No effect if Meesho launches Custom Tabs " +
        "directly.",
    default = true,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val intents = document.getElementsByTagName("intent")
            val toRemove = mutableListOf<Element>()

            for (index in 0 until intents.length) {
                val intent = intents.item(index) as? Element ?: continue
                val children = intent.childNodes

                val isCustomTabsQuery = (0 until children.length).any { childIndex ->
                    val child = children.item(childIndex) as? Element ?: return@any false
                    child.tagName == "action" &&
                        child.getAttribute("android:name") == CUSTOM_TABS_SERVICE
                }

                if (isCustomTabsQuery) toRemove += intent
            }

            toRemove.forEach { intent -> intent.parentNode?.removeChild(intent) }
        }
    }
}

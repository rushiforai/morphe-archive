package app.template.patches.mubi.ui

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import org.w3c.dom.Element

// Prefer a normal external browser over MUBI's in-app Custom Tabs handoff.
//
// MUBI uses AndroidX Custom Tabs for help, account and legal links. Custom Tabs
// keeps the user inside an app-controlled browser sheet, which also defeats
// normal tab management, extensions and blockers.
//
// Android's Custom Tabs flow starts with the app resolving a browser that
// implements `android.support.customtabs.action.CustomTabsService`. Removing
// that <queries> intent makes the service query return nothing, so apps that
// probe first fall back to a plain ACTION_VIEW intent (the system browser).
//
// LIMITATION: if MUBI calls CustomTabsIntent.launchUrl() unconditionally, the
// browser still opens a Custom Tab; Android does not require the query for that
// call. This patch only helps when the app probes for a provider first. It is on
// by default because removing an unused query is harmless.
//
// Fail-safe: a manifest without a Custom Tabs query is left untouched.

private const val CUSTOM_TABS_SERVICE = "android.support.customtabs.action.CustomTabsService"

@Suppress("unused")
val mubiBypassCustomTabsPatch = resourcePatch(
    name = "Prefer external browser over Custom Tabs",
    description = "Removes MUBI's Custom Tabs service query so browser links can fall " +
        "back to the normal external browser. No effect if MUBI launches Custom Tabs directly.",
    default = true,
) {
    compatibleWith(MUBI_COMPATIBILITY)

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

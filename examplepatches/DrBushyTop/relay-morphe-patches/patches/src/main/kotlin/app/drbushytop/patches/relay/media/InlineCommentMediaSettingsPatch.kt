package app.drbushytop.patches.relay.media

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Must match InlineMediaSettings in the extension.
private const val KEY_ENABLED = "drbushytop_inline_media"
private const val KEY_UNMETERED_ONLY = "drbushytop_inline_media_unmetered_only"

/**
 * Adds two rows to Relay's Settings, Behaviour, Comments: whether comments draw their pictures,
 * and whether only off mobile data. Relay's screen saves them to its own settings file, and its
 * change listener ignores keys it does not know.
 */
internal val inlineCommentMediaSettingsPatch = resourcePatch {
    execute {
        document("res/xml/preferences_behaviour.xml").use { document ->
            val categories = document.getElementsByTagName("PreferenceCategory")
            val comments = (0 until categories.length).map { categories.item(it) as Element }
                .firstOrNull { it.getAttribute("android:title") == "Comments" }
                ?: throw PatchException("Relay's Comments settings category was not found")

            fun checkBox(key: String, title: String, summary: String, default: Boolean) =
                document.createElement("CheckBoxPreference").apply {
                    setAttribute("android:key", key)
                    setAttribute("android:title", title)
                    setAttribute("android:summary", summary)
                    setAttribute("android:defaultValue", default.toString())
                }

            comments.appendChild(
                checkBox(
                    KEY_ENABLED,
                    "Inline pictures and GIFs",
                    "Draw linked pictures and GIFs inside comments. Off shows them as links.",
                    true,
                ),
            )
            comments.appendChild(
                checkBox(
                    KEY_UNMETERED_ONLY,
                    "Only on Wi-Fi",
                    "On mobile data or a metered network, show links instead.",
                    false,
                ).apply { setAttribute("android:dependency", KEY_ENABLED) },
            )
        }
    }
}

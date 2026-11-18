package app.template.patches.instagram.scroll

import app.morphe.patcher.patch.resourcePatch

internal val keepDmScrollPositionResources = resourcePatch {
    execute {
        val translations = mapOf(
            "values" to Pair(
                "Keep scroll position when replying",
                "Stay at the current position in a conversation after replying to an older message.",
            ),
            "values-pl" to Pair(
                "Zachowuj pozycję przewijania podczas odpowiadania",
                "Pozostań w bieżącym miejscu rozmowy po odpowiedzi na starszą wiadomość.",
            ),
        )
        translations.forEach { (directory, strings) ->
            // Use the canonical, tracked document so Morphe assigns new string IDs.
            val path = "res/$directory/strings.xml"
            get(path).apply {
                if (!exists()) {
                    parentFile.mkdirs()
                    writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?><resources/>")
                }
            }
            document(path).use { document ->
                val root = document.documentElement
                listOf("title" to strings.first, "summary" to strings.second).forEach { (suffix, text) ->
                    val element = document.createElement("string")
                    element.setAttribute("name", "dudeks_keep_dm_scroll_position_$suffix")
                    element.textContent = text
                    root.appendChild(element)
                }
            }
        }
    }
}

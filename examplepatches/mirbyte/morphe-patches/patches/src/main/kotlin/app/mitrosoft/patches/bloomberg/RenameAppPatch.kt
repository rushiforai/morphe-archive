package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG
import org.w3c.dom.Element

@Suppress("unused")
val renameAppPatch = resourcePatch(
    name = "Rename Bloomberg",
    description = "Changes the launcher name shown under the app icon.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    val appName by stringOption(
        key = "appName",
        default = "Bloomberg M",
        title = "App name",
        description = "Name shown under the app icon on the home screen.",
    )

    execute {
        val name = appName?.takeIf { it.isNotBlank() } ?: return@execute

        document("res/values/strings.xml").use { strings ->
            val elements = strings.getElementsByTagName("string")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                if (element.getAttribute("name") == "app_name") {
                    element.textContent = name
                    return@use
                }
            }
        }
    }
}

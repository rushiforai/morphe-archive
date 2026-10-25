package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: change the launcher label (app name).
 */
@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Changes the app name shown under the launcher icon.",
    default = false
) {
    val appName by stringOption(
        name = "App name",
        key = "appName",
        default = null,
        description = "New launcher label. Required when this patch is enabled."
    )

    execute {
        val name = appName?.trim().orEmpty()
        if (name.isEmpty()) return@execute

        // Prefer strings.xml app_name / application label
        try {
            document("res/values/strings.xml").use { document ->
                val nodes = document.getElementsByTagName("string")
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as? Element ?: continue
                    val n = el.getAttribute("name")
                    if (n == "app_name" || n == "appName" || n == "application_name") {
                        el.textContent = name
                    }
                }
            }
        } catch (_: Exception) {
            // some apps omit standard strings
        }

        document("AndroidManifest.xml").use { document ->
            val appNodes = document.getElementsByTagName("application")
            if (appNodes.length > 0) {
                val app = appNodes.item(0) as Element
                // Only set literal label if not a @string reference we already fixed
                val label = app.getAttribute("android:label")
                if (label.isNullOrEmpty() || !label.startsWith("@")) {
                    app.setAttribute("android:label", name)
                }
            }
        }
    }
}

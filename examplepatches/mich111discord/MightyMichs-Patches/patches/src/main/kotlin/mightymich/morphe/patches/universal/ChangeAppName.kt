package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: override app label in AndroidManifest / strings if present.
 */
@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Sets a custom application label (best-effort).",
    default = false
) {
    val appName by stringOption(
        key = "appName",
        default = "Patched App",
        title = "App name",
        description = "Display name shown under the launcher icon."
    )

    execute {
        val name = appName?.trim().orEmpty()
        if (name.isEmpty()) return@execute

        // Try strings.xml app_name
        try {
            document("res/values/strings.xml").use { document ->
                val nodes = document.getElementsByTagName("string")
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as? Element ?: continue
                    if (el.getAttribute("name") == "app_name") {
                        el.textContent = name
                    }
                }
            }
        } catch (_: Exception) {
        }
    }
}

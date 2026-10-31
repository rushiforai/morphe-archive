package app.morphe.patches.cromite.misc.fullscreen

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Hides Cromite's Android status bar while leaving the navigation/gesture bar alone.
 *
 * Cromite's compiled APK does not preserve source style names containing Chrome/Chromium/Browser,
 * so discover the themes actually referenced by Chrome/Tabbed activities in AndroidManifest.xml
 * and patch those styles instead of guessing their names.
 */
@Suppress("unused")
val hideStatusBarPatch = resourcePatch(
    name = "Hide Android status bar",
    description = "Uses the native Force Tablet Mode switch to hide status icons in browser and Settings; requires AMOLED runtime patch.",
    default = false
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))

    execute {
        val activityThemes = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
            application?.getAttribute("android:theme")
                ?.takeIf { it.isNotBlank() }
                ?.let(activityThemes::add)

            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                val name = activity.getAttribute("android:name")
                if (!name.contains("Chrome", ignoreCase = true) &&
                    !name.contains("Chromium", ignoreCase = true) &&
                    !name.contains("Tabbed", ignoreCase = true)
                ) continue

                activity.getAttribute("android:theme")
                    .takeIf { it.isNotBlank() }
                    .let { theme ->
                        if (theme != null) activityThemes.add(theme)
                    }
            }
        }

        fun normalizeThemeName(value: String): String = value
            .removePrefix("@style/")
            .removePrefix("@android:style/")

        val targetNames = activityThemes.map(::normalizeThemeName).toSet()
        var stylesPatched = 0

        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")
            for (index in 0 until styles.length) {
                val style = styles.item(index) as? Element ?: continue
                val name = style.getAttribute("name")

                // Prefer themes referenced by the manifest. Also patch descendants whose parent is
                // one of those themes, because Chromium uses derived themes for dialogs/activities.
                val parent = style.getAttribute("parent")
                val referenced = name in targetNames || normalizeThemeName(parent) in targetNames
                if (!referenced) continue

                val items = style.getElementsByTagName("item")
                var fullscreenItem: Element? = null
                for (itemIndex in 0 until items.length) {
                    val item = items.item(itemIndex) as? Element ?: continue
                    if (item.getAttribute("name") == "android:windowFullscreen") {
                        fullscreenItem = item
                        break
                    }
                }
                if (fullscreenItem == null) {
                    fullscreenItem = document.createElement("item")
                    fullscreenItem.setAttribute("name", "android:windowFullscreen")
                    style.appendChild(fullscreenItem)
                }
                // Never force fullscreen permanently: the AMOLED runtime controls this from
                // the native force_tablet_ui_enabled preference at activity resume.
                fullscreenItem.textContent = "false"
                stylesPatched++
            }
        }

        if (stylesPatched == 0) {
            throw IllegalStateException(
                "Cromite activity themes were referenced by the manifest but not found in styles.xml: " +
                    activityThemes.joinToString()
            )
        }
    }
}

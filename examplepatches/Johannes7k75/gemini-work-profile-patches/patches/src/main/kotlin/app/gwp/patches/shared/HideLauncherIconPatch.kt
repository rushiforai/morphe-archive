package app.gwp.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

private const val LAUNCHER = "android.intent.category.LAUNCHER"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Works for any app, with or without cloning: the launcher icon comes from the LAUNCHER category in the
 * manifest, not from the package name. Activities stay startable explicitly (Gemini still opens the
 * cloned Google app).
 *
 * Android 10+ may show a synthetic "app info" icon for apps without launcher activity; it can be turned off
 * device-wide with `adb shell settings put global show_hidden_icon_apps_enabled 0`.
 */
@Suppress("unused")
val hideLauncherIconPatch = patch(
    name = "Hide launcher icon",
    description = "Removes the app's icon(s) from the launcher. Useful for the cloned Google app, " +
        "which is only opened through Gemini.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val categories = document.getElementsByTagName("category")
            val launcherCategories = (0 until categories.length).map { categories.item(it) as Element }.filter { category ->
                val name = category.getAttributeNS(ANDROID_NS, "name").ifEmpty { category.getAttribute("android:name") }
                val filter = category.parentNode as? Element
                val component = filter?.parentNode as? Element
                name == LAUNCHER && filter?.tagName == "intent-filter" && component?.tagName in setOf("activity", "activity-alias")
            }
            if (launcherCategories.isEmpty()) throw PatchException("The app has no launcher icon")
            launcherCategories.forEach { it.parentNode.removeChild(it) }
        }
    }
}

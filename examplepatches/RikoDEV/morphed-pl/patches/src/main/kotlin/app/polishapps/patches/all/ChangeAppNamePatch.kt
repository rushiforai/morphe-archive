package app.polishapps.patches.all

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val ANDROID_LABEL = "android:label"
private const val ANDROID_NAME = "android:name"
private const val ACTION_MAIN = "android.intent.action.MAIN"
private val LAUNCHER_CATEGORIES = setOf(
    "android.intent.category.LAUNCHER",
    "android.intent.category.LEANBACK_LAUNCHER",
)

private fun Element.childElements(tagName: String): List<Element> {
    val result = mutableListOf<Element>()
    var child: Node? = firstChild
    while (child != null) {
        if (child is Element && child.tagName == tagName) result += child
        child = child.nextSibling
    }
    return result
}

/** True if the component has an intent filter that puts it in the launcher (MAIN action + LAUNCHER category). */
private fun Element.isLauncherEntry() = childElements("intent-filter").any { filter ->
    filter.childElements("action").any { it.getAttribute(ANDROID_NAME) == ACTION_MAIN } &&
        filter.childElements("category").any { it.getAttribute(ANDROID_NAME) in LAUNCHER_CATEGORIES }
}

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Changes the name of the app shown in the Android launcher.",
    // Needs a name from the user, so it can never be on by default.
    default = false,
) {
    val appName = stringOption(
        key = "appName",
        title = "App name",
        description = "The name to show under the app icon in the launcher.",
        required = true,
        validator = { value -> !value.isNullOrBlank() },
    )

    execute {
        val name = appName.value?.trim().orEmpty()
        if (name.isEmpty()) {
            throw PatchException("Option 'appName' is required.")
        }

        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("No <application> element found in AndroidManifest.xml")

            // Launchers read the label of the launcher activity and fall back to the application's one,
            // so set the application label too to keep app info, recents and share sheets consistent.
            application.setAttribute(ANDROID_LABEL, name)

            // A launcher entry without its own label inherits the one of its target activity (aliases) or the
            // application, and one with a label may point at a localised string. Set the label on every
            // launcher entry so the same name shows in every language.
            val launchers = (application.childElements("activity") + application.childElements("activity-alias"))
                .filter { it.isLauncherEntry() }

            if (launchers.isEmpty()) {
                throw PatchException("No launcher activity found in AndroidManifest.xml, the app has no icon to rename")
            }

            launchers.forEach { it.setAttribute(ANDROID_LABEL, name) }
        }
    }
}

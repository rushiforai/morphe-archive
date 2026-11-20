package app.aidan.patches.canvas.customization

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change App Name",
    description = "Replaces the launcher label shown under the app icon. In-app text is unchanged.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_CANVAS)

    val appNameOption = stringOption(
        key = "appName",
        default = "Canvas",
        title = "App Name",
        description = "Launcher label shown under the app icon."
    )

    execute {
        val appName = appNameOption.value?.trim()
        if (appName.isNullOrEmpty()) {
            throw PatchException("Invalid appName: the launcher label must not be blank.")
        }

        document("AndroidManifest.xml").use { document ->
            val applications = document.getElementsByTagName("application")
            if (applications.length != 1) {
                throw PatchException(
                    "Expected exactly one <application> element in AndroidManifest.xml, found ${applications.length}."
                )
            }

            (applications.item(0) as Element).setAttribute("android:label", appName)

            var launcherCount = 0
            for (tagName in listOf("activity", "activity-alias")) {
                val components = document.getElementsByTagName(tagName)
                for (index in 0 until components.length) {
                    val component = components.item(index) as? Element ?: continue
                    if (!component.hasMainLauncherFilter()) continue
                    component.setAttribute("android:label", appName)
                    launcherCount++
                }
            }

            if (launcherCount == 0) {
                throw PatchException(
                    "No <activity> or <activity-alias> with an android.intent.action.MAIN and " +
                        "android.intent.category.LAUNCHER intent filter was found in AndroidManifest.xml."
                )
            }
        }
    }
}

private fun Element.hasMainLauncherFilter(): Boolean {
    val filters = getElementsByTagName("intent-filter")
    for (index in 0 until filters.length) {
        val filter = filters.item(index) as? Element ?: continue
        var hasMain = false
        var hasLauncher = false

        val actions = filter.getElementsByTagName("action")
        for (actionIndex in 0 until actions.length) {
            val name = (actions.item(actionIndex) as? Element)
                ?.getAttribute("android:name")
                .orEmpty()
            if (name == "android.intent.action.MAIN") hasMain = true
        }

        val categories = filter.getElementsByTagName("category")
        for (categoryIndex in 0 until categories.length) {
            val name = (categories.item(categoryIndex) as? Element)
                ?.getAttribute("android:name")
                .orEmpty()
            if (name == "android.intent.category.LAUNCHER") hasLauncher = true
        }

        if (hasMain && hasLauncher) return true
    }

    return false
}

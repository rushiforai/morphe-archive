package app.template.patches.googlephotos

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.GOOGLE_PHOTOS_COMPATIBILITY
import org.w3c.dom.Element

private const val APP_NAME_STRING = "morphe_google_photos_app_name"

@Suppress("unused")
val googlePhotosCustomAppNamePatch = resourcePatch(
    name = "Custom app name",
    description = "Changes the Google Photos app name in the launcher and system settings.",
    default = false,
) {
    compatibleWith(GOOGLE_PHOTOS_COMPATIBILITY)

    val appName by stringOption(
        key = "appName",
        default = "Photos Morphe",
        title = "App name",
        description = "Launcher name for the Google Photos app.",
        required = true,
    ) { !it.isNullOrBlank() }

    execute {
        val newAppName = appName ?: "Photos Morphe"

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml does not contain an application element.")

            application.setAttribute("android:label", "@string/$APP_NAME_STRING")

            for (tagName in listOf("activity", "activity-alias")) {
                val nodes = document.getElementsByTagName(tagName)
                for (index in 0 until nodes.length) {
                    val component = nodes.item(index) as? Element ?: continue
                    if (component.hasLauncherIntentFilter()) {
                        component.setAttribute("android:label", "@string/$APP_NAME_STRING")
                    }
                }
            }
        }

        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            val strings = document.getElementsByTagName("string")
            val existing = (0 until strings.length)
                .mapNotNull { strings.item(it) as? Element }
                .firstOrNull { it.getAttribute("name") == APP_NAME_STRING }
            val target = existing ?: document.createElement("string").also {
                it.setAttribute("name", APP_NAME_STRING)
                resources.appendChild(it)
            }
            target.textContent = newAppName
        }

        println("Custom app name: set launcher name to '$newAppName'.")
    }
}

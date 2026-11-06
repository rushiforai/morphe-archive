package app.ahmedyarub.patches.x.settings

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.asSequence
import app.morphe.util.returnEarly
import org.w3c.dom.Element

internal const val SETTINGS_ACTIVITY_CLASS = "$EXTENSION_PACKAGE/SettingsActivity;"
private const val SETTINGS_ACTIVITY_NAME = "app.ahmedyarub.extension.x.SettingsActivity"

/**
 * Declares the settings activity and opens it from a "Morphe settings" shortcut on the app icon,
 * which also works signed out. Launchers show about four shortcuts, and the app has four; the
 * settings take the Grok shortcut's place.
 */
private val settingsResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                document.createElement("activity").apply {
                    setAttribute("android:name", SETTINGS_ACTIVITY_NAME)
                    setAttribute("android:exported", "true")
                    setAttribute("android:label", "Morphe settings")
                    setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
                },
            )
        }

        document("res/values/strings.xml").use { document ->
            document.documentElement.appendChild(
                document.createElement("string").apply {
                    setAttribute("name", "morphe_x_settings")
                    textContent = "Morphe settings"
                },
            )
        }

        document("res/xml/shortcuts.xml").use { document ->
            val shortcuts = document.documentElement
            val existing = shortcuts.getElementsByTagName("shortcut").asSequence().map { it as Element }.toList()
            val template = existing.firstOrNull() ?: throw PatchException("The app has no launcher shortcuts")

            val settings = document.createElement("shortcut").apply {
                setAttribute("android:icon", template.getAttribute("android:icon"))
                setAttribute("android:enabled", "true")
                setAttribute("android:shortcutId", "morphe_settings")
                setAttribute("android:shortcutShortLabel", "@string/morphe_x_settings")
                setAttribute("android:shortcutLongLabel", "@string/morphe_x_settings")
                appendChild(
                    document.createElement("intent").apply {
                        setAttribute("android:action", "android.intent.action.VIEW")
                        setAttribute("android:targetPackage", "com.twitter.android")
                        setAttribute("android:targetClass", SETTINGS_ACTIVITY_NAME)
                    },
                )
            }

            val grok = existing.firstOrNull { it.getAttribute("android:shortcutId").contains("grok", ignoreCase = true) }
            if (grok != null) shortcuts.replaceChild(settings, grok) else shortcuts.appendChild(settings)
        }
    }
}

/** The patches' settings screen. The patches using it show their section in it. */
internal val settingsPatch = bytecodePatch(
    description = "Adds the patches' settings screen.",
) {
    dependsOn(xExtensionPatch, settingsResourcePatch)
}

private class SettingsSection(name: String) : Fingerprint(definingClass = SETTINGS_ACTIVITY_CLASS, name = name)

/** Shows the section whose placeholder is [enabledMethod] in the settings screen. */
context(_: app.morphe.patcher.patch.BytecodePatchContext)
internal fun showSettingsSection(enabledMethod: String) {
    SettingsSection(enabledMethod).method.returnEarly(true)
}

@Suppress("unused")
val importExportLoginPatch = bytecodePatch(
    name = "Import/Export login token",
    description = "Adds Export login and Import login to the Morphe settings, opened from the app icon's shortcuts. " +
        "An export holds everything needed to use your account.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(settingsPatch)

    execute { showSettingsSection("loginEnabled") }
}

@Suppress("unused")
val deleteFromDatabasePatch = bytecodePatch(
    name = "Delete from database",
    description = "Adds options to the Morphe settings to delete cached promoted entries or clear cached timelines.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(settingsPatch)

    execute { showSettingsSection("databaseEnabled") }
}

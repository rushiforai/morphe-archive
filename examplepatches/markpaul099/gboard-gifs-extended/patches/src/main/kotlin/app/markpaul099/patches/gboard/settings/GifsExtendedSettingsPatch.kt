package app.markpaul099.patches.gboard.settings

import app.markpaul099.patches.shared.Constants.ANDROID_NAMESPACE
import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.markpaul099.patches.shared.extensionPatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val SETTINGS_ACTIVITY = "app.markpaul099.extension.gifsextended.GifsExtendedSettingsActivity"
private const val SETTINGS_TITLE = "GIFs Extended"
private const val SETTINGS_SUMMARY = "Google Images GIF search and SafeSearch"

// Gboard's main settings list, and the variant used on older Android versions.
private val SETTINGS_SCREENS = listOf("res/xml/settings.xml", "res/xml/settings_legacy.xml")

// The new entry goes right after "Emojis, stickers & GIFs".
private const val EXPRESSION_SETTINGS_FRAGMENT =
    "com.google.android.apps.inputmethod.latin.preference.ExpressionSettingsFragment"

@Suppress("unused")
val gifsExtendedSettingsPatch = resourcePatch(
    name = "GIFs Extended settings",
    description = "Adds a GIFs Extended entry to Gboard's settings with the GIF search switches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(extensionPatch)

    // Runs after every patch has executed, so a renamed package is already in place.
    finalize {
        val packageName = document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activity = document.createElement("activity").apply {
                setAttributeNS(ANDROID_NAMESPACE, "android:name", SETTINGS_ACTIVITY)
                setAttributeNS(ANDROID_NAMESPACE, "android:label", SETTINGS_TITLE)
                setAttributeNS(ANDROID_NAMESPACE, "android:exported", "false")
            }
            application.appendChild(activity)
            document.documentElement.getAttribute("package")
        }

        SETTINGS_SCREENS.forEach { path ->
            document(path).use { document ->
                val elements = document.getElementsByTagName("*")
                val expression = (0 until elements.length)
                    .map { elements.item(it) as Element }
                    .firstOrNull { element ->
                        element.getAttributeNS(ANDROID_NAMESPACE, "fragment") == EXPRESSION_SETTINGS_FRAGMENT
                    } ?: throw PatchException("Emojis, stickers & GIFs entry not found in $path")

                // Same kind of entry and icon as its neighbour, so it looks native.
                val entry = document.createElement(expression.tagName).apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:key", "gifs_extended")
                    setAttributeNS(ANDROID_NAMESPACE, "android:title", SETTINGS_TITLE)
                    setAttributeNS(ANDROID_NAMESPACE, "android:summary", SETTINGS_SUMMARY)
                    setAttributeNS(ANDROID_NAMESPACE, "android:persistent", "false")
                    expression.getAttributeNS(ANDROID_NAMESPACE, "icon").takeIf { it.isNotEmpty() }?.let {
                        setAttributeNS(ANDROID_NAMESPACE, "android:icon", it)
                    }
                    appendChild(
                        document.createElement("intent").apply {
                            setAttributeNS(ANDROID_NAMESPACE, "android:targetPackage", packageName)
                            setAttributeNS(ANDROID_NAMESPACE, "android:targetClass", SETTINGS_ACTIVITY)
                        }
                    )
                }
                expression.parentNode.insertBefore(entry, expression.nextSibling)
            }
        }
    }
}

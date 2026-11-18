package org.ungoogled.patches.maps.resources

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.w3c.dom.Element

/**
 * Every manifest `<application>`/`<activity>`/`<activity-alias>` label points
 * at the same string, @string/MAPS_APP_NAME, which the language splits
 * override per locale -- editing that string directly would lose the change
 * to whichever split matches the device's locale. Instead every label is
 * repointed at a NEW string the base module alone defines, so no split can
 * shadow it. In-app copy that says "Maps" is untouched; only the launcher
 * and app-switcher labels change.
 */
private const val STOCK_LABEL = "@string/MAPS_APP_NAME"
private const val NEW_LABEL = "@string/ungoogled_app_name"
private const val UNGOOGLED_NAME = "Ungoogled Maps"

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Sets the launcher and app-switcher name, with a choice of launcher icon styles on light or dark backgrounds.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)

    val appName = stringOption(
        key = "appName",
        default = UNGOOGLED_NAME,
        title = "App name",
        description = "The name shown under the launcher icon and in the app switcher, including with either microG support patch.",
        required = true,
    )

    val appIcon by stringOption(
        key = "appIcon", title = "App icon", default = "automatic",
        description = "Automatic follows the Legacy icon patch. Original keeps Google's icon. " +
            "A supplied light or dark style overrides Legacy icon for the launcher; in-app artwork and splash screen stay unchanged.",
        values = mapsIconChoices, required = true,
    ) { it in mapsIconChoices.values }

    execute {
        applyMapsBranding(appIcon!!)
        val name = appName.value!!
        var relabeled = 0
        document("AndroidManifest.xml").use { manifest ->
            val elements = manifest.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                if (element.getAttribute("android:label") == STOCK_LABEL) {
                    element.setAttribute("android:label", NEW_LABEL)
                    relabeled++
                }
            }
        }
        if (relabeled == 0) {
            throw app.morphe.patcher.patch.PatchException("no manifest labels reference $STOCK_LABEL")
        }

        document("res/values/strings.xml").use { strings ->
            val resources = strings.getElementsByTagName("resources").item(0) as Element
            val stringElement = strings.createElement("string")
            stringElement.setAttribute("name", "ungoogled_app_name")
            stringElement.textContent = name
            resources.appendChild(stringElement)
        }
    }
}

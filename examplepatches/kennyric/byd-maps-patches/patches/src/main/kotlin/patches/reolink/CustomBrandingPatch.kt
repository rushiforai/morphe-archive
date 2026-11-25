package patches.reolink

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val BRANDING_NAME = "morphe_reolink_app_name"
private const val BRANDING_ICON = "morphe_reolink_launcher"
internal const val REOLINK_DEFAULT_NAME = "Reolink AA"
private const val DEFAULT_ICON = "aa"
private const val ORIGINAL_ICON = "original"

/** Bundled launcher icons under resources/reolink/branding/<id>/. */
internal val reolinkIconStyles = linkedMapOf(
    "Reolink AA (default)" to DEFAULT_ICON,
    "Original Reolink" to ORIGINAL_ICON,
)
internal val reolinkBrandingResources = listOf(
    "mipmap-xxxhdpi/$BRANDING_ICON.png",
    "mipmap-anydpi-v26/$BRANDING_ICON.xml",
    "drawable-nodpi/morphe_reolink_artwork.png",
    "drawable/morphe_reolink_background.xml",
    "drawable/morphe_reolink_foreground.xml",
)

private fun ResourcePatchContext.setIcon(icon: String) {
    if (icon == ORIGINAL_ICON) return
    for (resource in reolinkBrandingResources) {
        val source = object {}.javaClass.getResourceAsStream("/reolink/branding/$icon/$resource")
            ?: throw PatchException("Missing bundled Reolink icon: $icon/$resource")
        val destination = get("res/$resource")
        destination.parentFile.mkdirs()
        source.use { input -> destination.outputStream().use(input::copyTo) }
    }
    document("AndroidManifest.xml").use { manifest ->
        val application = manifest.getElementsByTagName("application").item(0) as? Element
            ?: throw PatchException("Reolink application element is missing")
        application.setAttributeNS(ANDROID_NS, "android:icon", "@mipmap/$BRANDING_ICON")
        application.setAttributeNS(ANDROID_NS, "android:roundIcon", "@mipmap/$BRANDING_ICON")
    }
}

/**
 * Names the car copy of Reolink and gives it its own launcher icon, so it can be told apart from
 * the Play Store Reolink it installs beside. Reolink's launcher entry inherits the application's
 * label and icon, so only those change; Reolink's own screens keep calling themselves Reolink.
 */
@Suppress("unused")
val reolinkCustomBrandingPatch = resourcePatch(
    name = "Custom branding",
    description = "Changes Reolink's app name and launcher icon. Defaults to \"$REOLINK_DEFAULT_NAME\" with the Reolink AA icon; " +
        "Reolink's original icon is also available.",
    default = true,
) {
    compatibleWith(reolink)
    dependsOn(originalInput)

    val customName by stringOption(
        key = "customName", title = "App name", default = REOLINK_DEFAULT_NAME,
        description = "Name shown in the launcher, on the car screen and in app information. Leave empty to keep Reolink.",
    ) { value ->
        // Surrounding whitespace is trimmed rather than rejected: an invisible trailing
        // space in the Manager's text field must not fail the whole patch run.
        value == null || (value.trim().length <= 40 && value.trim().none { it.code < 32 })
    }
    val appIcon by stringOption(
        key = "appIcon", title = "App icon", default = DEFAULT_ICON,
        description = "Launcher icon applied when patching.",
        values = reolinkIconStyles, required = true,
    ) { it in reolinkIconStyles.values }

    execute {
        setIcon(appIcon!!)
        val name = customName?.trim()?.takeUnless(String::isBlank) ?: return@execute
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Reolink application element is missing")
            application.setAttributeNS(ANDROID_NS, "android:label", "@string/$BRANDING_NAME")
        }
        document("res/values/strings.xml").use { strings ->
            val resources = strings.documentElement
            val entries = resources.getElementsByTagName("string")
            val entry = (0 until entries.length).map { entries.item(it) as Element }
                .singleOrNull { it.getAttribute("name") == BRANDING_NAME }
                ?: strings.createElement("string").also(resources::appendChild)
            entry.setAttribute("name", BRANDING_NAME)
            entry.setAttribute("translatable", "false")
            entry.setAttribute("formatted", "false")
            val escaped = name.replace("\\", "\\\\").replace("\"", "\\\"").replace("'", "\\'")
            entry.textContent = "\"${if (name.first() in "@?#") "\\" else ""}$escaped\""
        }
    }
}

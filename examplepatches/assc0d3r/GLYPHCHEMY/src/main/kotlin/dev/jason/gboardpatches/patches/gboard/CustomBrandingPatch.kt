package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val BRANDING_NAME = "morphe_gboard_app_name"
private const val BRANDING_ICON = "morphe_gboard_launcher"
private const val DEFAULT_ICON = "parakeet"
private const val ORIGINAL_ICON = "original"

/** Bundled launcher icons under resources/gboard/branding/<id>/. */
internal val gboardIconStyles = linkedMapOf(
    "Parakeet (default)" to DEFAULT_ICON,
    "Original Gboard" to ORIGINAL_ICON,
    "3D keys" to "glossy_3d",
    "Classic blue" to "classic_blue",
    "Colourful G" to "colourful",
    "Cartoon outline" to "cartoon",
    "Soft light" to "soft_light",
)
internal val gboardBrandingResources = listOf(
    "mipmap-xxxhdpi/$BRANDING_ICON.png",
    "mipmap-anydpi-v26/$BRANDING_ICON.xml",
    "drawable-nodpi/morphe_gboard_artwork.png",
    "drawable/morphe_gboard_background.xml",
    "drawable/morphe_gboard_foreground.xml",
)

private fun ResourcePatchContext.setIcon(icon: String) {
    if (icon != ORIGINAL_ICON) {
        for (resource in gboardBrandingResources) {
            val source = object {}.javaClass.getResourceAsStream("/gboard/branding/$icon/$resource")
                ?: throw PatchException("Missing bundled Gboard icon: $icon/$resource")
            val destination = get("res/$resource")
            destination.parentFile.mkdirs()
            source.use { input -> destination.outputStream().use(input::copyTo) }
        }
    }
    document("AndroidManifest.xml").use { manifest ->
        val application = manifest.getElementsByTagName("application").item(0) as? Element
            ?: throw PatchException("Gboard application element is missing")
        val (icon1, round) = if (icon == ORIGINAL_ICON) "@mipmap/ic_app" to "@mipmap/ic_app_round"
            else "@mipmap/$BRANDING_ICON" to "@mipmap/$BRANDING_ICON"
        application.setAttributeNS(ANDROID_NS, "android:icon", icon1)
        application.setAttributeNS(ANDROID_NS, "android:roundIcon", round)
    }
}

/**
 * The Parakeet launcher icon, which a patched Gboard carries unless Custom branding picks
 * another. Gboard's launcher entry and keyboard inherit the application icon.
 */
internal val gboardParakeetIconPatch = resourcePatch {
    compatibleWith(gboard)
    dependsOn(originalInput)
    execute { setIcon(DEFAULT_ICON) }
}

/**
 * Renames Gboard in the launcher, the keyboard list and app information, and picks its launcher
 * icon. Both inherit the application's label and icon in Gboard, so only those change; Gboard's
 * own screens keep calling themselves Gboard. Runs after the default Parakeet icon.
 */
@Suppress("unused")
val gboardCustomBrandingPatch = resourcePatch(
    name = "Custom branding",
    description = "Changes Gboard's app name and launcher icon. Choose the Parakeet icon (default), Gboard's original icon " +
        "or one of five other designs. The name also appears in Android's keyboard list.",
    default = false,
) {
    compatibleWith(gboard)
    dependsOn(originalInput, gboardParakeetIconPatch)

    val customName by stringOption(
        key = "customName", title = "App name",
        description = "Name shown in the launcher, Android's keyboard list and app information. Leave empty to keep Gboard.",
    ) { value ->
        // Surrounding whitespace is trimmed rather than rejected: an invisible trailing
        // space in the Manager's text field must not fail the whole patch run.
        value == null || (value.trim().length <= 40 && value.trim().none { it.code < 32 })
    }
    val appIcon by stringOption(
        key = "appIcon", title = "App icon", default = DEFAULT_ICON,
        description = "Launcher icon applied when patching.",
        values = gboardIconStyles, required = true,
    ) { it in gboardIconStyles.values }

    execute {
        val icon = appIcon!!
        if (icon != DEFAULT_ICON) setIcon(icon)
        val name = customName?.trim()?.takeUnless(String::isBlank) ?: return@execute
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Gboard application element is missing")
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

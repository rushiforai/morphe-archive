package patches.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Waze's launcher, app-switcher and Android Auto labels all point at @string/app_name_beta ("Waze Beta").
 * Every such label is repointed at a NEW string only the base module defines, so no language split can
 * shadow it. In-app copy that says "Waze" is untouched.
 */
private const val STOCK_LABEL = "@string/app_name_beta"
private const val NEW_LABEL = "@string/dewaze_app_name"
private const val DEWAZE_NAME = "De-Waze"

/** The manifest's icon reference: <application> and WazeCarAppService both use the beta icon. */
private const val STOCK_ICON = "@mipmap/launch_icon_beta"
private const val NEW_ICON = "@mipmap/dewaze_launcher"

/** Waze's own mascot silhouette, reused as the themed (monochrome) layer for every style. */
private const val STOCK_MONOCHROME = "@mipmap/launch_icon_beta_monochrome"

/** Bundled per style under /waze/launcher/<style>/: artwork, background, foreground, adaptive icon, raster. */
private val ICON_STYLES = linkedMapOf(
    "Waze (original)" to "stock",
    "Waze logo" to "logo",
    "Bold blue mascot" to "bold",
    "Mascot over folded map" to "map",
    "Cyan mascot on black" to "black",
    "Cyan long shadow" to "shadow",
)

private val ICON_RESOURCES = listOf(
    "drawable-nodpi/dewaze_artwork.png",
    "drawable/dewaze_background.xml",
    "drawable/dewaze_foreground.xml",
    "mipmap-anydpi-v26/dewaze_launcher.xml",
    "mipmap-xxxhdpi/dewaze_launcher.png",
)

@Suppress("unused")
val wazeChangeAppNameAndIconPatch = resourcePatch(
    name = "Change app name and icon",
    description = "Sets the launcher and app-switcher name, with a choice of launcher icon styles on light or dark backgrounds.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    val appName = stringOption(
        key = "appName",
        default = DEWAZE_NAME,
        title = "App name",
        description = "Shown on the home screen and Android Auto.",
        required = true,
    )

    val launcherIcon by stringOption(
        key = "launcherIcon",
        default = "stock",
        values = ICON_STYLES,
        title = "Launcher icon",
        description = "Waze's own icon, or one of five mascot styles on a light or dark background.",
        required = true,
    ) { it in ICON_STYLES.values }

    execute {
        val style = launcherIcon!!
        var relabeled = 0
        var reiconed = 0
        document("AndroidManifest.xml").use { manifest ->
            val elements = manifest.getElementsByTagName("*")
            // A compiled manifest stores the application label and icon as resource IDs
            // (@0x...), while a decoded manifest keeps @string/... names. Match both forms
            // and follow every component that shares the application's reference.
            var stockLabel: String? = null
            var stockIcon: String? = null
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                if (element.tagName == "application") {
                    if (stockLabel == null) stockLabel = element.getAttribute("android:label").takeIf { it.isNotEmpty() }
                    if (stockIcon == null) stockIcon = element.getAttribute("android:icon").takeIf { it.isNotEmpty() }
                }
            }
            val labels = linkedSetOf<String>()
            stockLabel?.let { labels += it }
            labels += STOCK_LABEL
            val icons = linkedSetOf<String>()
            stockIcon?.let { icons += it }
            icons += STOCK_ICON
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                if (element.getAttribute("android:label") in labels) {
                    element.setAttribute("android:label", NEW_LABEL)
                    relabeled++
                }
                if (style != "stock" && element.getAttribute("android:icon") in icons) {
                    element.setAttribute("android:icon", NEW_ICON)
                    reiconed++
                }
            }
        }
        if (relabeled == 0) throw PatchException("no manifest labels reference the Waze app label")
        if (style != "stock" && reiconed == 0) throw PatchException("no manifest icons reference the Waze launcher icon")

        document("res/values/strings.xml").use { strings ->
            val resources = strings.getElementsByTagName("resources").item(0) as Element
            resources.appendChild(
                strings.createElement("string").apply {
                    setAttribute("name", "dewaze_app_name")
                    textContent = appName.value!!
                },
            )
        }

        if (style == "stock") return@execute
        for (resource in ICON_RESOURCES) {
            val source = object {}.javaClass.getResourceAsStream("/waze/launcher/$style/$resource")
                ?: throw PatchException("missing bundled launcher icon resource: $style/$resource")
            val destination = get("res/$resource")
            destination.parentFile.mkdirs()
            source.use { input -> destination.outputStream().use(input::copyTo) }
        }
        // 5.27 removed the beta monochrome layer; write the adaptive icon without it
        // so the chosen icon still encodes and installs.
        get("res/mipmap-anydpi-v26/dewaze_launcher.xml").writeText(
            "<adaptive-icon xmlns:android=\"http://schemas.android.com/apk/res/android\">" +
                "<background android:drawable=\"@drawable/dewaze_background\" />" +
                "<foreground android:drawable=\"@drawable/dewaze_foreground\" />" +
            "</adaptive-icon>",
        )
    }
}

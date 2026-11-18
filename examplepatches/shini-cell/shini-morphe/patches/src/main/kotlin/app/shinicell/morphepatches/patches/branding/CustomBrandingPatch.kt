package app.shinicell.morphepatches.patches.branding

import app.morphe.patcher.patch.folderOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.shinicell.morphepatches.patches.shared.Constants.COMPATIBILITY_NAGRAM_XF
import org.w3c.dom.Element
import java.io.File

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val ADAPTIVE_ICON_NAME = "morphe_adaptive_icon_custom"
private const val MORPHE_PACKAGE_SUFFIX = ".morphe"
private val iconDensities = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

private data class BuiltInIcon(val icon: String, val roundIcon: String)

private val builtInIcons = mapOf(
    "telegram" to BuiltInIcon("@mipmap/ic_launcher_dr", "@mipmap/ic_launcher_dr_round"),
    "nagram" to BuiltInIcon("@mipmap/ic_launcher_nagram", "@mipmap/ic_launcher_nagram_round"),
    "nagram_blue" to BuiltInIcon("@mipmap/ic_launcher_nagram_blue", "@mipmap/ic_launcher_nagram_blue_round"),
    "blur_blue" to BuiltInIcon("@mipmap/ic_launcher_nagram_blur_blue", "@mipmap/ic_launcher_nagram_blur_blue_round"),
    "colorful" to BuiltInIcon("@mipmap/ic_launcher_nagram_colorful", "@mipmap/ic_launcher_nagram_colorful_round"),
    "dark_blue" to BuiltInIcon("@mipmap/ic_launcher_nagram_dark_blue", "@mipmap/ic_launcher_nagram_dark_blue_round"),
    "dark_green" to BuiltInIcon("@mipmap/ic_launcher_nagram_darkgreen", "@mipmap/ic_launcher_nagram_darkgreen_round"),
    "google" to BuiltInIcon("@mipmap/ic_launcher_nagram_google", "@mipmap/ic_launcher_nagram_google_round"),
    "neon" to BuiltInIcon("@mipmap/ic_launcher_nagram_neon", "@mipmap/ic_launcher_nagram_neon_round"),
    "niello" to BuiltInIcon("@mipmap/ic_launcher_nagram_round_niello", "@mipmap/ic_launcher_nagram_round_niello_round"),
    "nox" to BuiltInIcon("@mipmap/icon_2_launcher", "@mipmap/icon_2_launcher_round"),
    "premium" to BuiltInIcon("@mipmap/icon_3_launcher", "@mipmap/icon_3_launcher_round"),
    "aqua" to BuiltInIcon("@mipmap/icon_4_launcher", "@mipmap/icon_4_launcher_round"),
    "vintage" to BuiltInIcon("@mipmap/icon_6_launcher", "@mipmap/icon_6_launcher_round"),
    "turbo" to BuiltInIcon("@mipmap/icon_5_launcher", "@mipmap/icon_5_launcher_round"),
)

private val builtInIconChoices = linkedMapOf(
    "Telegram" to "telegram",
    "Nagram" to "nagram",
    "Nagram Blue" to "nagram_blue",
    "Blur Blue" to "blur_blue",
    "Colorful" to "colorful",
    "Dark Blue" to "dark_blue",
    "Dark Green" to "dark_green",
    "Google" to "google",
    "Neon" to "neon",
    "Niello" to "niello",
    "Nox" to "nox",
    "Premium" to "premium",
    "Aqua" to "aqua",
    "Vintage" to "vintage",
    "Turbo" to "turbo",
)

@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom branding",
    description = "Changes the Nagram XF launcher name and optionally replaces its launcher icon.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NAGRAM_XF)

    val appName by stringOption(
        key = "customName",
        title = "App name",
        description = "The display name shown under the launcher icon.",
        required = false,
    )
    val installAlongsideOriginal by stringOption(
        key = "installAlongsideOriginal",
        title = "Install alongside original",
        description = "Adds .morphe to the package name, so this APK installs separately from Nagram XF.",
        required = false,
        values = mapOf("Add .morphe suffix" to "true"),
    )
    val builtInIcon by stringOption(
        key = "builtInIcon",
        title = "Built-in icon",
        description = "Choose one of the launcher icons included in Nagram XF.",
        default = "telegram",
        values = builtInIconChoices,
    )
    val iconFolder by folderOption(
        key = "customIcon",
        title = "Custom icon",
        description = "Optional folder containing custom adaptive icon files. When set, this overrides the built-in icon.",
        required = false,
    )

    execute {
        val manifestFile = document("AndroidManifest.xml")
        manifestFile.use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element

            if (installAlongsideOriginal == "true") {
                val manifestRoot = manifest.documentElement
                val originalPackage = manifestRoot.getAttribute("package")
                val morphePackage = originalPackage + MORPHE_PACKAGE_SUFFIX
                val elements = manifest.getElementsByTagName("*")
                for (index in 0 until elements.length) {
                    val element = elements.item(index) as Element
                    val attributes = element.attributes
                    for (attributeIndex in 0 until attributes.length) {
                        val attribute = attributes.item(attributeIndex)
                        if (attribute.nodeValue.contains(originalPackage)) {
                            attribute.nodeValue = attribute.nodeValue.replace(originalPackage, morphePackage)
                        }
                    }
                }
                manifestRoot.setAttribute("package", morphePackage)
            }

            appName?.trim()?.takeIf(String::isNotEmpty)?.let { name ->
                application.setAttribute("android:label", name)
            }

            val customIconFolder = iconFolder?.trim()?.takeIf(String::isNotEmpty)
            val selectedIcon = builtInIcons[builtInIcon] ?: builtInIcons.getValue("telegram")
            val (launcherIcon, roundLauncherIcon) = if (customIconFolder != null) {
                installCustomIcon(File(customIconFolder))
                "@mipmap/$ADAPTIVE_ICON_NAME" to "@mipmap/$ADAPTIVE_ICON_NAME"
            } else {
                selectedIcon.icon to selectedIcon.roundIcon
            }

            application.setAttribute("android:icon", launcherIcon)
            application.setAttribute("android:roundIcon", roundLauncherIcon)

            val aliases = manifest.getElementsByTagName("activity-alias")
            for (index in 0 until aliases.length) {
                val alias = aliases.item(index) as Element
                // Icon aliases can override the application icon, even when only one alias is enabled.
                if (alias.getAttribute("android:name").endsWith("Icon")) {
                    alias.setAttribute("android:icon", launcherIcon)
                    alias.setAttribute("android:roundIcon", roundLauncherIcon)
                }
            }
        }
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.installCustomIcon(source: File) {
    require(source.isDirectory) { "Custom icon folder does not exist: ${source.path}" }

    var copiedIcon = false
    iconDensities.forEach { density ->
        val sourceDensity = File(source, "mipmap-$density")
        if (!sourceDensity.isDirectory) return@forEach

        val outputDensity = get("res/mipmap-$density").apply { mkdirs() }
        listOf(
            "morphe_adaptive_background_custom.png",
            "morphe_adaptive_foreground_custom.png",
        ).forEach { fileName ->
            val input = File(sourceDensity, fileName)
            require(input.isFile) { "Missing custom icon file: ${input.path}" }
            input.copyTo(File(outputDensity, fileName), overwrite = true)
        }
        copiedIcon = true
    }
    require(copiedIcon) { "No custom icon density files were found in ${source.path}" }

    val suppliedMonochrome = File(source, "drawable/morphe_adaptive_monochrome_custom.xml")
    val monochromeAttribute = if (suppliedMonochrome.isFile) {
        val drawableDirectory = get("res/drawable").apply { mkdirs() }
        suppliedMonochrome.copyTo(File(drawableDirectory, suppliedMonochrome.name), overwrite = true)
        "<monochrome android:drawable=\"@drawable/morphe_adaptive_monochrome_custom\" />"
    } else {
        ""
    }

    val adaptiveIconDirectory = get("res/mipmap-anydpi-v26").apply { mkdirs() }
    File(adaptiveIconDirectory, "$ADAPTIVE_ICON_NAME.xml").writeText(
        """
        <?xml version="1.0" encoding="utf-8"?>
        <adaptive-icon xmlns:android="$ANDROID_NAMESPACE">
            <background android:drawable="@mipmap/morphe_adaptive_background_custom" />
            <foreground android:drawable="@mipmap/morphe_adaptive_foreground_custom" />
            $monochromeAttribute
        </adaptive-icon>
        """.trimIndent(),
    )
}

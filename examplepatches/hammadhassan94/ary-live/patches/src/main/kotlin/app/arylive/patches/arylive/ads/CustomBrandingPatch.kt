package app.arylive.patches.arylive.ads

import app.arylive.patches.shared.Constants.ARY_PLUS
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Official Morphe YouTube/Reddit expose **Original** vs **Custom** app icon
 * in the Custom branding patch. Same idea for ARY PLUS:
 * - Original = real lime plus from the stock APK
 * - Custom = Morphe-style blue plus bundled with this source
 */
@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom branding",
    description = "Adds options to change the app icon and app name. Select Original for the real ARY PLUS logo, or Custom for the Morphe-style blue plus.",
    default = true,
) {
    compatibleWith(ARY_PLUS)

    val appName by stringOption(
        key = "appName",
        title = "App name",
        default = "ARY PLUS",
        description = "Launcher name shown under the icon. Default is the original ARY PLUS name.",
    )

    val appIcon by stringOption(
        key = "appIcon",
        title = "App icon",
        default = "custom",
        values = mapOf(
            "Original" to "original",
            "Custom" to "custom",
        ),
        description = """
Select Original to keep the real ARY PLUS lime-plus logo.
Select Custom to use the Morphe-style blue plus (same look as other Morphe-patched apps).

This is applied while patching. To switch later, patch again.
        """.trimIndent(),
    )

    execute {
        val name = appName?.trim().orEmpty()
        if (name.isNotEmpty()) {
            document("res/values/strings.xml").use { document ->
                val nodes = document.getElementsByTagName("string")
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as? Element ?: continue
                    if (el.getAttribute("name") == "app_name") {
                        el.textContent = name
                        break
                    }
                }
            }
        }

        when (appIcon) {
            "original", "Original" -> {
                // Keep stock launcher assets from the APK the user selected.
            }
            else -> copyBundledCustomIcons()
        }
    }
}

private val launcherFiles = listOf(
    "ic_launcher.png",
    "ic_launcher_round.png",
    "ic_launcher_foreground.png",
    "ic_launcher_background.png",
)

private val dpiFolders = listOf(
    "mipmap-mdpi",
    "mipmap-hdpi",
    "mipmap-xhdpi",
    "mipmap-xxhdpi",
    "mipmap-xxxhdpi",
)

/**
 * Write icons through [ResourcePatchContext.get], which stages files in the
 * patcher workspace. A raw `File("res/...")` is not the decoded APK on device.
 */
private fun ResourcePatchContext.copyBundledCustomIcons() {
    val loader = object {}.javaClass.classLoader
        ?: throw PatchException("Cannot load bundled Custom branding icons")

    dpiFolders.forEach { dpi ->
        launcherFiles.forEach { file ->
            val resource = "arylive/branding/$dpi/$file"
            val stream = loader.getResourceAsStream(resource)
                ?: throw PatchException("Missing bundled icon $resource")
            val dest = get("res/$dpi/$file")
            dest.parentFile?.mkdirs()
            stream.use { input ->
                dest.outputStream().use { output -> input.copyTo(output) }
            }
            delete("res/$dpi/${file.removeSuffix(".png")}.webp")
        }
    }

    loader.getResourceAsStream("arylive/branding/drawable/ic_launcher.png")?.use { input ->
        val dest = get("res/drawable/ic_launcher.png")
        dest.parentFile?.mkdirs()
        dest.outputStream().use { output -> input.copyTo(output) }
    }
}

package app.jofslash.patches.googlehealth.clone

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.jofslash.patches.googlehealth.shared.Constants.PACKAGE_NAME
import app.jofslash.patches.googlehealth.shared.replaceStrings
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import java.util.logging.Logger

private const val DEFAULT_CLONE_PACKAGE = "com.fitbit.FitbitMobile.clone"
private const val DEFAULT_CLONE_NAME = "Health Clone"
private const val DEFAULT_ICON_COLOR = "#1F1F1F"

/** The launcher icon's new background, added by the patch. */
private const val ICON_BACKGROUND = "jofslash_clone_icon_background"

/** The launcher label in the original manifest. */
private const val ORIGINAL_LABEL = "Health"

private lateinit var packageNameOption: Option<String>
private lateinit var appNameOption: Option<String>
private lateinit var iconColorOption: Option<String>

private fun clonePackageName(): String = packageNameOption.value ?: DEFAULT_CLONE_PACKAGE

private fun renamed(value: String, newPackage: String) =
    if (value.startsWith("$PACKAGE_NAME.")) newPackage + value.removePrefix(PACKAGE_NAME) else value

/**
 * Points each adaptive version of the [name] mipmap at a new background in [color], and drops its
 * monochrome layer.
 */
private fun app.morphe.patcher.patch.ResourcePatchContext.recolorIcon(name: String, color: String) {
    // Resources are decoded on request, so list them by pattern instead of walking res/.
    val icons = listDecodableFiles("res/mipmap*/$name.xml")
        .filter { get(it).readText().contains("<adaptive-icon") }
    if (icons.isEmpty()) {
        Logger.getLogger("CloneApp").warning("The launcher icon isn't adaptive, so it keeps its color")
        return
    }

    get("res/drawable/$ICON_BACKGROUND.xml").apply { parentFile.mkdirs() }.writeText(
        """
        <?xml version="1.0" encoding="utf-8"?>
        <vector xmlns:android="http://schemas.android.com/apk/res/android"
            android:width="108dp" android:height="108dp"
            android:viewportWidth="108" android:viewportHeight="108">
            <path android:fillColor="$color" android:pathData="M0,0h108v108H0z" />
        </vector>
        """.trimIndent()
    )
    icons.forEach { path ->
        document(path).use { icon ->
            val backgrounds = icon.getElementsByTagName("background")
            for (i in 0 until backgrounds.length) {
                (backgrounds.item(i) as Element).setAttribute("android:drawable", "@drawable/$ICON_BACKGROUND")
            }
            // Without a monochrome layer, launchers with themed icons show the clone in color too.
            val monochrome = icon.getElementsByTagName("monochrome")
            for (i in monochrome.length - 1 downTo 0) {
                monochrome.item(i).let { it.parentNode.removeChild(it) }
            }
        }
    }
}

/**
 * Renames the package, the app's own permissions and its content provider authorities,
 * so the patched app installs next to the official one.
 */
private val cloneAppResourcePatch = resourcePatch {
    execute {
        val newPackage = clonePackageName()

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", newPackage)

            // Name the launcher icon, so the two apps can be told apart.
            val appName = appNameOption.value?.takeIf { it.isNotBlank() } ?: DEFAULT_CLONE_NAME
            val all = document.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val element = all.item(i) as Element
                if (element.getAttribute("android:label") == ORIGINAL_LABEL) {
                    element.setAttribute("android:label", appName)
                }
            }

            // The app's own permissions, such as DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION, which
            // AndroidX builds from getPackageName() at runtime.
            for (tag in listOf("permission", "uses-permission")) {
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) as Element
                    element.setAttribute("android:name", renamed(element.getAttribute("android:name"), newPackage))
                }
            }

            // Give the launcher icon its own background color.
            val iconColor = iconColorOption.value ?: DEFAULT_ICON_COLOR
            val application = document.getElementsByTagName("application").item(0) as Element
            val icon = application.getAttribute("android:icon")
            if (!iconColor.equals("#FFFFFF", ignoreCase = true) && icon.startsWith("@mipmap/")) {
                recolorIcon(icon.removePrefix("@mipmap/"), iconColor)
            }

            // Two installs can't declare the same authority.
            val providers = document.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as Element
                val authorities = provider.getAttribute("android:authorities")
                if (authorities.isEmpty()) continue
                provider.setAttribute(
                    "android:authorities",
                    authorities.split(';').joinToString(";") {
                        if (it.startsWith("$PACKAGE_NAME.")) renamed(it, newPackage) else "${newPackage}_$it"
                    }
                )
            }
        }
    }
}

@Suppress("unused")
val cloneAppPatch = bytecodePatch(
    name = "Clone app",
    description = "Changes the package name, so the patched app installs next to the official Google Health " +
            "app instead of replacing it. Both apps sign in on their own. Push notifications don't work in " +
            "the clone, and a watch or tracker can only be paired with one of the two apps.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_CLONE_PACKAGE,
        values = mapOf("Default" to DEFAULT_CLONE_PACKAGE),
        title = "Package name",
        description = "Package name of the cloned app. Each install needs its own package name.",
        required = true,
    ) {
        it != null && it != PACKAGE_NAME && it.matches(Regex("""^[a-zA-Z]\w*(\.[a-zA-Z]\w*)+$"""))
    }

    appNameOption = stringOption(
        key = "appName",
        default = DEFAULT_CLONE_NAME,
        values = mapOf("Default" to DEFAULT_CLONE_NAME, "Health" to "Health"),
        title = "App name",
        description = "Name shown under the clone's launcher icon.",
        required = true,
    ) { !it.isNullOrBlank() }

    iconColorOption = stringOption(
        key = "iconColor",
        default = DEFAULT_ICON_COLOR,
        values = mapOf("Dark" to DEFAULT_ICON_COLOR, "Blue" to "#3084FF", "White (as the original)" to "#FFFFFF"),
        title = "Icon color",
        description = "Background color of the clone's launcher icon, as #RRGGBB, so it looks different " +
                "from the official app's white icon. The clone's icon then stays in color with themed icons " +
                "too. White keeps the original icon.",
        required = true,
    ) { it != null && it.matches(Regex("^#[0-9a-fA-F]{6}$")) }

    dependsOn(cloneAppResourcePatch)

    execute {
        // The app hands out files (photos, exports) through its own file provider by authority.
        val newPackage = clonePackageName()
        val changed = replaceStrings { value ->
            if (value == "$PACKAGE_NAME.provider") renamed(value, newPackage) else null
        }
        Logger.getLogger("CloneApp").info("Renamed $changed file provider authorities")
    }
}

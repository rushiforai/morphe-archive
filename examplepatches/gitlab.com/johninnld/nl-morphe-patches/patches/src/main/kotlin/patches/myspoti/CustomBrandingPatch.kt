package patches.myspoti

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private val iconStyles = linkedMapOf(
    "Original" to "original",
    "Classic Spotify Green" to "classic_green",
    "Elegant dark Spotify" to "elegant_dark",
    "Emerald Spotify on pitch black" to "emerald_black",
    "Dark emerald Spotify glass" to "emerald_glass",
    "Platinum Spotify on charcoal" to "platinum_charcoal",
    "Black Spotify on warm white" to "black_warm_white",
)
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val BRANDING_NAME = "morphe_myspoti_app_name"
private const val BRANDING_ICON = "morphe_myspoti_launcher"

@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom branding",
    description = "Changes the Myspoti or Orpheon launcher icon and app name. Choose from six bundled icons or keep the original.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Myspoti", packageName = "app.myspoti.stable", apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null)),
        ),
        Compatibility(
            name = "Orpheon", packageName = "app.orpheon", apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null)),
        ),
    )

    val customName by stringOption(
        key = "customName", title = "App name",
        description = "Name shown in the launcher and Android app information. Leave empty to keep the original name.",
    ) { value -> value == null || (value.length <= 200 && value.none { it.code < 32 }) }
    val appIcon by stringOption(
        key = "appIcon", title = "App icon", default = "original",
        description = "Launcher icon applied when patching. Original keeps Myspoti's current icon.",
        values = iconStyles, required = true,
    ) { it in iconStyles.values }

    execute {
        val name = customName?.takeUnless(String::isBlank)
        val icon = appIcon!!
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Myspoti application element is missing")
            if (name != null) {
                val originalLabel = application.getAttributeNS(ANDROID_NS, "label")
                val elements = application.getElementsByTagName("*")
                for (i in 0 until elements.length) {
                    val element = elements.item(i) as Element
                    val inheritsAppLabel = element.hasAttributeNS(ANDROID_NS, "label") &&
                        element.getAttributeNS(ANDROID_NS, "label") == originalLabel
                    val categories = element.getElementsByTagName("category")
                    val launcher = element.tagName in setOf("activity", "activity-alias") &&
                        (0 until categories.length).any {
                            (categories.item(it) as Element).getAttributeNS(ANDROID_NS, "name") ==
                                "android.intent.category.LAUNCHER"
                        }
                    if (inheritsAppLabel || launcher) {
                        element.setAttributeNS(ANDROID_NS, "android:label", "@string/$BRANDING_NAME")
                    }
                }
                application.setAttributeNS(ANDROID_NS, "android:label", "@string/$BRANDING_NAME")
            }
            if (icon != "original") {
                application.setAttributeNS(ANDROID_NS, "android:icon", "@mipmap/$BRANDING_ICON")
                application.setAttributeNS(ANDROID_NS, "android:roundIcon", "@mipmap/$BRANDING_ICON")
                // Explicit launcher component icons override the application icon.
                for (tag in listOf("activity", "activity-alias")) {
                    val components = application.getElementsByTagName(tag)
                    for (i in 0 until components.length) {
                        val component = components.item(i) as Element
                        val categories = component.getElementsByTagName("category")
                        if ((0 until categories.length).any {
                            (categories.item(it) as Element).getAttributeNS(ANDROID_NS, "name") ==
                                "android.intent.category.LAUNCHER"
                        }) {
                            component.setAttributeNS(ANDROID_NS, "android:icon", "@mipmap/$BRANDING_ICON")
                            if (component.hasAttributeNS(ANDROID_NS, "roundIcon")) {
                                component.setAttributeNS(ANDROID_NS, "android:roundIcon", "@mipmap/$BRANDING_ICON")
                            }
                        }
                    }
                }
            }
        }
        if (name != null) {
            document("res/values/strings.xml").use { strings ->
                val resources = strings.documentElement
                val entries = resources.getElementsByTagName("string")
                val entry = (0 until entries.length).map { entries.item(it) as Element }
                    .singleOrNull { it.getAttribute("name") == BRANDING_NAME }
                    ?: strings.createElement("string").also(resources::appendChild)
                entry.setAttribute("name", BRANDING_NAME)
                entry.setAttribute("formatted", "false")
                // Escape a leading resource-reference marker before Android encoding.
                val escaped = name.replace("\\", "\\\\").replace("\"", "\\\"")
                val literal = if (name.first() in "@?#") "\\$escaped" else escaped
                entry.textContent = "\"$literal\""
            }
        }
        if (icon != "original") {
            val resources = listOf(
                "mipmap-xxxhdpi/$BRANDING_ICON.png",
                "mipmap-anydpi-v26/$BRANDING_ICON.xml",
                "drawable-nodpi/morphe_myspoti_artwork.png",
                "drawable/morphe_myspoti_background.xml",
                "drawable/morphe_myspoti_foreground.xml",
            )
            for (resource in resources) {
                val source = object {}.javaClass.getResourceAsStream("/myspoti/branding/$icon/$resource")
                    ?: throw PatchException("Missing bundled Myspoti icon: $icon/$resource")
                val destination = get("res/$resource")
                destination.parentFile.mkdirs()
                source.use { input -> destination.outputStream().use(input::copyTo) }
            }
        }
    }
}

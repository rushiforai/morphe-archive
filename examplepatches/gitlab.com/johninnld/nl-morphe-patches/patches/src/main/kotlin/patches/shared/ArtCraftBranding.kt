package patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

internal const val ARTCRAFT_ORIGINAL_ICON = "original"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val LAUNCHER = "android.intent.category.LAUNCHER"

/**
 * Any release: declare the app's Compatibility with this single unrestricted target, because the
 * patch only touches the manifest's label and icon and adds its own resources.
 */
internal val anyArtCraftRelease = listOf(AppTarget(version = null))

/**
 * One open-source app (the artcraft-android PdfCraft, LightCraft, WordCraft and GridCraft,
 * Titanium Browser and Fennec) and the brand it can wear.
 *
 * The icon styles are ordered as the Manager dropdown shows them: the app's original icon first and
 * the brand icon second, which is the default. Each non-original style ships its resources under
 * resources/<slug>/branding/<style>/, named morphe_<slug>_*.
 */
internal class ArtCraftBrand(
    /** Declared in the app's own patch folder, where the release tooling reads its name. */
    val compatibility: Compatibility,
    val slug: String,
    val brandName: String,
    val iconStyles: Map<String, String>,
    val defaultIcon: String,
    val description: String,
    private val extraResources: Map<String, List<String>> = emptyMap(),
) {
    val appName get() = compatibility.name!!

    val nameResource get() = "morphe_${slug}_app_name"
    val iconResource get() = "morphe_${slug}_launcher"

    fun iconResources(icon: String): List<String> = if (icon == ARTCRAFT_ORIGINAL_ICON) emptyList() else listOf(
        "mipmap-xxxhdpi/$iconResource.png",
        "mipmap-anydpi-v26/$iconResource.xml",
        "drawable-nodpi/morphe_${slug}_artwork.png",
        "drawable/morphe_${slug}_background.xml",
        "drawable/morphe_${slug}_foreground.xml",
    ) + extraResources[icon].orEmpty()
}

/** Name option: surrounding whitespace is trimmed, an empty value keeps the app's own name. */
internal fun artCraftNameAccepted(value: String?) =
    value == null || (value.trim().length <= 40 && value.trim().none { it.code < 32 })

private fun Element.hasLauncherCategory(): Boolean {
    val categories = getElementsByTagName("category")
    return (0 until categories.length).any {
        (categories.item(it) as Element).getAttributeNS(ANDROID_NS, "name") == LAUNCHER
    }
}

private fun Element.isLauncherComponent() =
    (tagName == "activity" || tagName == "activity-alias") && hasLauncherCategory()

internal fun artCraftBrandingPatch(brand: ArtCraftBrand) = resourcePatch(
    name = "Custom branding",
    description = brand.description,
    default = true,
) {
    compatibleWith(brand.compatibility)

    val customName by stringOption(
        key = "customName", title = "App name", default = brand.brandName,
        description = "Name shown in the launcher and Android app information. Leave empty to keep ${brand.appName}.",
    ) { artCraftNameAccepted(it) }
    val appIcon by stringOption(
        key = "appIcon", title = "App icon", default = brand.defaultIcon,
        description = "Launcher icon applied when patching.",
        values = brand.iconStyles, required = true,
    ) { it in brand.iconStyles.values }

    execute {
        val name = customName?.trim()?.takeUnless(String::isBlank)
        val icon = appIcon!!
        val label = "@string/${brand.nameResource}"
        val launcherIcon = "@mipmap/${brand.iconResource}"

        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("${brand.appName} application element is missing")
            val components = application.getElementsByTagName("*")
            val launchers = (0 until components.length).map { components.item(it) as Element }
                .filter { it.isLauncherComponent() }
            if (launchers.isEmpty()) throw PatchException("${brand.appName} launcher activity is missing")

            if (name != null) {
                val originalLabel = application.getAttributeNS(ANDROID_NS, "label")
                application.setAttributeNS(ANDROID_NS, "android:label", label)
                // A launcher entry with its own label, or one repeating the app label, overrides the app label.
                for (launcher in launchers) {
                    if (launcher.hasAttributeNS(ANDROID_NS, "label")) {
                        launcher.setAttributeNS(ANDROID_NS, "android:label", label)
                    }
                    val filters = launcher.getElementsByTagName("intent-filter")
                    for (i in 0 until filters.length) {
                        val filter = filters.item(i) as Element
                        if (filter.hasLauncherCategory() && filter.hasAttributeNS(ANDROID_NS, "label") &&
                            filter.getAttributeNS(ANDROID_NS, "label") == originalLabel) {
                            filter.setAttributeNS(ANDROID_NS, "android:label", label)
                        }
                    }
                }
            }

            if (icon != ARTCRAFT_ORIGINAL_ICON) {
                application.setAttributeNS(ANDROID_NS, "android:icon", launcherIcon)
                application.setAttributeNS(ANDROID_NS, "android:roundIcon", launcherIcon)
                // Explicit launcher component icons override the application icon. Disabled aliases are
                // the app's own alternative icons (Fennec's icon picker), so they keep their artwork.
                for (launcher in launchers.filter { it.getAttributeNS(ANDROID_NS, "enabled") != "false" }) {
                    for (attribute in listOf("icon", "roundIcon")) {
                        if (launcher.hasAttributeNS(ANDROID_NS, attribute)) {
                            launcher.setAttributeNS(ANDROID_NS, "android:$attribute", launcherIcon)
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
                    .singleOrNull { it.getAttribute("name") == brand.nameResource }
                    ?: strings.createElement("string").also(resources::appendChild)
                entry.setAttribute("name", brand.nameResource)
                entry.setAttribute("translatable", "false")
                entry.setAttribute("formatted", "false")
                val escaped = name.replace("\\", "\\\\").replace("\"", "\\\"").replace("'", "\\'")
                entry.textContent = "\"${if (name.first() in "@?#") "\\" else ""}$escaped\""
            }
        }

        for (resource in brand.iconResources(icon)) {
            val source = ArtCraftBrand::class.java.getResourceAsStream("/${brand.slug}/branding/$icon/$resource")
                ?: throw PatchException("Missing bundled ${brand.appName} icon: $icon/$resource")
            val destination = get("res/$resource")
            destination.parentFile.mkdirs()
            source.use { input -> destination.outputStream().use(input::copyTo) }
        }
    }
}
